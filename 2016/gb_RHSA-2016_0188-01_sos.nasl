###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for sos RHSA-2016:0188-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871559");
  script_version("$Revision: 7977 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-04 09:28:58 +0100 (Mon, 04 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-02-17 06:26:03 +0100 (Wed, 17 Feb 2016)");
  script_cve_id("CVE-2015-7529");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for sos RHSA-2016:0188-01");
  script_tag(name: "summary", value: "Check the version of sos");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The sos package contains a set of utilities
that gather information from system hardware, logs, and configuration files. The
information can then be used for diagnostic purposes and debugging.

An insecure temporary file use flaw was found in the way sos created
certain sosreport files. A local attacker could possibly use this flaw to
perform a symbolic link attack to reveal the contents of sosreport files,
or in some cases modify arbitrary files and escalate their privileges on
the system. (CVE-2015-7529)

This issue was discovered by Mateusz Guzik of Red Hat.

This update also fixes the following bug:

* Previously, the sosreport tool was not collecting the /var/lib/ceph and
/var/run/ceph directories when run with the ceph plug-in enabled, causing
the generated sosreport archive to miss vital troubleshooting information
about ceph. With this update, the ceph plug-in for sosreport collects these
directories, and the generated report contains more useful information.
(BZ#1291347)

All users of sos are advised to upgrade to this updated package, which
contains backported patches to correct these issues.
");
  script_tag(name: "affected", value: "sos on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2016:0188-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2016-February/msg00027.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"sos", rpm:"sos~3.2~35.el7_2.3", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

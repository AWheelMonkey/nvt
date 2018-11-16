###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for augeas RHSA-2014:0044-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871113");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-01-21 13:43:58 +0530 (Tue, 21 Jan 2014)");
  script_cve_id("CVE-2013-6412");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for augeas RHSA-2014:0044-01");

  tag_insight = "Augeas is a utility for editing configuration. Augeas parses configuration
files in their native formats and transforms them into a tree.
Configuration changes are made by manipulating this tree and saving it back
into native configuration files. Augeas also uses 'lenses' as basic
building blocks for establishing the mapping from files into the Augeas
tree and back.

A flaw was found in the way Augeas handled certain umask settings when
creating new configuration files. This flaw could result in configuration
files being created as world writable, allowing unprivileged local users to
modify their content. (CVE-2013-6412)

This issue was discovered by the Red Hat Security Response Team.

All augeas users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. All running applications
using augeas must be restarted for the update to take effect.
";

  tag_affected = "augeas on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:0044-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-January/msg00014.html");
  script_tag(name:"summary", value:"Check for the Version of augeas");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"augeas-debuginfo", rpm:"augeas-debuginfo~1.0.0~5.el6_5.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"augeas-libs", rpm:"augeas-libs~1.0.0~5.el6_5.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

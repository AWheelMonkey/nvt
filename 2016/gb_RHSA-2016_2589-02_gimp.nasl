###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for gimp RHSA-2016:2589-02
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
  script_oid("1.3.6.1.4.1.25623.1.0.871699");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-11-04 05:42:21 +0100 (Fri, 04 Nov 2016)");
  script_cve_id("CVE-2016-4994");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for gimp RHSA-2016:2589-02");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'gimp'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The GIMP (GNU Image Manipulation Program)
is an image composition and editing program. GIMP provides a large image
manipulation toolbox, including channel operations and layers, effects, sub-pixel
imaging and anti-aliasing, and conversions, all with multi-level undo.

The following packages have been upgraded to a newer upstream version: gimp
(2.8.16), gimp-help (2.8.2). (BZ#1298226, BZ#1370595)

Security Fix(es):

  * Multiple use-after-free vulnerabilities were found in GIMP in the channel
and layer properties parsing process when loading XCF files. An attacker
could create a specially crafted XCF file which could cause GIMP to crash.
(CVE-2016-4994)

Additional Changes:

For detailed information on changes in this release, see the Red Hat
Enterprise Linux 7.3 Release Notes linked from the References section.");
  script_tag(name:"affected", value:"gimp on
  Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2016:2589-02");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2016-November/msg00025.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"gimp-help", rpm:"gimp-help~2.8.2~1.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gimp", rpm:"gimp~2.8.16~3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gimp-debuginfo", rpm:"gimp-debuginfo~2.8.16~3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gimp-libs", rpm:"gimp-libs~2.8.16~3.el7", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

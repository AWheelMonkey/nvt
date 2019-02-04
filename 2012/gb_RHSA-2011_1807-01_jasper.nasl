###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for jasper RHSA-2011:1807-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2011-December/msg00033.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870604");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-07-09 10:33:08 +0530 (Mon, 09 Jul 2012)");
  script_cve_id("CVE-2011-4516", "CVE-2011-4517");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name:"RHSA", value:"2011:1807-01");
  script_name("RedHat Update for jasper RHSA-2011:1807-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'jasper'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"jasper on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"JasPer is an implementation of Part 1 of the JPEG 2000 image compression
  standard.

  Two heap-based buffer overflow flaws were found in the way JasPer decoded
  JPEG 2000 compressed image files. An attacker could create a malicious JPEG
  2000 compressed image file that, when opened, would cause applications that
  use JasPer (such as Nautilus) to crash or, potentially, execute arbitrary
  code. (CVE-2011-4516, CVE-2011-4517)

  Red Hat would like to thank Jonathan Foote of the CERT Coordination Center
  for reporting these issues.

  Users are advised to upgrade to these updated packages, which contain a
  backported patch to correct these issues. All applications using the JasPer
  libraries (such as Nautilus) must be restarted for the update to take
  effect.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"jasper", rpm:"jasper~1.900.1~15.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"jasper-debuginfo", rpm:"jasper-debuginfo~1.900.1~15.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"jasper-libs", rpm:"jasper-libs~1.900.1~15.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for jasper CESA-2011:1807 centos6 
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

include("revisions-lib.inc");
tag_insight = "JasPer is an implementation of Part 1 of the JPEG 2000 image compression
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
  effect.";

tag_affected = "jasper on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-December/018342.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881261");
  script_version("$Revision: 8671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:13:28 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-4516", "CVE-2011-4517");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:1807");
  script_name("CentOS Update for jasper CESA-2011:1807 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of jasper");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"jasper", rpm:"jasper~1.900.1~15.el6_1.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"jasper-devel", rpm:"jasper-devel~1.900.1~15.el6_1.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"jasper-libs", rpm:"jasper-libs~1.900.1~15.el6_1.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"jasper-utils", rpm:"jasper-utils~1.900.1~15.el6_1.1", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

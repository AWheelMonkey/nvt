###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for pixman CESA-2013:1869 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881852");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-12-23 12:46:09 +0530 (Mon, 23 Dec 2013)");
  script_cve_id("CVE-2013-6425");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("CentOS Update for pixman CESA-2013:1869 centos5 ");

  tag_insight = "Pixman is a pixel manipulation library for the X Window System and Cairo.

An integer overflow, which led to a heap-based buffer overflow, was found
in the way pixman handled trapezoids. If a remote attacker could trick an 
application using pixman into rendering a trapezoid shape with specially 
crafted coordinates, it could cause the application to crash or, possibly,
execute arbitrary code with the privileges of the user running the
application. (CVE-2013-6425)

Users are advised to upgrade to these updated packages, which contain a
backported patch to correct this issue. All applications using pixman 
must be restarted for this update to take effect.
";

  tag_affected = "pixman on CentOS 5";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2013:1869");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-December/020091.html");
  script_tag(name: "summary" , value: "Check for the Version of pixman");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"pixman", rpm:"pixman~0.22.0~2.2.el5_10", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pixman-devel", rpm:"pixman-devel~0.22.0~2.2.el5_10", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

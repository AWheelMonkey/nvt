###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for apr-util CESA-2010:0950 centos4 x86_64
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
tag_insight = "The Apache Portable Runtime (APR) is a portability library used by the
  Apache HTTP Server and other projects. apr-util is a library which provides
  additional utility interfaces for APR; including support for XML parsing,
  LDAP, database interfaces, URI parsing, and more.

  It was found that certain input could cause the apr-util library to
  allocate more memory than intended in the apr_brigade_split_line()
  function. An attacker able to provide input in small chunks to an
  application using the apr-util library (such as httpd) could possibly use
  this flaw to trigger high memory consumption. (CVE-2010-1623)

  All apr-util users should upgrade to these updated packages, which contain
  a backported patch to correct this issue. Applications using the apr-util
  library, such as httpd, must be restarted for this update to take effect.";

tag_affected = "apr-util on CentOS 4";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-January/017226.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881306");
  script_version("$Revision: 8671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:20:15 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2010-1623");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2010:0950");
  script_name("CentOS Update for apr-util CESA-2010:0950 centos4 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of apr-util");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"apr-util", rpm:"apr-util~0.9.4~22.el4_8.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"apr-util-devel", rpm:"apr-util-devel~0.9.4~22.el4_8.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

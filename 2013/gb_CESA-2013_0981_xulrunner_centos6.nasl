###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for xulrunner CESA-2013:0981 centos6
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Mozilla Firefox is an open source web browser. XULRunner provides the XUL
  Runtime environment for Mozilla Firefox.

  Several flaws were found in the processing of malformed web content. A web
  page containing malicious content could cause Firefox to crash or,
  potentially, execute arbitrary code with the privileges of the user running
  Firefox. (CVE-2013-1682, CVE-2013-1684, CVE-2013-1685, CVE-2013-1686,
  CVE-2013-1687, CVE-2013-1690)

  It was found that Firefox allowed data to be sent in the body of
  XMLHttpRequest (XHR) HEAD requests. In some cases this could allow
  attackers to conduct Cross-Site Request Forgery (CSRF) attacks.
  (CVE-2013-1692)

  Timing differences in the way Firefox processed SVG image files could
  allow an attacker to read data across domains, potentially leading to
  information disclosure. (CVE-2013-1693)

  Two flaws were found in the way Firefox implemented some of its internal
  structures (called wrappers). An attacker could use these flaws to bypass
  some restrictions placed on them. This could lead to unexpected behavior or
  a potentially exploitable crash. (CVE-2013-1694, CVE-2013-1697)

  Red Hat would like to thank the Mozilla project for reporting these issues.
  Upstream acknowledges Gary Kwong, Jesse Ruderman, Andrew McCreight,
  Abhishek Arya, Mariusz Mlynski, Nils, Johnathan Kuskos, Paul Stone, Boris
  Zbarsky, and moz_bug_r_a4 as the original reporters of these issues.

  For technical details regarding these flaws, refer to the Mozilla
  security advisories for Firefox 17.0.7 ESR. You can find a link to the
  Mozilla advisories in the References section of this erratum.

  All Firefox users should upgrade to these updated packages, which contain
  Firefox version 17.0.7 ESR, which corrects these issues. After installing
  the update, Firefox must be restarted for the changes to take effect.";


tag_affected = "xulrunner on CentOS 6";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881759");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-06-27 09:59:49 +0530 (Thu, 27 Jun 2013)");
  script_cve_id("CVE-2013-1682", "CVE-2013-1684", "CVE-2013-1685", "CVE-2013-1686",
                "CVE-2013-1687", "CVE-2013-1690", "CVE-2013-1692", "CVE-2013-1693",
                "CVE-2013-1694", "CVE-2013-1697");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("CentOS Update for xulrunner CESA-2013:0981 centos6 ");

  script_xref(name: "CESA", value: "2013:0981");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-June/019809.html");
  script_tag(name: "summary" , value: "Check for the Version of xulrunner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~17.0.7~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~17.0.7~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

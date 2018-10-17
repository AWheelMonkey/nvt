###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for firefox CESA-2013:0820 centos6
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
  Firefox. (CVE-2013-0801, CVE-2013-1674, CVE-2013-1675, CVE-2013-1676,
  CVE-2013-1677, CVE-2013-1678, CVE-2013-1679, CVE-2013-1680, CVE-2013-1681)

  A flaw was found in the way Firefox handled Content Level Constructors. A
  malicious site could use this flaw to perform cross-site scripting (XSS)
  attacks. (CVE-2013-1670)

  Red Hat would like to thank the Mozilla project for reporting these issues.
  Upstream acknowledges Christoph Diehl, Christian Holler, Jesse Ruderman,
  Timothy Nikkel, Jeff Walden, Nils, Ms2ger, Abhishek Arya, and Cody Crews
  as the original reporters of these issues.

  For technical details regarding these flaws, refer to the Mozilla security
  advisories for Firefox 17.0.6 ESR. You can find a link to the Mozilla
  advisories in the References section of this erratum.

  All Firefox users should upgrade to these updated packages, which contain
  Firefox version 17.0.6 ESR, which corrects these issues. After installing
  the update, Firefox must be restarted for the changes to take effect.";


tag_affected = "firefox on CentOS 6";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.881729");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-05-17 09:52:04 +0530 (Fri, 17 May 2013)");
  script_cve_id("CVE-2013-0801", "CVE-2013-1670", "CVE-2013-1674", "CVE-2013-1675",
                "CVE-2013-1676", "CVE-2013-1677", "CVE-2013-1678", "CVE-2013-1679",
                "CVE-2013-1680", "CVE-2013-1681");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("CentOS Update for firefox CESA-2013:0820 centos6 ");

  script_xref(name: "CESA", value: "2013:0820");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2013-May/019728.html");
  script_tag(name: "summary" , value: "Check for the Version of firefox");
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

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~17.0.6~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~17.0.6~2.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~17.0.6~2.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

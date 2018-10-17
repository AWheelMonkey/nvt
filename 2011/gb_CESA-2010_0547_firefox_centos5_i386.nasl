###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for firefox CESA-2010:0547 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  Firefox. (CVE-2010-1208, CVE-2010-1209, CVE-2010-1211, CVE-2010-1212,
  CVE-2010-1214, CVE-2010-1215, CVE-2010-2752, CVE-2010-2753)
  
  A memory corruption flaw was found in the way Firefox decoded certain PNG
  images. An attacker could create a specially-crafted PNG image that, when
  opened, could cause Firefox to crash or, potentially, execute arbitrary
  code with the privileges of the user running Firefox. (CVE-2010-1205)
  
  Several same-origin policy bypass flaws were found in Firefox. An attacker
  could create a malicious web page that, when viewed by a victim, could
  steal private data from a different website the victim has loaded with
  Firefox. (CVE-2010-0654, CVE-2010-1207, CVE-2010-1213, CVE-2010-2754)
  
  A flaw was found in the way Firefox presented the location bar to a user. A
  malicious website could trick a user into thinking they are visiting the
  site reported by the location bar, when the page is actually content
  controlled by an attacker. (CVE-2010-1206)
  
  A flaw was found in the way Firefox displayed the location bar when
  visiting a secure web page. A malicious server could use this flaw to
  present data that appears to originate from a secure server, even though it
  does not. (CVE-2010-2751)
  
  A flaw was found in the way Firefox displayed certain malformed characters.
  A malicious web page could use this flaw to bypass certain string
  sanitization methods, allowing it to display malicious information to
  users. (CVE-2010-1210)
  
  For technical details regarding these flaws, refer to the Mozilla security
  advisories for Firefox 3.6.7. You can find a link to the Mozilla advisories
  in the References section of this erratum.
  
  All Firefox users should upgrade to these updated packages, which contain
  Firefox version 3.6.7, which corrects these issues. After installing the
  update, Firefox must be restarted for the changes to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "firefox on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2010-July/016821.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880628");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2010:0547");
  script_cve_id("CVE-2010-0654", "CVE-2010-1205", "CVE-2010-1206", "CVE-2010-1207", "CVE-2010-1208", "CVE-2010-1209", "CVE-2010-1210", "CVE-2010-1211", "CVE-2010-1212", "CVE-2010-1213", "CVE-2010-1214", "CVE-2010-1215", "CVE-2010-2751", "CVE-2010-2752", "CVE-2010-2753", "CVE-2010-2754");
  script_name("CentOS Update for firefox CESA-2010:0547 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of firefox");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~3.6.7~2.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.2.7~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.2.7~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

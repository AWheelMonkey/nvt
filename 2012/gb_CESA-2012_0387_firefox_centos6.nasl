###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for firefox CESA-2012:0387 centos6 
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
tag_insight = "Mozilla Firefox is an open source web browser.

  Several flaws were found in the processing of malformed web content. A web
  page containing malicious content could cause Firefox to crash or,
  potentially, execute arbitrary code with the privileges of the user
  running Firefox. (CVE-2012-0461, CVE-2012-0462, CVE-2012-0464)
  
  Two flaws were found in the way Firefox parsed certain Scalable Vector
  Graphics (SVG) image files. A web page containing a malicious SVG image
  file could cause an information leak, or cause Firefox to crash or,
  potentially, execute arbitrary code with the privileges of the user running
  Firefox. (CVE-2012-0456, CVE-2012-0457)
  
  A flaw could allow a malicious site to bypass intended restrictions,
  possibly leading to a cross-site scripting (XSS) attack if a user were
  tricked into dropping a &quot;javascript:&quot; link onto a frame. (CVE-2012-0455)
  
  It was found that the home page could be set to a &quot;javascript:&quot; link. If a
  user were tricked into setting such a home page by dragging a link to the
  home button, it could cause Firefox to repeatedly crash, eventually
  leading to arbitrary code execution with the privileges of the user
  running Firefox. (CVE-2012-0458)
  
  A flaw was found in the way Firefox parsed certain web content containing
  &quot;cssText&quot;. A web page containing malicious content could cause Firefox to
  crash or, potentially, execute arbitrary code with the privileges of the
  user running Firefox. (CVE-2012-0459)
  
  It was found that by using the DOM fullscreen API, untrusted content could
  bypass the mozRequestFullscreen security protections. A web page containing
  malicious web content could exploit this API flaw to cause user interface
  spoofing. (CVE-2012-0460)
  
  A flaw was found in the way Firefox handled pages with multiple Content
  Security Policy (CSP) headers. This could lead to a cross-site scripting
  attack if used in conjunction with a website that has a header injection
  flaw. (CVE-2012-0451)
  
  For technical details regarding these flaws, refer to the Mozilla security
  advisories for Firefox 10.0.3 ESR. You can find a link to the Mozilla
  advisories in the References section of this erratum.
  
  This update also fixes the following bugs:
  
  * When using the Traditional Chinese locale (zh-TW), a segmentation fault
  sometimes occurred when closing Firefox. (BZ#729632)
  
  * Inputting any text in the Web Console (Tools -&gt; Web Developer -&gt;
  Web Console) caused Firefox to crash. (BZ#784048)
  
  * The java-1.6.0-ibm-plugin and java-1.6.0-sun-plugin packages require the
  &q ... 

  Description truncated, for more information please check the Reference URL";

tag_affected = "firefox on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-March/018499.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881164");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:27:21 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-0451", "CVE-2012-0455", "CVE-2012-0456", "CVE-2012-0457",
                "CVE-2012-0458", "CVE-2012-0459", "CVE-2012-0460", "CVE-2012-0461",
                "CVE-2012-0462", "CVE-2012-0464");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2012:0387");
  script_name("CentOS Update for firefox CESA-2012:0387 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of firefox");
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

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~10.0.3~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~10.0.3~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~10.0.3~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

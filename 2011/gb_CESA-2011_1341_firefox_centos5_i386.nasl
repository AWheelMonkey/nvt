###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for firefox CESA-2011:1341 centos5 i386
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
  Firefox. (CVE-2011-2995)
  
  A flaw was found in the way Firefox processed the &quot;Enter&quot; keypress event. A
  malicious web page could present a download dialog while the key is
  pressed, activating the default &quot;Open&quot; action. A remote attacker could
  exploit this vulnerability by causing the browser to open malicious web
  content. (CVE-2011-2372)
  
  A flaw was found in the way Firefox handled Location headers in redirect
  responses. Two copies of this header with different values could be a
  symptom of a CRLF injection attack against a vulnerable server. Firefox now
  treats two copies of the Location, Content-Length, or Content-Disposition
  header as an error condition. (CVE-2011-3000)
  
  A flaw was found in the way Firefox handled frame objects with certain
  names. An attacker could use this flaw to cause a plug-in to grant its
  content access to another site or the local file system, violating the
  same-origin policy. (CVE-2011-2999)
  
  An integer underflow flaw was found in the way Firefox handled large
  JavaScript regular expressions. A web page containing malicious JavaScript
  could cause Firefox to access already freed memory, causing Firefox to
  crash or, potentially, execute arbitrary code with the privileges of the
  user running Firefox. (CVE-2011-2998)
  
  For technical details regarding these flaws, refer to the Mozilla security
  advisories for Firefox 3.6.23. You can find a link to the Mozilla
  advisories in the References section of this erratum.
  
  All Firefox users should upgrade to these updated packages, which contain
  Firefox version 3.6.23, which corrects these issues. After installing the
  update, Firefox must be restarted for the changes to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "firefox on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-September/018079.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881015");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-09-30 16:02:57 +0200 (Fri, 30 Sep 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:1341");
  script_cve_id("CVE-2011-2372", "CVE-2011-2995", "CVE-2011-2998", "CVE-2011-2999", "CVE-2011-3000");
  script_name("CentOS Update for firefox CESA-2011:1341 centos5 i386");

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

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~3.6.23~2.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~1.9.2.23~1.el5_7", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~1.9.2.23~1.el5_7", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

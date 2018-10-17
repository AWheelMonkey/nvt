###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for thunderbird CESA-2011:0887 centos5 x86_64
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
tag_insight = "Mozilla Thunderbird is a standalone mail and newsgroup client.

  A flaw was found in the way Thunderbird handled malformed JPEG images. An
  HTML mail message containing a malicious JPEG image could cause Thunderbird
  to crash or, potentially, execute arbitrary code with the privileges of the
  user running Thunderbird. (CVE-2011-2377)
  
  Multiple dangling pointer flaws were found in Thunderbird. Malicious HTML
  content could cause Thunderbird to crash or, potentially, execute arbitrary
  code with the privileges of the user running Thunderbird. (CVE-2011-0083,
  CVE-2011-0085, CVE-2011-2363)
  
  Several flaws were found in the processing of malformed HTML content.
  Malicious HTML content could cause Thunderbird to crash or, potentially,
  execute arbitrary code with the privileges of the user running Thunderbird.
  (CVE-2011-2364, CVE-2011-2365, CVE-2011-2374, CVE-2011-2375, CVE-2011-2376)
  
  An integer overflow flaw was found in the way Thunderbird handled
  JavaScript Array objects. Malicious content could cause Thunderbird to
  execute JavaScript with the privileges of the user running Thunderbird.
  (CVE-2011-2371)
  
  A use-after-free flaw was found in the way Thunderbird handled malformed
  JavaScript. Malicious content could cause Thunderbird to execute JavaScript
  with the privileges of the user running Thunderbird. (CVE-2011-2373)
  
  It was found that Thunderbird could treat two separate cookies (for web
  content) as interchangeable if both were for the same domain name but one
  of those domain names had a trailing &quot;.&quot; character. This violates the
  same-origin policy and could possibly lead to data being leaked to the
  wrong domain. (CVE-2011-2362)
  
  All Thunderbird users should upgrade to this updated package, which
  resolves these issues. All running instances of Thunderbird must be
  restarted for the update to take effect.";

tag_affected = "thunderbird on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-June/017624.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881364");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:35:44 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-0083", "CVE-2011-0085", "CVE-2011-2362", "CVE-2011-2363",
                "CVE-2011-2364", "CVE-2011-2365", "CVE-2011-2371", "CVE-2011-2373",
                "CVE-2011-2374", "CVE-2011-2375", "CVE-2011-2376", "CVE-2011-2377");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:0887");
  script_name("CentOS Update for thunderbird CESA-2011:0887 centos5 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of thunderbird");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~2.0.0.24~18.el5.centos", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

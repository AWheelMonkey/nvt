###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for thunderbird RHSA-2011:0887-01
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

tag_affected = "thunderbird on Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-June/msg00018.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870447");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-06-24 16:46:35 +0200 (Fri, 24 Jun 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2011:0887-01");
  script_cve_id("CVE-2011-0083", "CVE-2011-0085", "CVE-2011-2362", "CVE-2011-2363", "CVE-2011-2364", "CVE-2011-2365", "CVE-2011-2371", "CVE-2011-2373", "CVE-2011-2374", "CVE-2011-2375", "CVE-2011-2376", "CVE-2011-2377");
  script_name("RedHat Update for thunderbird RHSA-2011:0887-01");

  script_tag(name:"summary", value:"Check for the Version of thunderbird");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_4");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~1.5.0.12~39.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"thunderbird-debuginfo", rpm:"thunderbird-debuginfo~1.5.0.12~39.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

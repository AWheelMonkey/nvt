###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for firefox RHSA-2013:1140-01
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871029");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-08-08 11:32:18 +0530 (Thu, 08 Aug 2013)");
  script_cve_id("CVE-2013-1701", "CVE-2013-1709", "CVE-2013-1710", "CVE-2013-1713",
                                                  "CVE-2013-1714", "CVE-2013-1717");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for firefox RHSA-2013:1140-01");

  tag_insight = "Mozilla Firefox is an open source web browser. XULRunner provides the XUL
Runtime environment for Mozilla Firefox.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Firefox to crash or,
potentially, execute arbitrary code with the privileges of the user running
Firefox. (CVE-2013-1701)

A flaw was found in the way Firefox generated Certificate Request Message
Format (CRMF) requests. An attacker could use this flaw to perform
cross-site scripting (XSS) attacks or execute arbitrary code with the
privileges of the user running Firefox. (CVE-2013-1710)

A flaw was found in the way Firefox handled the interaction between frames
and browser history. An attacker could use this flaw to trick Firefox into
treating malicious content as if it came from the browser history, allowing
for XSS attacks. (CVE-2013-1709)

It was found that the same-origin policy could be bypassed due to the way
Uniform Resource Identifiers (URI) were checked in JavaScript. An attacker
could use this flaw to perform XSS attacks, or install malicious add-ons
from third-party pages. (CVE-2013-1713)

It was found that web workers could bypass the same-origin policy. An
attacker could use this flaw to perform XSS attacks. (CVE-2013-1714)

It was found that, in certain circumstances, Firefox incorrectly handled
Java applets. If a user launched an untrusted Java applet via Firefox, the
applet could use this flaw to obtain read-only access to files on the
user's local system. (CVE-2013-1717)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Jeff Gilbert, Henrik Skupin, moz_bug_r_a4, Cody
Crews, Federico Lanusse, and Georgi Guninski as the original reporters of
these issues.

For technical details regarding these flaws, refer to the Mozilla security
advisories for Firefox 17.0.8 ESR. You can find a link to the Mozilla
advisories in the References section of this erratum.

All Firefox users should upgrade to these updated packages, which contain
Firefox version 17.0.8 ESR, which corrects these issues. After installing
the update, Firefox must be restarted for the changes to take effect.
";

  tag_affected = "firefox on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2013:1140-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2013-August/msg00005.html");
  script_tag(name:"summary", value:"Check for the Version of firefox");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~17.0.8~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"firefox-debuginfo", rpm:"firefox-debuginfo~17.0.8~1.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~17.0.8~3.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-debuginfo", rpm:"xulrunner-debuginfo~17.0.8~3.el6_4", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~17.0.8~1.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"firefox-debuginfo", rpm:"firefox-debuginfo~17.0.8~1.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner", rpm:"xulrunner~17.0.8~3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-debuginfo", rpm:"xulrunner-debuginfo~17.0.8~3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xulrunner-devel", rpm:"xulrunner-devel~17.0.8~3.el5_9", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for thunderbird CESA-2014:0449 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.881929");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-05-05 11:18:36 +0530 (Mon, 05 May 2014)");
  script_cve_id("CVE-2014-1518", "CVE-2014-1523", "CVE-2014-1524", "CVE-2014-1529",
                "CVE-2014-1530", "CVE-2014-1531", "CVE-2014-1532");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("CentOS Update for thunderbird CESA-2014:0449 centos6 ");

  tag_insight = "Mozilla Thunderbird is a standalone mail and newsgroup client.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Thunderbird to crash or,
potentially, execute arbitrary code with the privileges of the user running
Thunderbird. (CVE-2014-1518, CVE-2014-1524, CVE-2014-1529, CVE-2014-1531)

A use-after-free flaw was found in the way Thunderbird resolved hosts in
certain circumstances. An attacker could use this flaw to crash Thunderbird
or, potentially, execute arbitrary code with the privileges of the user
running Thunderbird. (CVE-2014-1532)

An out-of-bounds read flaw was found in the way Thunderbird decoded JPEG
images. Loading an email or a web page containing a specially crafted JPEG
image could cause Thunderbird to crash. (CVE-2014-1523)

A flaw was found in the way Thunderbird handled browser navigations through
history. An attacker could possibly use this flaw to cause the address bar
of the browser to display a web page name while loading content from an
entirely different web page, which could allow for cross-site scripting
(XSS) attacks. (CVE-2014-1530)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Bobby Holley, Carsten Book, Christoph Diehl, Gary
Kwong, Jan de Mooij, Jesse Ruderman, Nathan Froyd, Christian Holler,
Abhishek Arya, Mariusz Mlynski, moz_bug_r_a4, Nils, Tyson Smith and Jesse
Schwartzentrube as the original reporters of these issues.

Note: All of the above issues cannot be exploited by a specially crafted
HTML mail message as JavaScript is disabled by default for mail messages.
They could be exploited another way in Thunderbird, for example, when
viewing the full remote content of an RSS feed.

For technical details regarding these flaws, refer to the Mozilla security
advisories for Thunderbird 24.5.0. You can find a link to the Mozilla
advisories in the References section of this erratum.

All Thunderbird users should upgrade to this updated package, which
contains Thunderbird version 24.5.0, which corrects these issues.
After installing the update, Thunderbird must be restarted for the changes
to take effect.
";

  tag_affected = "thunderbird on CentOS 6";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "CESA", value: "2014:0449");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-April/020272.html");
  script_tag(name:"summary", value:"Check for the Version of thunderbird");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~24.5.0~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

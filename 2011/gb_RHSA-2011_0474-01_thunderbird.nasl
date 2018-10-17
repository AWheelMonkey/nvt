###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for thunderbird RHSA-2011:0474-01
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
tag_insight = "Mozilla Thunderbird is a standalone mail and newsgroup client.

  Several flaws were found in the processing of malformed HTML content. An
  HTML mail message containing malicious content could possibly lead to
  arbitrary code execution with the privileges of the user running
  Thunderbird. (CVE-2011-0080)
  
  An arbitrary memory write flaw was found in the way Thunderbird handled
  out-of-memory conditions. If all memory was consumed when a user viewed a
  malicious HTML mail message, it could possibly lead to arbitrary code
  execution with the privileges of the user running Thunderbird.
  (CVE-2011-0078)
  
  An integer overflow flaw was found in the way Thunderbird handled the HTML
  frameset tag. An HTML mail message with a frameset tag containing large
  values for the &quot;rows&quot; and &quot;cols&quot; attributes could trigger this flaw,
  possibly leading to arbitrary code execution with the privileges of the
  user running Thunderbird. (CVE-2011-0077)
  
  A flaw was found in the way Thunderbird handled the HTML iframe tag. An
  HTML mail message with an iframe tag containing a specially-crafted source
  address could trigger this flaw, possibly leading to arbitrary code
  execution with the privileges of the user running Thunderbird.
  (CVE-2011-0075)
  
  A flaw was found in the way Thunderbird displayed multiple marquee
  elements. A malformed HTML mail message could cause Thunderbird to execute
  arbitrary code with the privileges of the user running Thunderbird.
  (CVE-2011-0074)
  
  A flaw was found in the way Thunderbird handled the nsTreeSelection
  element. Malformed content could cause Thunderbird to execute arbitrary
  code with the privileges of the user running Thunderbird. (CVE-2011-0073)
  
  All Thunderbird users should upgrade to this updated package, which
  resolves these issues. All running instances of Thunderbird must be
  restarted for the update to take effect.";

tag_affected = "thunderbird on Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-April/msg00028.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870426");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-05-05 07:14:22 +0200 (Thu, 05 May 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2011:0474-01");
  script_cve_id("CVE-2011-0073", "CVE-2011-0074", "CVE-2011-0075", "CVE-2011-0077", "CVE-2011-0078", "CVE-2011-0080");
  script_name("RedHat Update for thunderbird RHSA-2011:0474-01");

  script_tag(name:"summary", value:"Check for the Version of thunderbird");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
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

if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~1.5.0.12~38.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"thunderbird-debuginfo", rpm:"thunderbird-debuginfo~1.5.0.12~38.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

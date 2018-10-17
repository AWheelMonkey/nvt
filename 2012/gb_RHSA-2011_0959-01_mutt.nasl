###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for mutt RHSA-2011:0959-01
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
tag_insight = "Mutt is a text-mode mail user agent.

  A flaw was found in the way Mutt verified SSL certificates. When a server
  presented an SSL certificate chain, Mutt could ignore a server hostname
  check failure. A remote attacker able to get a certificate from a trusted
  Certificate Authority could use this flaw to trick Mutt into accepting a
  certificate issued for a different hostname, and perform man-in-the-middle
  attacks against Mutt's SSL connections. (CVE-2011-1429)

  All Mutt users should upgrade to this updated package, which contains a
  backported patch to correct this issue. All running instances of Mutt must
  be restarted for this update to take effect.";

tag_affected = "mutt on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-July/msg00017.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870615");
  script_version("$Revision: 8671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-06-06 10:34:16 +0530 (Wed, 06 Jun 2012)");
  script_cve_id("CVE-2011-1429");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_xref(name: "RHSA", value: "2011:0959-01");
  script_name("RedHat Update for mutt RHSA-2011:0959-01");

  script_tag(name: "summary" , value: "Check for the Version of mutt");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"mutt", rpm:"mutt~1.5.20~2.20091214hg736b6a.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mutt-debuginfo", rpm:"mutt-debuginfo~1.5.20~2.20091214hg736b6a.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

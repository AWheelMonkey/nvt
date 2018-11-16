###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for thunderbird RHSA-2015:1852-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.871457");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-02 07:09:49 +0200 (Fri, 02 Oct 2015)");
  script_cve_id("CVE-2015-4500", "CVE-2015-4509", "CVE-2015-4517", "CVE-2015-4519", "CVE-2015-4520", "CVE-2015-4521", "CVE-2015-4522", "CVE-2015-7174", "CVE-2015-7175", "CVE-2015-7176", "CVE-2015-7177", "CVE-2015-7180");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for thunderbird RHSA-2015:1852-01");
  script_tag(name: "summary", value: "Check the version of thunderbird");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Mozilla Thunderbird is a standalone mail and newsgroup client.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Thunderbird to crash or,
potentially, execute arbitrary code with the privileges of the user running
Thunderbird. (CVE-2015-4500, CVE-2015-4509, CVE-2015-4517, CVE-2015-4521,
CVE-2015-4522, CVE-2015-7174, CVE-2015-7175, CVE-2015-7176, CVE-2015-7177,
CVE-2015-7180)

Two information leak flaws were found in the processing of malformed web
content. A web page containing malicious content could cause Thunderbird to
disclose sensitive information or, in certain cases, crash. (CVE-2015-4519,
CVE-2015-4520)

Note: All of the above issues cannot be exploited by a specially crafted
HTML mail message because JavaScript is disabled by default for mail
messages. However, they could be exploited in other ways in Thunderbird
(for example, by viewing the full remote content of an RSS feed).

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Andrew Osmond, Olli Pettay, Andrew Sutherland,
Christian Holler, David Major, Andrew McCreight, Cameron McCormack, Ronald
Crane, Mario Gomes, and Ehsan Akhgari as the original reporters of these
issues.

For technical details regarding these flaws, refer to the Mozilla security
advisories for Thunderbird 38.3.0 You can find a link to the Mozilla
advisories in the References section of this erratum.

All Thunderbird users should upgrade to this updated package, which
contains Thunderbird version 38.3.0, which corrects these issues.
After installing the update, Thunderbird must be restarted for the changes
to take effect.
");
  script_tag(name: "affected", value: "thunderbird on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "RHSA", value: "2015:1852-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2015-October/msg00001.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~38.3.0~1.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"thunderbird-debuginfo", rpm:"thunderbird-debuginfo~38.3.0~1.el6_7", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
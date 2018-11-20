###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for firefox RHSA-2013:1812-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871093");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-12-17 11:53:04 +0530 (Tue, 17 Dec 2013)");
  script_cve_id("CVE-2013-5609", "CVE-2013-5612", "CVE-2013-5613", "CVE-2013-5614",
                "CVE-2013-5616", "CVE-2013-5618", "CVE-2013-6671");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for firefox RHSA-2013:1812-01");


  script_tag(name:"affected", value:"firefox on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"insight", value:"Mozilla Firefox is an open source web browser. XULRunner provides the XUL
Runtime environment for Mozilla Firefox.

Several flaws were found in the processing of malformed web content. A web
page containing malicious content could cause Firefox to terminate
unexpectedly or, potentially, execute arbitrary code with the privileges of
the user running Firefox. (CVE-2013-5609, CVE-2013-5616, CVE-2013-5618,
CVE-2013-6671, CVE-2013-5613)

A flaw was found in the way Firefox rendered web content with missing
character encoding information. An attacker could use this flaw to possibly
bypass same-origin inheritance and perform cross-site scripting (XSS)
attacks. (CVE-2013-5612)

It was found that certain malicious web content could bypass restrictions
applied by sandboxed iframes. An attacker could combine this flaw with
other vulnerabilities to execute arbitrary code with the privileges of the
user running Firefox. (CVE-2013-5614)

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Ben Turner, Bobby Holley, Jesse Ruderman, Christian
Holler, Masato Kinugawa, Daniel Veditz, Jesse Schwartzentruber, Nils, Tyson
Smith, and Atte Kettunen as the original reporters of these issues.

For technical details regarding these flaws, refer to the Mozilla security
advisories for Firefox 24.2.0 ESR. You can find a link to the Mozilla
advisories in the References section of this erratum.

All Firefox users should upgrade to these updated packages, which contain
Firefox version 24.2.0 ESR, which corrects these issues. After installing
the update, Firefox must be restarted for the changes to take effect.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2013:1812-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2013-December/msg00015.html");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'firefox'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(6|5)");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~24.2.0~1.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"firefox-debuginfo", rpm:"firefox-debuginfo~24.2.0~1.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~24.2.0~1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"firefox-debuginfo", rpm:"firefox-debuginfo~24.2.0~1.el5_10", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for freeradius RHSA-2012:1326-01
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
tag_insight = "FreeRADIUS is a high-performance and highly configurable free Remote
  Authentication Dial In User Service (RADIUS) server, designed to allow
  centralized authentication and authorization for a network.

  A buffer overflow flaw was discovered in the way radiusd handled the
  expiration date field in X.509 client certificates. A remote attacker could
  possibly use this flaw to crash radiusd if it were configured to use the
  certificate or TLS tunnelled authentication methods (such as EAP-TLS,
  EAP-TTLS, and PEAP). (CVE-2012-3547)

  Red Hat would like to thank Timo Warns of PRESENSE Technologies GmbH for
  reporting this issue.

  Users of FreeRADIUS are advised to upgrade to these updated packages, which
  contain a backported patch to correct this issue. After installing the
  update, radiusd will be restarted automatically.";

tag_affected = "freeradius on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2012-October/msg00003.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870840");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-10-03 09:21:11 +0530 (Wed, 03 Oct 2012)");
  script_cve_id("CVE-2012-3547");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "RHSA", value: "2012:1326-01");
  script_name("RedHat Update for freeradius RHSA-2012:1326-01");

  script_tag(name: "summary" , value: "Check for the Version of freeradius");
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

  if ((res = isrpmvuln(pkg:"freeradius", rpm:"freeradius~2.1.12~4.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"freeradius-debuginfo", rpm:"freeradius-debuginfo~2.1.12~4.el6_3", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

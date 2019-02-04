###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_3531_thunderbird_centos6.nasl 12479 2018-11-22 08:12:17Z santu $
#
# CentOS Update for thunderbird CESA-2018:3531 centos6
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.882971");
  script_version("$Revision: 12479 $");
  script_cve_id("CVE-2018-12389", "CVE-2018-12390", "CVE-2018-12392", "CVE-2018-12393");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-22 09:12:17 +0100 (Thu, 22 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-21 06:03:03 +0100 (Wed, 21 Nov 2018)");
  script_name("CentOS Update for thunderbird CESA-2018:3531 centos6 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");

  script_xref(name:"CESA", value:"2018:3531");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-November/023079.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'thunderbird'
  package(s) announced via the CESA-2018:3531 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Mozilla Thunderbird is a standalone mail and newsgroup client.

This update upgrades Thunderbird to version 60.3.0.

Security Fix(es):

* Mozilla: Memory safety bugs fixed in Firefox 63 and Firefox ESR 60.3
(CVE-2018-12390)

* Mozilla: Crash with nested event loops (CVE-2018-12392)

* Mozilla: Integer overflow during Unicode conversion while loading
JavaScript (CVE-2018-12393)

* Mozilla: Memory safety bugs fixed in Firefox ESR 60.3 (CVE-2018-12389)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Christian Holler, Bob Owen, Boris Zbarsky, Calixte
Denizet, Jason Kratzer, Jed Davis, Taegeon Lee, Philipp, Ronald Crane, Raul
Gurzau, Gary Kwong, Tyson Smith, Raymond Forbes, Bogdan Tara, Nils, r, and
Daniel Veditz as the original reporters.
");

  script_tag(name:"affected", value:"thunderbird on CentOS 6.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~60.3.0~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

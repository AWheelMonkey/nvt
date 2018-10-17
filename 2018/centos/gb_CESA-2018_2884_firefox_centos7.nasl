###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_2884_firefox_centos7.nasl 11902 2018-10-15 09:26:53Z santu $
#
# CentOS Update for firefox CESA-2018:2884 centos7
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882959");
  script_version("$Revision: 11902 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 11:26:53 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-10 06:50:32 +0200 (Wed, 10 Oct 2018)");
  script_cve_id("CVE-2018-12386", "CVE-2018-12387");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for firefox CESA-2018:2884 centos7 ");
  script_tag(name:"summary", value:"Check the version of firefox");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Mozilla Firefox is an open-source web browser,
  designed for standards compliance, performance, and portability.

This update upgrades Firefox to version 60.2.2 ESR.

Security Fix(es):

* Mozilla: type confusion in JavaScript (CVE-2018-12386)

* Mozilla: stack out-of-bounds read in Array.prototype.push
(CVE-2018-12387)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank the Mozilla project for reporting these issues.
The upstream acknowledges Niklas Baumstark, Samuel Gro�, and Bruno Keith as
the original reporters, via Beyond Security's SecuriTeam Secure Disclosure
program.
");
  script_tag(name:"affected", value:"firefox on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:2884");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-October/023051.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~60.2.2~1.el7.centos", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

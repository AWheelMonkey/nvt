###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_2834_firefox_centos6.nasl 12767 2018-12-12 08:39:09Z asteins $
#
# CentOS Update for firefox CESA-2018:2834 centos6
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
  script_oid("1.3.6.1.4.1.25623.1.0.882946");
  script_version("$Revision: 12767 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 09:39:09 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-10-03 17:02:08 +0530 (Wed, 03 Oct 2018)");
  script_cve_id("CVE-2018-12383", "CVE-2018-12385");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for firefox CESA-2018:2834 centos6 ");
  script_tag(name:"summary", value:"Check the version of firefox");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Mozilla Firefox is an open-source web browser,
  designed for standards compliance, performance, and portability.

This update upgrades Firefox to version 60.2.1 ESR.

Security Fix(es):

* Mozilla: Crash in TransportSecurityInfo due to cached data
(CVE-2018-12385)

* Mozilla: Setting a master password post-Firefox 58 does not delete
unencrypted previously stored passwords (CVE-2018-12383)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank the Mozilla project for reporting these issues.
Upstream acknowledges Philipp and Jurgen Gaeremyn as the original
reporters.
");
  script_tag(name:"affected", value:"firefox on CentOS 6");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:2834");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-September/023026.html");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"firefox", rpm:"firefox~60.2.1~1.el6.centos", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

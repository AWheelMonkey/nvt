###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_2916_spamassassin_centos7.nasl 12767 2018-12-12 08:39:09Z asteins $
#
# CentOS Update for spamassassin CESA-2018:2916 centos7
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
  script_oid("1.3.6.1.4.1.25623.1.0.882963");
  script_version("$Revision: 12767 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-12 09:39:09 +0100 (Wed, 12 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-10-16 06:20:29 +0200 (Tue, 16 Oct 2018)");
  script_cve_id("CVE-2017-15705", "CVE-2018-11781");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for spamassassin CESA-2018:2916 centos7 ");
  script_tag(name:"summary", value:"Check the version of spamassassin");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"The SpamAssassin tool provides a way to
  reduce unsolicited commercial email (spam) from incoming email.

Security Fix(es):

* spamassassin: Certain unclosed tags in crafted emails allow for scan
timeouts and result in denial of service (CVE-2017-15705)

* spamassassin: Local user code injection in the meta rule syntax
(CVE-2018-11781)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");
  script_tag(name:"affected", value:"spamassassin on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:2916");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-October/023065.html");
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

  if ((res = isrpmvuln(pkg:"spamassassin", rpm:"spamassassin~3.4.0~4.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

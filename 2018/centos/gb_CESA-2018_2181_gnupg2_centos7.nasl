###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_2181_gnupg2_centos7.nasl 10778 2018-08-06 02:57:15Z ckuersteiner $
#
# CentOS Update for gnupg2 CESA-2018:2181 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882921");
  script_version("$Revision: 10778 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-06 04:57:15 +0200 (Mon, 06 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-14 05:51:50 +0200 (Sat, 14 Jul 2018)");
  script_cve_id("CVE-2018-12020");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for gnupg2 CESA-2018:2181 centos7 ");
  script_tag(name:"summary", value:"Check the version of gnupg2");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The GNU Privacy Guard (GnuPG or GPG) is a tool
  for encrypting data and creating digital signatures, compliant with OpenPGP and
  S/MIME standards.

Security Fix(es):

* gnupg2: Improper sanitization of filenames allows for the display of fake
status messages and the bypass of signature verification (CVE-2018-12020)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");
  script_tag(name:"affected", value:"gnupg2 on CentOS 7");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"CESA", value:"2018:2181");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-July/022963.html");
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

  if ((res = isrpmvuln(pkg:"gnupg2", rpm:"gnupg2~2.0.22~5.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"gnupg2-smime", rpm:"gnupg2-smime~2.0.22~5.el7_5", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

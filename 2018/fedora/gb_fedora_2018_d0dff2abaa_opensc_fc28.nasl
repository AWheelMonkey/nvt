###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_d0dff2abaa_opensc_fc28.nasl 11820 2018-10-10 12:13:33Z santu $
#
# Fedora Update for opensc FEDORA-2018-d0dff2abaa
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
  script_oid("1.3.6.1.4.1.25623.1.0.875145");
  script_version("$Revision: 11820 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-10 14:13:33 +0200 (Wed, 10 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-06 08:37:57 +0200 (Sat, 06 Oct 2018)");
  script_cve_id("CVE-2018-16418", "CVE-2018-16419", "CVE-2018-16420", "CVE-2018-16421",
                "CVE-2018-16423", "CVE-2018-16424", "CVE-2018-16425", "CVE-2018-16426",
                "CVE-2018-16427", "CVE-2018-16391", "CVE-2018-16392", "CVE-2018-16393",
                "CVE-2018-16422");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for opensc FEDORA-2018-d0dff2abaa");
  script_tag(name:"summary", value:"Check the version of opensc");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"OpenSC provides a set of libraries and utilities
  to work with smart cards. Its main focus is on cards that support cryptographic
  operations, and facilitate their use in security applications such as authentication,
  mail encryption and digital signatures. OpenSC implements the PKCS#11 API so
  applications supporting this API (such as Mozilla Firefox and Thunderbird) can
  use it. On the card OpenSC implements the PKCS#15 standard and aims to be compatible
  with every software/card that does so, too.
");
  script_tag(name:"affected", value:"opensc on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-d0dff2abaa");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SQRD3BF4XGFYMRPGT7M7LNIZGIGYGOIZ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"opensc", rpm:"opensc~0.19.0~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

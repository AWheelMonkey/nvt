###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_bc22d6c7bc_samba_fc28.nasl 11110 2018-08-25 05:03:07Z santu $
#
# Fedora Update for samba FEDORA-2018-bc22d6c7bc
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
  script_oid("1.3.6.1.4.1.25623.1.0.874976");
  script_version("$Revision: 11110 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-25 07:03:07 +0200 (Sat, 25 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-21 06:55:59 +0200 (Tue, 21 Aug 2018)");
  script_cve_id("CVE-2018-1139", "CVE-2018-1140", "CVE-2018-10858", "CVE-2018-10918",
                "CVE-2018-10919", "CVE-2018-1050", "CVE-2018-1057");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for samba FEDORA-2018-bc22d6c7bc");
  script_tag(name:"summary", value:"Check the version of samba");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"Samba is the standard Windows interoperability
suite of programs for Linux and Unix.
");
  script_tag(name:"affected", value:"samba on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-bc22d6c7bc");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/JLO2ZIZN3LCSYBMKQC6WDL5AJYSE2UG2");
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

  if ((res = isrpmvuln(pkg:"samba", rpm:"samba~4.8.4~0.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

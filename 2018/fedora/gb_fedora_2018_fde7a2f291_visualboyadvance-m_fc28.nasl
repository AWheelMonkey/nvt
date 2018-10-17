###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_fde7a2f291_visualboyadvance-m_fc28.nasl 10502 2018-07-13 13:19:46Z santu $
#
# Fedora Update for visualboyadvance-m FEDORA-2018-fde7a2f291
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
  script_oid("1.3.6.1.4.1.25623.1.0.874790");
  script_version("$Revision: 10502 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-13 15:19:46 +0200 (Fri, 13 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-12 06:10:43 +0200 (Thu, 12 Jul 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for visualboyadvance-m FEDORA-2018-fde7a2f291");
  script_tag(name:"summary", value:"Check the version of visualboyadvance-m");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"VisualBoyAdvance-M is a Nintendo Game Boy 
Emulator with high compatibility with commercial games. It emulates the Nintendo 
Game Boy Advance hand held console, in addition to the original Game Boy hand 
held systems and its Super and Color variants. VBA-M is a continued development 
of the now inactive VisualBoy Advance project, with many improvements from 
various developments of VBA.");
  script_tag(name:"affected", value:"visualboyadvance-m on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-fde7a2f291");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/USZKOLW3CG33YYLIEDCB7K2WP2N4NRNF");
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

  if ((res = isrpmvuln(pkg:"visualboyadvance-m", rpm:"visualboyadvance-m~2.1.0~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

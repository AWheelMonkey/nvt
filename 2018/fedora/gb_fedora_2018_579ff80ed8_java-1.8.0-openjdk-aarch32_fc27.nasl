###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_579ff80ed8_java-1.8.0-openjdk-aarch32_fc27.nasl 10199 2018-06-14 13:09:24Z santu $
#
# Fedora Update for java-1.8.0-openjdk-aarch32 FEDORA-2018-579ff80ed8
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
  script_oid("1.3.6.1.4.1.25623.1.0.874660");
  script_version("$Revision: 10199 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-14 15:09:24 +0200 (Thu, 14 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-09 06:01:36 +0200 (Sat, 09 Jun 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for java-1.8.0-openjdk-aarch32 FEDORA-2018-579ff80ed8");
  script_tag(name:"summary", value:"Check the version of java-1.8.0-openjdk-aarch32");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"A preview release of the upstream OpenJDK 
AArch32 porting project. The OpenJDK runtime environment.
");
  script_tag(name:"affected", value:"java-1.8.0-openjdk-aarch32 on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-579ff80ed8");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/POEAYALOSAKKU7NF5SVA7IKSXASGKCPR");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"java-1.8.0-openjdk-aarch32", rpm:"java-1.8.0-openjdk-aarch32~1.8.0.171~1.180511.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

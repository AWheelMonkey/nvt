###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_a5e45fc9f7_epiphany_fc28.nasl 10547 2018-07-20 07:18:47Z ckuersteiner $
#
# Fedora Update for epiphany FEDORA-2018-a5e45fc9f7
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
  script_oid("1.3.6.1.4.1.25623.1.0.874680");
  script_version("$Revision: 10547 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-20 09:18:47 +0200 (Fri, 20 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-06-16 06:01:17 +0200 (Sat, 16 Jun 2018)");
  script_cve_id("CVE-2018-11396", "CVE-2018-12016");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for epiphany FEDORA-2018-a5e45fc9f7");
  script_tag(name:"summary", value:"Check the version of epiphany");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"Epiphany is the web browser for the GNOME 
desktop. Its goal is to be simple and easy to use. Epiphany ties together many 
GNOME components in order to let you focus on the Web content, instead of the 
browser application.
");
  script_tag(name:"affected", value:"epiphany on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-a5e45fc9f7");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIJI45P346UCB7GTZTIOP5BTGZGTPE5X");
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

  if ((res = isrpmvuln(pkg:"epiphany", rpm:"epiphany~3.28.3.1~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

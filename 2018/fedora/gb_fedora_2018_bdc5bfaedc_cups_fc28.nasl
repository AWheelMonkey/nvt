###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_bdc5bfaedc_cups_fc28.nasl 10692 2018-07-31 13:51:55Z santu $
#
# Fedora Update for cups FEDORA-2018-bdc5bfaedc
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
  script_oid("1.3.6.1.4.1.25623.1.0.874863");
  script_version("$Revision: 10692 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-31 15:51:55 +0200 (Tue, 31 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-29 06:09:26 +0200 (Sun, 29 Jul 2018)");
  script_cve_id("CVE-2018-4180", "CVE-2018-4181", "CVE-2018-4182", "CVE-2018-4183");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for cups FEDORA-2018-bdc5bfaedc");
  script_tag(name:"summary", value:"Check the version of cups");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"CUPS printing system provides a portable 
printing layer for UNIX operating systems. It has been developed by Apple Inc.
to promote a standard printing solution for all UNIX vendors and users.
CUPS provides the System V and Berkeley command-line interfaces.
");
  script_tag(name:"affected", value:"cups on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-bdc5bfaedc");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5CDW7PAQIBDYEQC5M3UYPLJOXOGFJ7BY");
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

  if ((res = isrpmvuln(pkg:"cups", rpm:"cups~2.2.6~16.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

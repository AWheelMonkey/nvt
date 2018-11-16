###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_8e4d871867_samba_fc27.nasl 12296 2018-11-09 15:51:28Z mmartin $
#
# Fedora Update for samba FEDORA-2018-8e4d871867
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
  script_oid("1.3.6.1.4.1.25623.1.0.874979");
  script_version("$Revision: 12296 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 16:51:28 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-08-22 06:58:16 +0200 (Wed, 22 Aug 2018)");
  script_cve_id("CVE-2018-1139", "CVE-2018-1140", "CVE-2018-10858", "CVE-2018-10918",
                "CVE-2018-10919", "CVE-2018-1050", "CVE-2018-1057", "CVE-2017-14746",
                "CVE-2017-15275");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for samba FEDORA-2018-8e4d871867");
  script_tag(name:"summary", value:"Check the version of samba");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
on the target host.");
  script_tag(name:"insight", value:"Samba is the standard Windows interoperability
suite of programs for Linux and Unix.
");
  script_tag(name:"affected", value:"samba on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-8e4d871867");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/7YJYQHQW2OGFNOT7P6SZ5G7A4EDHC2ND");
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

  if ((res = isrpmvuln(pkg:"samba", rpm:"samba~4.7.9~0.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

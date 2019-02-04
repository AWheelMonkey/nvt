###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_a55f292297_mariadb-connector-c_fc28.nasl 12882 2018-12-27 07:14:01Z santu $
#
# Fedora Update for mariadb-connector-c FEDORA-2018-a55f292297
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.875373");
  script_version("$Revision: 12882 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-27 08:14:01 +0100 (Thu, 27 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-24 04:27:14 +0100 (Mon, 24 Dec 2018)");
  script_name("Fedora Update for mariadb-connector-c FEDORA-2018-a55f292297");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-a55f292297");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QW6FKCBC2V5OAUZJD2H6RWVZOK22WPLU");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'mariadb-connector-c'
  package(s) announced via the FEDORA-2018-a55f292297 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The MariaDB Native Client library (C driver) is used to connect applications
developed in C/C++ to MariaDB and MySQL databases.
");

  script_tag(name:"affected", value:"mariadb-connector-c on Fedora 28.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"mariadb-connector-c", rpm:"mariadb-connector-c~3.0.7~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

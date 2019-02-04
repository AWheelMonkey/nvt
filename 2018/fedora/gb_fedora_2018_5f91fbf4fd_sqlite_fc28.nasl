###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_5f91fbf4fd_sqlite_fc28.nasl 12913 2018-12-31 10:50:43Z santu $
#
# Fedora Update for sqlite FEDORA-2018-5f91fbf4fd
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
  script_oid("1.3.6.1.4.1.25623.1.0.875378");
  script_version("$Revision: 12913 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-31 11:50:43 +0100 (Mon, 31 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-29 04:30:37 +0100 (Sat, 29 Dec 2018)");
  script_name("Fedora Update for sqlite FEDORA-2018-5f91fbf4fd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-5f91fbf4fd");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QNF3H6IA6ENWUVHACVFXGRNFKWTVY2VH");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'sqlite'
  package(s) announced via the FEDORA-2018-5f91fbf4fd advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"SQLite is a C library that implements an SQL database engine. A large
subset of SQL92 is supported. A complete database is stored in a
single disk file. The API is designed for convenience and ease of use.
Applications that link against SQLite can enjoy the power and
flexibility of an SQL database without the administrative hassles of
supporting a separate database server.  Version 2 and version 3 binaries
are named to permit each to be installed on a single host
");

  script_tag(name:"affected", value:"sqlite on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"sqlite", rpm:"sqlite~3.22.0~5.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

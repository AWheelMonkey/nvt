###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_cb337fb199_libmspack_fc28.nasl 13374 2019-01-31 07:19:48Z asteins $
#
# Fedora Update for libmspack FEDORA-2018-cb337fb199
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
  script_oid("1.3.6.1.4.1.25623.1.0.875260");
  script_version("$Revision: 13374 $");
  script_cve_id("CVE-2018-14680", "CVE-2018-14681", "CVE-2018-14682",
                "CVE-2018-18584", "CVE-2018-18585", "CVE-2018-14679");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-31 08:19:48 +0100 (Thu, 31 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-13 06:19:12 +0100 (Tue, 13 Nov 2018)");
  script_name("Fedora Update for libmspack FEDORA-2018-cb337fb199");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-cb337fb199");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GQ74QNU46BU7FNK7VJ5B7HQLX37AVARD");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libmspack'
  package(s) announced via the FEDORA-2018-cb337fb199 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The purpose of libmspack is to provide both compression and decompression of
some loosely related file formats used by Microsoft.
");

  script_tag(name:"affected", value:"libmspack on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"libmspack", rpm:"libmspack~0.9.1~0.1.alpha.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

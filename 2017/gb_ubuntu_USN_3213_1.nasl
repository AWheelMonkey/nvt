###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libgd2 USN-3213-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843069");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-03-01 05:46:21 +0100 (Wed, 01 Mar 2017)");
  script_cve_id("CVE-2016-10166", "CVE-2016-10167", "CVE-2016-10168", "CVE-2016-6906", "CVE-2016-6912", "CVE-2016-9317", "CVE-2016-9933");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for libgd2 USN-3213-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'libgd2'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Stefan Esser discovered that the GD library incorrectly handled memory when
processing certain images. If a user or automated system were tricked into
processing a specially crafted image, an attacker could cause a denial of
service, or possibly execute arbitrary code. This issue only affected
Ubuntu 14.04 LTS, Ubuntu 16.04 LTS and Ubuntu 16.10. (CVE-2016-10166)

It was discovered that the GD library incorrectly handled certain malformed
images. If a user or automated system were tricked into processing a
specially crafted image, an attacker could cause a denial of service.
(CVE-2016-10167)

It was discovered that the GD library incorrectly handled certain malformed
images. If a user or automated system were tricked into processing a
specially crafted image, an attacker could cause a denial of service, or
possibly execute arbitrary code. (CVE-2016-10168)

Ibrahim El-Sayed discovered that the GD library incorrectly handled certain
malformed TGA images. If a user or automated system were tricked into
processing a specially crafted TGA image, an attacker could cause a denial
of service. This issue only affected Ubuntu 14.04 LTS, Ubuntu 16.04 LTS and
Ubuntu 16.10. (CVE-2016-6906)

Ibrahim El-Sayed discovered that the GD library incorrectly handled certain
malformed WebP images. If a user or automated system were tricked into
processing a specially crafted WebP image, an attacker could cause a denial
of service, or possibly execute arbitrary code. This issue only affected
Ubuntu 14.04 LTS, Ubuntu 16.04 LTS and Ubuntu 16.10. (CVE-2016-6912)

It was discovered that the GD library incorrectly handled creating
oversized images. If a user or automated system were tricked into creating
a specially crafted image, an attacker could cause a denial of service.
(CVE-2016-9317)

It was discovered that the GD library incorrectly handled filling certain
images. If a user or automated system were tricked into filling an image,
an attacker could cause a denial of service. (CVE-2016-9933)");
  script_tag(name:"affected", value:"libgd2 on Ubuntu 16.10,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3213-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3213-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|16\.10|12\.04 LTS|16\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libgd3", ver:"2.1.0-3ubuntu0.6", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"libgd3", ver:"2.2.1-1ubuntu3.3", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libgd2-noxpm", ver:"2.0.36~rc1~dfsg-6ubuntu2.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgd2-xpm", ver:"2.0.36~rc1~dfsg-6ubuntu2.4", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libgd3", ver:"2.1.1-4ubuntu0.16.04.6", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
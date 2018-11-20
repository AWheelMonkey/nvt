###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for php5 USN-3196-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843051");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-02-15 05:49:31 +0100 (Wed, 15 Feb 2017)");
  script_cve_id("CVE-2014-9912", "CVE-2016-7478", "CVE-2016-7479", "CVE-2016-9137",
		"CVE-2016-9934", "CVE-2016-9935", "CVE-2016-10158", "CVE-2016-10159",
		"CVE-2016-10160", "CVE-2016-10161");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for php5 USN-3196-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'php5'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that PHP incorrectly
  handled certain arguments to the locale_get_display_name function. A remote
  attacker could use this issue to cause PHP to crash, resulting in a denial of
  service, or possibly execute arbitrary code. (CVE-2014-9912)

It was discovered that PHP incorrectly handled certain invalid objects when
unserializing data. A remote attacker could use this issue to cause PHP to
hang, resulting in a denial of service. (CVE-2016-7478)

It was discovered that PHP incorrectly handled certain invalid objects when
unserializing data. A remote attacker could use this issue to cause PHP to
crash, resulting in a denial of service, or possibly execute arbitrary
code. (CVE-2016-7479)

It was discovered that PHP incorrectly handled certain invalid objects when
unserializing data. A remote attacker could use this issue to cause PHP to
crash, resulting in a denial of service, or possibly execute arbitrary
code. This issue only applied to Ubuntu 14.04 LTS. (CVE-2016-9137)

It was discovered that PHP incorrectly handled unserializing certain
wddxPacket XML documents. A remote attacker could use this issue to cause
PHP to crash, resulting in a denial of service. (CVE-2016-9934)

It was discovered that PHP incorrectly handled unserializing certain
wddxPacket XML documents. A remote attacker could use this issue to cause
PHP to crash, resulting in a denial of service, or possibly execute
arbitrary code. (CVE-2016-9935)

It was discovered that PHP incorrectly handled certain EXIF data. A remote
attacker could use this issue to cause PHP to crash, resulting in a denial
of service. (CVE-2016-10158)

It was discovered that PHP incorrectly handled certain PHAR archives. A
remote attacker could use this issue to cause PHP to crash or consume
resources, resulting in a denial of service. (CVE-2016-10159)

It was discovered that PHP incorrectly handled certain PHAR archives. A
remote attacker could use this issue to cause PHP to crash, resulting in a
denial of service, or possibly execute arbitrary code. (CVE-2016-10160)

It was discovered that PHP incorrectly handled certain invalid objects when
unserializing data. A remote attacker could use this issue to cause PHP to
crash, resulting in a denial of service. (CVE-2016-10161)");
  script_tag(name:"affected", value:"php5 on Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3196-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3196-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php5", ver:"5.5.9+dfsg-1ubuntu4.21", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cgi", ver:"5.5.9+dfsg-1ubuntu4.21", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cli", ver:"5.5.9+dfsg-1ubuntu4.21", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-fpm", ver:"5.5.9+dfsg-1ubuntu4.21", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libapache2-mod-php5", ver:"5.3.10-1ubuntu3.26", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cgi", ver:"5.3.10-1ubuntu3.26", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-cli", ver:"5.3.10-1ubuntu3.26", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"php5-fpm", ver:"5.3.10-1ubuntu3.26", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

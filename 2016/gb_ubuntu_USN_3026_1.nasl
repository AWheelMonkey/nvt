###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libimobiledevice USN-3026-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842820");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-07-06 05:25:48 +0200 (Wed, 06 Jul 2016)");
  script_cve_id("CVE-2016-5104");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for libimobiledevice USN-3026-1");
  script_tag(name:"summary", value:"Check the version of libimobiledevice");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that libimobiledevice
  incorrectly handled socket permissions. A remote attacker could use this issue
  to access services on iOS devices, contrary to expectations.");
  script_tag(name:"affected", value:"libimobiledevice on Ubuntu 16.04 LTS,
  Ubuntu 15.10,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3026-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3026-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|16\.04 LTS|15\.10)");
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

  if ((res = isdpkgvuln(pkg:"libimobiledevice4:i386", ver:"1.1.5+git20140313.bafe6a9e-0ubuntu1.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libimobiledevice4:amd64", ver:"1.1.5+git20140313.bafe6a9e-0ubuntu1.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libimobiledevice6:i386", ver:"1.2.0+dfsg-3~ubuntu0.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libimobiledevice6:amd64", ver:"1.2.0+dfsg-3~ubuntu0.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"libimobiledevice4:i386", ver:"1.1.6+dfsg-3.1ubuntu0.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libimobiledevice4:amd64", ver:"1.1.6+dfsg-3.1ubuntu0.1", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

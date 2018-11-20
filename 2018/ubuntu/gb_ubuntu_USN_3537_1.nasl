###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3537_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for mysql-5.7 USN-3537-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843430");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-01-23 07:38:42 +0100 (Tue, 23 Jan 2018)");
  script_cve_id("CVE-2018-2562", "CVE-2018-2565", "CVE-2018-2573", "CVE-2018-2576",
                "CVE-2018-2583", "CVE-2018-2586", "CVE-2018-2590", "CVE-2018-2600",
                "CVE-2018-2612", "CVE-2018-2622", "CVE-2018-2640", "CVE-2018-2645",
                "CVE-2018-2646", "CVE-2018-2647", "CVE-2018-2665", "CVE-2018-2667",
                "CVE-2018-2668", "CVE-2018-2696", "CVE-2018-2703");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for mysql-5.7 USN-3537-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'mysql-5.7'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple security issues were discovered in
  MySQL and this update includes new upstream MySQL versions to fix these issues.
  MySQL has been updated to 5.5.59 in Ubuntu 14.04 LTS. Ubuntu 16.04 LTS, and
  Ubuntu 17.10 have been updated to MySQL 5.7.21. In addition to security fixes,
  the updated packages contain bug fixes, new features, and possibly incompatible
  changes. Please see the following for more information:
  http://dev.mysql.com/doc/relnotes/mysql/5.5/en/news-5-5-59.html
  http://dev.mysql.com/doc/relnotes/mysql/5.7/en/news-5-7-21.html
  http://www.oracle.com/technetwork/security-advisory/cpujan2018-3236628.html");
  script_tag(name:"affected", value:"mysql-5.7 on Ubuntu 17.10,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3537-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3537-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|17\.10|16\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"mysql-server-5.5", ver:"5.5.59-0ubuntu0.14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.7", ver:"5.7.21-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"mysql-server-5.7", ver:"5.7.21-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

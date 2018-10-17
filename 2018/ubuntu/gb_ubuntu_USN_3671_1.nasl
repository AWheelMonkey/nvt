###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3671_1.nasl 11721 2018-10-02 08:19:21Z cfischer $
#
# Ubuntu Update for git USN-3671-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843545");
  script_version("$Revision: 11721 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-02 10:19:21 +0200 (Tue, 02 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-06-07 05:47:44 +0200 (Thu, 07 Jun 2018)");
  script_cve_id("CVE-2018-11235", "CVE-2018-11233");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for git USN-3671-1");
  script_tag(name:"summary", value:"Check the version of git");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Etienne Stalmans discovered that git did not properly validate git
submodules files. A remote attacker could possibly use this to craft a
git repo that causes arbitrary code execution when 'git clone --recurse-submodules' is used. (CVE-2018-11235)

It was discovered that an integer overflow existed in git's pathname
sanity checking code when used on NTFS filesystems. An attacker could
use this to cause a denial of service or expose sensitive information.
(CVE-2018-11233)");
  script_tag(name:"affected", value:"git on Ubuntu 18.04 LTS,
  Ubuntu 17.10,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3671-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3671-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|17\.10|18\.04 LTS|16\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"git", ver:"1:1.9.1-1ubuntu0.8", rls:"UBUNTU14.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"git", ver:"1:2.14.1-1ubuntu4.1", rls:"UBUNTU17.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"git", ver:"1:2.17.1-1ubuntu0.1", rls:"UBUNTU18.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"git", ver:"1:2.7.4-0ubuntu1.4", rls:"UBUNTU16.04 LTS", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

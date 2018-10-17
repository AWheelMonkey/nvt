###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for lightdm USN-3285-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843160");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-05-12 06:50:42 +0200 (Fri, 12 May 2017)");
  script_cve_id("CVE-2017-8900");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for lightdm USN-3285-1");
  script_tag(name:"summary", value:"Check the version of lightdm");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Tyler Hicks discovered that LightDM did not
  confine the user session for guest users. An attacker with physical access could
  use this issue to access files and other resources that they should not be able
  to access. In the default installation, this includes files in the home
  directories of other users on the system. This update fixes the issue by
  disabling the guest session. It may be re-enabled in a future update. Please see
  the bug referenced below for instructions on how to manually re-enable the guest
  session.");
  script_tag(name:"affected", value:"lightdm on Ubuntu 17.04,
  Ubuntu 16.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3285-1");
  script_xref(name:"URL", value:"https://www.ubuntu.com/usn/usn-3285-1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(17\.04|16\.10)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU17.04")
{

  if ((res = isdpkgvuln(pkg:"lightdm", ver:"1.22.0-0ubuntu2.1", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"lightdm", ver:"1.19.5-0ubuntu1.2", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

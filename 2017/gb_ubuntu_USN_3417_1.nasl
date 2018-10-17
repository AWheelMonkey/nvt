###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3417_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for libgcrypt20 USN-3417-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843305");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-09-15 07:09:14 +0200 (Fri, 15 Sep 2017)");
  script_cve_id("CVE-2017-0379");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for libgcrypt20 USN-3417-1");
  script_tag(name:"summary", value:"Check the version of libgcrypt20");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Daniel Genkin, Luke Valenta, and Yuval Yarom
  discovered that Libgcrypt was susceptible to an attack via side channels. A
  local attacker could use this attack to recover Curve25519 private keys.");
  script_tag(name:"affected", value:"libgcrypt20 on Ubuntu 17.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3417-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3417-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU17\.04");
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

  if ((res = isdpkgvuln(pkg:"libgcrypt20:amd64", ver:"1.7.6-1ubuntu0.2", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgcrypt20:i386", ver:"1.7.6-1ubuntu0.2", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }


  if (__pkg_match) exit(99);
  exit(0);
}

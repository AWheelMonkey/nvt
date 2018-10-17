###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1666_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for aptdaemon USN-1666-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");



if(description)
{
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1666-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841257");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-12-18 10:05:11 +0530 (Tue, 18 Dec 2012)");
  script_cve_id("CVE-2012-0962");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name:"USN", value:"1666-1");
  script_name("Ubuntu Update for aptdaemon USN-1666-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|11\.10)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1666-1");
  script_tag(name:"affected", value:"aptdaemon on Ubuntu 12.04 LTS,
  Ubuntu 11.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"It was discovered that Aptdaemon incorrectly validated PPA GPG keys when
  importing from a keyserver. If a remote attacker were able to perform a
  man-in-the-middle attack, this flaw could be exploited to install altered
  package repository GPG keys.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"aptdaemon", ver:"0.43+bzr805-0ubuntu7", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"aptdaemon", ver:"0.43+bzr697-0ubuntu1.3", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

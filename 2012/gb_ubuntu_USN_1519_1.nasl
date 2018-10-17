###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1519_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for isc-dhcp USN-1519-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1519-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.841095");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 11:18:54 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-3571", "CVE-2012-3954");
  script_tag(name:"cvss_base", value:"6.1");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:C");
  script_xref(name:"USN", value:"1519-1");
  script_name("Ubuntu Update for isc-dhcp USN-1519-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.04 LTS|11\.10|11\.04)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1519-1");
  script_tag(name:"affected", value:"isc-dhcp on Ubuntu 12.04 LTS,
  Ubuntu 11.10,
  Ubuntu 11.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Markus Hietava discovered that the DHCP server incorrectly handled certain
  malformed client identifiers. A remote attacker could use this issue to
  cause DHCP to crash, resulting in a denial of service. (CVE-2012-3571)

  Glen Eustace discovered that the DHCP server incorrectly handled memory. A
  remote attacker could use this issue to cause DHCP to crash, resulting in a
  denial of service. (CVE-2012-3954)");
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

  if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.1.ESV-R4-0ubuntu5.2", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.10")
{

  if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.1.1-P1-17ubuntu10.3", rls:"UBUNTU11.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.1.1-P1-15ubuntu9.4", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

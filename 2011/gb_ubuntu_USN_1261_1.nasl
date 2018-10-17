###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1261_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for quagga USN-1261-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1261-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840806");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2011-11-18 09:47:01 +0530 (Fri, 18 Nov 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name:"USN", value:"1261-1");
  script_cve_id("CVE-2011-3323", "CVE-2011-3324", "CVE-2011-3325", "CVE-2011-3326", "CVE-2011-3327");
  script_name("Ubuntu Update for quagga USN-1261-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(10\.10|10\.04 LTS|11\.04)");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1261-1");
  script_tag(name:"affected", value:"quagga on Ubuntu 11.04,
  Ubuntu 10.10,
  Ubuntu 10.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Riku Hietam&#228;ki, Tuomo Untinen and Jukka Taimisto discovered that Quagga
  incorrectly handled Link State Update messages with invalid lengths. A
  remote attacker could use this flaw to cause Quagga to crash, resulting in
  a denial of service. (CVE-2011-3323)

  Riku Hietam&#228;ki, Tuomo Untinen and Jukka Taimisto discovered that Quagga
  incorrectly handled certain IPv6 Database Description messages. A remote
  attacker could use this flaw to cause Quagga to crash, resulting in a
  denial of service. (CVE-2011-3324)

  Riku Hietam&#228;ki, Tuomo Untinen and Jukka Taimisto discovered that Quagga
  incorrectly handled certain IPv4 packets. A remote attacker could use this
  flaw to cause Quagga to crash, resulting in a denial of service.
  (CVE-2011-3325)

  Riku Hietam&#228;ki, Tuomo Untinen and Jukka Taimisto discovered that Quagga
  incorrectly handled invalid Link State Advertisement (LSA) types. A remote
  attacker could use this flaw to cause Quagga to crash, resulting in a
  denial of service. (CVE-2011-3326)

  Riku Hietam&#228;ki, Tuomo Untinen and Jukka Taimisto discovered that Quagga
  incorrectly handled certain BGP UPDATE messages. A remote attacker could
  use this flaw to cause Quagga to crash, or possibly execute arbitrary
  code. (CVE-2011-3327)");
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

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"quagga", ver:"0.99.17-1ubuntu0.2", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"quagga", ver:"0.99.15-1ubuntu0.3", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"quagga", ver:"0.99.17-4ubuntu1.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

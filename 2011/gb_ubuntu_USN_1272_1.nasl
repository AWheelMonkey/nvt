###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1272_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux USN-1272-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1272-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840814");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2011-11-25 12:00:44 +0530 (Fri, 25 Nov 2011)");
  script_xref(name:"USN", value:"1272-1");
  script_cve_id("CVE-2011-1585", "CVE-2011-2183", "CVE-2011-2491", "CVE-2011-2496", "CVE-2011-2517");
  script_name("Ubuntu Update for linux USN-1272-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU10\.10");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1272-1");
  script_tag(name:"affected", value:"linux on Ubuntu 10.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"It was discovered that CIFS incorrectly handled authentication. When a user
  had a CIFS share mounted that required authentication, a local user could
  mount the same share without knowing the correct password. (CVE-2011-1585)

  Andrea Righi discovered a race condition in the KSM memory merging support.
  If KSM was being used, a local attacker could exploit this to crash the
  system, leading to a denial of service. (CVE-2011-2183)

  Vasily Averin discovered that the NFS Lock Manager (NLM) incorrectly
  handled unlock requests. A local attacker could exploit this to cause a
  denial of service. (CVE-2011-2491)

  Robert Swiecki discovered that mapping extensions were incorrectly handled.
  A local attacker could exploit this to crash the system, leading to a
  denial of service. (CVE-2011-2496)

  It was discovered that the wireless stack incorrectly verified SSID
  lengths. A local attacker could exploit this to cause a denial of service
  or gain root privileges. (CVE-2011-2517)");
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

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-generic", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-generic-pae", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-omap", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-powerpc", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-powerpc-smp", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-powerpc64-smp", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-server", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-versatile", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.35-31-virtual", ver:"2.6.35-31.62", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

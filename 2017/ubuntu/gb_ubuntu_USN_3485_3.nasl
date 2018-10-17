###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3485_3.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-aws USN-3485-3
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
  script_oid("1.3.6.1.4.1.25623.1.0.843373");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-11-22 07:31:53 +0100 (Wed, 22 Nov 2017)");
  script_cve_id("CVE-2017-15265", "CVE-2017-15299", "CVE-2017-15649", "CVE-2017-15951",
                "CVE-2017-16525", "CVE-2017-16526", "CVE-2017-16527", "CVE-2017-16529",
                "CVE-2017-16530", "CVE-2017-16531", "CVE-2017-16533", "CVE-2017-16534",
                "CVE-2017-16535");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-aws USN-3485-3");
  script_tag(name:"summary", value:"Check the version of linux-aws");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that a race condition
  existed in the ALSA subsystem of the Linux kernel when creating and deleting a
  port via ioctl(). A local attacker could use this to cause a denial of service
  (system crash) or possibly execute arbitrary code. (CVE-2017-15265) Eric Biggers
  discovered that the key management subsystem in the Linux kernel did not
  properly restrict adding a key that already exists but is uninstantiated. A
  local attacker could use this to cause a denial of service (system crash) or
  possibly execute arbitrary code. (CVE-2017-15299) It was discovered that a race
  condition existed in the packet fanout implementation in the Linux kernel. A
  local attacker could use this to cause a denial of service (system crash) or
  possibly execute arbitrary code. (CVE-2017-15649) Eric Biggers discovered a race
  condition in the key management subsystem of the Linux kernel around keys in a
  negative state. A local attacker could use this to cause a denial of service
  (system crash) or possibly execute arbitrary code. (CVE-2017-15951) Andrey
  Konovalov discovered a use-after-free vulnerability in the USB serial console
  driver in the Linux kernel. A physically proximate attacker could use this to
  cause a denial of service (system crash) or possibly execute arbitrary code.
  (CVE-2017-16525) Andrey Konovalov discovered that the Ultra Wide Band driver in
  the Linux kernel did not properly check for an error condition. A physically
  proximate attacker could use this to cause a denial of service (system crash) or
  possibly execute arbitrary code. (CVE-2017-16526) Andrey Konovalov discovered
  that the ALSA subsystem in the Linux kernel contained a use-after-free
  vulnerability. A local attacker could use this to cause a denial of service
  (system crash) or possibly execute arbitrary code. (CVE-2017-16527) Andrey
  Konovalov discovered that the ALSA subsystem in the Linux kernel did not
  properly validate USB audio buffer descriptors. A physically proximate attacker
  could use this cause a denial of service (system crash) or possibly execute
  arbitrary code. (CVE-2017-16529) Andrey Konovalov discovered that the USB
  unattached storage driver in the Linux kernel contained out-of-bounds error when
  handling alternative settings. A physically proximate attacker could use to
  cause a denial of service (system crash) or possibly execute arbitrary code.
  (CVE-2017-16530) Andrey Konovalov discovered that the USB subsystem in the Linux
  kernel did not properly validate USB interface association descriptors. A
  physically proximate attacker could use this to cause a denial of service
  (system crash). (CVE-2017-16531) An ... Description truncated, for more
  information please check the Reference URL");
  script_tag(name:"affected", value:"linux-aws on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3485-3");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3485-3/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
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

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-1003-aws", ver:"4.4.0-1003.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-aws", ver:"4.4.0.1003.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

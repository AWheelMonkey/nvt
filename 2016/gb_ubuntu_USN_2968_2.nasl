###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-trusty USN-2968-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842743");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-05-10 05:21:30 +0200 (Tue, 10 May 2016)");
  script_cve_id("CVE-2015-7515", "CVE-2015-8830", "CVE-2015-1805", "CVE-2016-0774",
 		"CVE-2016-0821", "CVE-2016-2184", "CVE-2016-2185", "CVE-2016-2186",
 		"CVE-2016-2188", "CVE-2016-3136", "CVE-2016-3137", "CVE-2016-3138",
	 	"CVE-2016-3140", "CVE-2016-3156", "CVE-2016-3157", "CVE-2016-3689");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-trusty USN-2968-2");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux-lts-trusty'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-2968-1 fixed vulnerabilities in the
  Linux kernel for Ubuntu 14.04 LTS.  This update provides the corresponding
  updates for the Linux Hardware Enablement (HWE) kernel from Ubuntu 14.04 LTS
  for Ubuntu 12.04 LTS.

  Ralf Spenneberg discovered that the Aiptek Tablet USB device driver in the
  Linux kernel did not properly sanity check the endpoints reported by the
  device. An attacker with physical access could cause a denial of service
  (system crash). (CVE-2015-7515)

  Ben Hawkes discovered that the Linux kernel's AIO interface allowed single
  writes greater than 2GB, which could cause an integer overflow when writing
  to certain filesystems, socket or device types. A local attacker could this
  to cause a denial of service (system crash) or possibly execute arbitrary
  code. (CVE-2015-8830)

  It was discovered that the Linux kernel did not keep accurate track of pipe
  buffer details when error conditions occurred, due to an incomplete fix for
  CVE-2015-1805. A local attacker could use this to cause a denial of service
  (system crash) or possibly execute arbitrary code with administrative
  privileges. (CVE-2016-0774)

  Zach Riggle discovered that the Linux kernel's list poison feature did not
  take into account the mmap_min_addr value. A local attacker could use this
  to bypass the kernel's poison-pointer protection mechanism while attempting
  to exploit an existing kernel vulnerability. (CVE-2016-0821)

  Ralf Spenneberg discovered that the USB sound subsystem in the Linux kernel
  did not properly validate USB device descriptors. An attacker with physical
  access could use this to cause a denial of service (system crash).
  (CVE-2016-2184)

  Ralf Spenneberg discovered that the ATI Wonder Remote II USB driver in the
  Linux kernel did not properly validate USB device descriptors. An attacker
  with physical access could use this to cause a denial of service (system
  crash). (CVE-2016-2185)

  Ralf Spenneberg discovered that the PowerMate USB driver in the Linux
  kernel did not properly validate USB device descriptors. An attacker with
  physical access could use this to cause a denial of service (system crash).
  (CVE-2016-2186)

  Ralf Spenneberg discovered that the I/O-Warrior USB device driver in the
  Linux kernel did not properly validate USB device descriptors. An attacker
  with physical access could use this to cause a denial of service (system
  crash). (CVE-2016-2188)

  Sergej Schumilo, Hendrik Schwartke, and Ralf Spenneberg discovered that the
  MCT USB RS232 Converter device driver in the Linux kernel did not properly
  validate USB device descriptors. An attacker with physical access could use
  this to cause a denial o ...

  Description truncated, please see the referenced URL(s) for more information.");
  script_tag(name:"affected", value:"linux-lts-trusty on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2968-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2968-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU12\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-86-generic", ver:"3.13.0-86.130~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-86-generic-lpae", ver:"3.13.0-86.130~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

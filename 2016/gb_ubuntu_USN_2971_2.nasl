###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-wily USN-2971-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842736");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-05-10 05:20:35 +0200 (Tue, 10 May 2016)");
  script_cve_id("CVE-2015-7515", "CVE-2016-0821", "CVE-2016-2184", "CVE-2016-2185", "CVE-2016-2186", "CVE-2016-2188", "CVE-2016-3136", "CVE-2016-3137", "CVE-2016-3138", "CVE-2016-3140", "CVE-2016-3156", "CVE-2016-3157", "CVE-2016-3689");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-wily USN-2971-2");
  script_tag(name:"summary", value:"Check the version of linux-lts-wily");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-2971-1 fixed vulnerabilities in the
  Linux kernel for Ubuntu 15.10. This update provides the corresponding updates
  for the Linux Hardware
  Enablement (HWE) kernel from Ubuntu 15.10 for Ubuntu 14.04 LTS.

  Ralf Spenneberg discovered that the Aiptek Tablet USB device driver in the
  Linux kernel did not properly sanity check the endpoints reported by the
  device. An attacker with physical access could cause a denial of service
  (system crash). (CVE-2015-7515)

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
  this to cause a denial of service (system crash). (CVE-2016-3136)

  Sergej Schumilo, Hendrik Schwartke, and Ralf Spenneberg discovered that the
  Cypress M8 USB device driver in the Linux kernel did not properly validate
  USB device descriptors. An attacker with physical access could use this to
  cause a denial of service (system crash). (CVE-2016-3137)

  Sergej Schumilo, Hendrik Schwartke, and Ralf Spenneberg discovered that the
  USB abstract device control driver for modems and ISDN adapters did not
  validate endpoint descriptors. An attacker with physical access could use
  this to cause a denial of service (system crash). (CVE-2016-3138)

  Sergej Schumilo, Hendrik Schwartke, and Ralf  ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"linux-lts-wily on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2971-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2971-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-generic", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-generic-lpae", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-lowlatency", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc-e500mc", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc-smp", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc64-emb", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-36-powerpc64-smp", ver:"4.2.0-36.41~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

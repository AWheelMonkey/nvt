###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1092_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux-source-2.6.15 vulnerabilities USN-1092-1
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
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1092-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840618");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2011-04-01 15:34:04 +0200 (Fri, 01 Apr 2011)");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:N/A:C");
  script_xref(name:"USN", value:"1092-1");
  script_cve_id("CVE-2010-4076", "CVE-2010-4077", "CVE-2010-4158", "CVE-2010-4162", "CVE-2010-4163", "CVE-2010-4242");
  script_name("Ubuntu Update for linux-source-2.6.15 vulnerabilities USN-1092-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU6\.06 LTS");
  script_tag(name:"summary", value:"Ubuntu Update for Linux kernel vulnerabilities USN-1092-1");
  script_tag(name:"affected", value:"linux-source-2.6.15 vulnerabilities on Ubuntu 6.06 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Dan Rosenberg discovered that multiple terminal ioctls did not correctly
  initialize structure memory. A local attacker could exploit this to read
  portions of kernel stack memory, leading to a loss of privacy.
  (CVE-2010-4076, CVE-2010-4077)

  Dan Rosenberg discovered that the socket filters did not correctly
  initialize structure memory. A local attacker could create malicious
  filters to read portions of kernel stack memory, leading to a loss of
  privacy. (CVE-2010-4158)

  Dan Rosenberg discovered that certain iovec operations did not calculate
  page counts correctly. A local attacker could exploit this to crash the
  system, leading to a denial of service. (CVE-2010-4162)

  Dan Rosenberg discovered that the SCSI subsystem did not correctly validate
  iov segments. A local attacker with access to a SCSI device could send
  specially crafted requests to crash the system, leading to a denial of
  service. (CVE-2010-4163)

  Alan Cox discovered that the HCI UART driver did not correctly check if a
  write operation was available. A local attacker could exploit this
  flaw to gain root privileges. (CVE-2010-4242)");
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

if(release == "UBUNTU6.06 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-headers-2.6.15-57-386", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-headers-2.6.15-57-686", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-headers-2.6.15-57-k7", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-headers-2.6.15-57-server-bigiron", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-headers-2.6.15-57-server", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-headers-2.6.15-57", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.15-57-386", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.15-57-686", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.15-57-k7", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.15-57-server-bigiron", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.15-57-server", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-doc-2.6.15", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-kernel-devel", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-source-2.6.15", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"acpi-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"cdrom-core-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"cdrom-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"crc-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ext2-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ext3-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"fat-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"fb-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"firewire-core-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"floppy-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ide-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"input-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ipv6-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"irda-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"jfs-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"kernel-image-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"loop-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"md-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"nfs-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"nic-firmware-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"nic-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"nic-pcmcia-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"nic-shared-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"nic-usb-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ntfs-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"parport-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"pcmcia-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"pcmcia-storage-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"plip-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ppp-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"reiserfs-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"sata-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"scsi-core-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"scsi-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"serial-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"socket-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"ufs-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"usb-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"usb-storage-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"xfs-modules-2.6.15-57-386-di", ver:"2.6.15-57.94", rls:"UBUNTU6.06 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

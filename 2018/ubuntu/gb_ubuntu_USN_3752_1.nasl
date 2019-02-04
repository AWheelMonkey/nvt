###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3752_1.nasl 12806 2018-12-17 06:39:00Z ckuersteiner $
#
# Ubuntu Update for linux USN-3752-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843625");
  script_version("$Revision: 12806 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-17 07:39:00 +0100 (Mon, 17 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-08-25 06:44:49 +0200 (Sat, 25 Aug 2018)");
  script_cve_id("CVE-2018-1000200", "CVE-2018-10323", "CVE-2018-10840", "CVE-2018-10881", "CVE-2018-1093", "CVE-2018-1108", "CVE-2018-1120", "CVE-2018-11412", "CVE-2018-11506", "CVE-2018-12232", "CVE-2018-12233", "CVE-2018-12904", "CVE-2018-13094", "CVE-2018-13405", "CVE-2018-13406", "CVE-2018-5814", "CVE-2018-9415", "CVE-2018-1000204");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-3752-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that, when attempting to handle an out-of-memory
situation, a null pointer dereference could be triggered in the Linux
kernel in some circumstances. A local attacker could use this to cause a
denial of service (system crash). (CVE-2018-1000200)

Wen Xu discovered that the XFS filesystem implementation in the Linux
kernel did not properly validate meta-data information. An attacker could
use this to construct a malicious xfs image that, when mounted, could cause
a denial of service (system crash). (CVE-2018-10323)

Wen Xu discovered that the XFS filesystem implementation in the Linux
kernel did not properly validate xattr information. An attacker could use
this to construct a malicious xfs image that, when mounted, could cause a
denial of service (system crash) or possibly execute arbitrary code.
(CVE-2018-10840)

Wen Xu discovered that the ext4 filesystem implementation in the Linux
kernel did not properly keep meta-data information consistent in some
situations. An attacker could use this to construct a malicious ext4 image
that, when mounted, could cause a denial of service (system crash).
(CVE-2018-10881)

Wen Xu discovered that the ext4 filesystem implementation in the Linux
kernel did not properly handle corrupted meta data in some situations. An
attacker could use this to specially craft an ext4 filesystem that caused a
denial of service (system crash) when mounted. (CVE-2018-1093)

Jann Horn discovered that the Linux kernel's implementation of random seed
data reported that it was in a ready state before it had gathered
sufficient entropy. An attacker could use this to expose sensitive
information. (CVE-2018-1108)

It was discovered that the procfs filesystem did not properly handle
processes mapping some memory elements onto files. A local attacker could
use this to block utilities that examine the procfs filesystem to report
operating system state, such as ps(1). (CVE-2018-1120)

Jann Horn discovered that the ext4 filesystem implementation in the Linux
kernel did not properly keep xattr information consistent in some
situations. An attacker could use this to construct a malicious ext4 image
that, when mounted, could cause a denial of service (system crash) or
possibly execute arbitrary code. (CVE-2018-11412)

Piotr Gabriel Kosinski and Daniel Shapira discovered a stack-based buffer
overflow in the CDROM driver implementation of the Linux kernel. A local
attacker could use this to cause a denial of service (system crash) or
possibly execute arbitrary code. (CVE-2018-11506)

Shankara Pailoor discovered that a race condition existed in the socket
handling code in the ...

  Description truncated, please see the referenced URL(s) for more information.");
  script_tag(name:"affected", value:"linux on Ubuntu 18.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3752-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3752-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-1018-gcp", ver:"4.15.0-1018.19", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-1020-aws", ver:"4.15.0-1020.20", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-1020-kvm", ver:"4.15.0-1020.20", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-1021-raspi2", ver:"4.15.0-1021.23", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-33-generic", ver:"4.15.0-33.36", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-33-generic-lpae", ver:"4.15.0-33.36", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-33-lowlatency", ver:"4.15.0-33.36", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.15.0-33-snapdragon", ver:"4.15.0-33.36", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-aws", ver:"4.15.0.1020.20", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-gcp", ver:"4.15.0.1018.20", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.15.0.33.35", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.15.0.33.35", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-gke", ver:"4.15.0.1018.20", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-kvm", ver:"4.15.0.1020.20", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.15.0.33.35", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-raspi2", ver:"4.15.0.1021.19", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-snapdragon", ver:"4.15.0.33.35", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3468_1.nasl 11228 2018-09-05 02:44:21Z ckuersteiner $
#
# Ubuntu Update for linux USN-3468-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843353");
  script_version("$Revision: 11228 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 04:44:21 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2017-11-01 05:02:17 +0100 (Wed, 01 Nov 2017)");
  script_cve_id("CVE-2017-1000252", "CVE-2017-10663", "CVE-2017-10911",
                "CVE-2017-11176", "CVE-2017-14340");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-3468-1");
  script_tag(name:"summary", value:"Check the version of linux");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that the KVM subsystem in
  the Linux kernel did not properly bound guest IRQs. A local attacker in a guest
  VM could use this to cause a denial of service (host system crash).
  (CVE-2017-1000252) It was discovered that the Flash-Friendly File System (f2fs)
  implementation in the Linux kernel did not properly validate superblock
  metadata. A local attacker could use this to cause a denial of service (system
  crash) or possibly execute arbitrary code. (CVE-2017-10663) Anthony Perard
  discovered that the Xen virtual block driver did not properly initialize some
  data structures before passing them to user space. A local attacker in a guest
  VM could use this to expose sensitive information from the host OS or other
  guest VMs. (CVE-2017-10911) It was discovered that a use-after-free
  vulnerability existed in the POSIX message queue implementation in the Linux
  kernel. A local attacker could use this to cause a denial of service (system
  crash) or possibly execute arbitrary code. (CVE-2017-11176) Dave Chinner
  discovered that the XFS filesystem did not enforce that the realtime inode flag
  was settable only on filesystems on a realtime device. A local attacker could
  use this to cause a denial of service (system crash). (CVE-2017-14340)");
  script_tag(name:"affected", value:"linux on Ubuntu 17.04");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3468-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3468-1/");
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

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-1020-raspi2", ver:"4.10.0-1020.23", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-38-generic", ver:"4.10.0-38.42", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-38-generic-lpae", ver:"4.10.0-38.42", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.10.0-38-lowlatency", ver:"4.10.0-38.42", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.10.0.38.38", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.10.0.38.38", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.10.0.38.38", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-raspi2", ver:"4.10.0.1020.21", rls:"UBUNTU17.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

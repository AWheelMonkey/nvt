###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2395_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for linux USN-2395-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842017");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-10-31 05:45:35 +0100 (Fri, 31 Oct 2014)");
  script_cve_id("CVE-2014-3647", "CVE-2014-3646", "CVE-2014-3611", "CVE-2014-3610", "CVE-2014-7145");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("Ubuntu Update for linux USN-2395-1");

  script_tag(name:"summary", value:"Check the version of linux");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Nadav Amit reported that the KVM (Kernel
Virtual Machine) mishandles noncanonical addresses when emulating instructions
that change the rip (Instruction Pointer). A guest user with access to I/O or the
MMIO can use this flaw to cause a denial of service (system crash) of the guest.
(CVE-2014-3647)

A flaw was discovered with the handling of the invept instruction in the
KVM (Kernel Virtual Machine) subsystem of the Linux kernel. An unprivileged
guest user could exploit this flaw to cause a denial of service (system
crash) on the guest. (CVE-2014-3646)

Lars Bull reported a race condition in the PIT (programmable interrupt
timer) emulation in the KVM (Kernel Virtual Machine) subsystem of the Linux
kernel. A local guest user with access to PIT i/o ports could exploit this
flaw to cause a denial of service (crash) on the host. (CVE-2014-3611)

Lars Bull and Nadav Amit reported a flaw in how KVM (the Kernel Virtual
Machine) handles noncanonical writes to certain MSR registers. A privileged
guest user can exploit this flaw to cause a denial of service (kernel
panic) on the host. (CVE-2014-3610)

Raphael Geissert reported a NULL pointer dereference in the Linux kernel's
CIFS client. A remote CIFS server could cause a denial of service (system
crash) or possibly have other unspecified impact by deleting IPC$ share
during resolution of DFS referrals. (CVE-2014-7145)");
  script_tag(name:"affected", value:"linux on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2395-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2395-1/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-generic", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-generic-lpae", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-lowlatency", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-powerpc-e500", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-powerpc-e500mc", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-powerpc-smp", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-powerpc64-emb", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-39-powerpc64-smp", ver:"3.13.0-39.66", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

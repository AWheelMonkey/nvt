###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-xenial USN-3099-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842910");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-10-12 05:45:31 +0200 (Wed, 12 Oct 2016)");
  script_cve_id("CVE-2016-7039", "CVE-2016-6828", "CVE-2016-6480");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-xenial USN-3099-2");
  script_tag(name:"summary", value:"Check the version of linux-lts-xenial");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3099-1 fixed vulnerabilities in the
  Linux kernel for Ubuntu 16.04 LTS. This update provides the corresponding
  updates for the Linux Hardware Enablement (HWE) kernel from Ubuntu 16.04 LTS for Ubuntu
  14.04 LTS.

Vladim&#237 r Bene&#353  discovered an unbounded recursion in the VLAN and TEB
Generic Receive Offload (GRO) processing implementations in the Linux
kernel, A remote attacker could use this to cause a stack corruption,
leading to a denial of service (system crash). (CVE-2016-7039)

Marco Grassi discovered a use-after-free condition could occur in the TCP
retransmit queue handling code in the Linux kernel. A local attacker could
use this to cause a denial of service (system crash) or possibly execute
arbitrary code. (CVE-2016-6828)

Pengfei Wang discovered a race condition in the Adaptec AAC RAID controller
driver in the Linux kernel when handling ioctl()s. A local attacker could
use this to cause a denial of service (system crash). (CVE-2016-6480)");
  script_tag(name:"affected", value:"linux-lts-xenial on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3099-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3099-2/");
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

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-generic", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-generic-lpae", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-lowlatency", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-powerpc-e500mc", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-powerpc-smp", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-powerpc64-emb", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.4.0-42-powerpc64-smp", ver:"4.4.0-42.62~14.04.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

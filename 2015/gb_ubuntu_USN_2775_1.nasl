###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-lts-trusty USN-2775-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.842500");
  script_version("$Revision: 11228 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 04:44:21 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-10-21 07:12:40 +0200 (Wed, 21 Oct 2015)");
  script_cve_id("CVE-2015-0272", "CVE-2015-5156", "CVE-2015-6937", "CVE-2015-7312");
  script_tag(name:"cvss_base", value:"6.1");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-lts-trusty USN-2775-1");
  script_tag(name:"summary", value:"Check the version of linux-lts-trusty");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that the Linux kernel
did not check if a new IPv6 MTU set by a user space application was valid. A
remote attacker could forge a route advertisement with an invalid MTU that a
user space daemon like NetworkManager would honor and apply to the kernel, causing
a denial of service. (CVE-2015-0272)

It was discovered that virtio networking in the Linux kernel did not handle
fragments correctly, leading to kernel memory corruption. A remote attacker
could use this to cause a denial of service (system crash) or possibly
execute code with administrative privileges. (CVE-2015-5156)

It was discovered that the Reliable Datagram Sockets (RDS) implementation
in the Linux kernel did not verify sockets were properly bound before
attempting to send a message, which could cause a NULL pointer dereference.
An attacker could use this to cause a denial of service (system crash).
(CVE-2015-6937)

Ben Hutchings discovered that the Advanced Union Filesystem (aufs) for the
Linux kernel did not correctly handle references of memory mapped files
from an aufs mount. A local attacker could use this to cause a denial of
service (system crash) or possibly execute arbitrary code with
administrative privileges. (CVE-2015-7312)");
  script_tag(name:"affected", value:"linux-lts-trusty on Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2775-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2775-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-66-generic", ver:"3.13.0-66.108~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-66-generic-lpae", ver:"3.13.0-66.108~precise1", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

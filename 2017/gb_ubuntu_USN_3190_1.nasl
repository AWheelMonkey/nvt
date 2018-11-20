###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux USN-3190-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843041");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-02-04 05:46:31 +0100 (Sat, 04 Feb 2017)");
  script_cve_id("CVE-2016-10147", "CVE-2016-10150", "CVE-2016-8399", "CVE-2016-8632", "CVE-2016-9777");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-3190-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Mikulas Patocka discovered that the asynchronous
  multibuffer cryptographic daemon (mcryptd) in the Linux kernel did not properly
  handle being invoked with incompatible algorithms. A local attacker could use this
  to cause a denial of service (system crash). (CVE-2016-10147)

It was discovered that a use-after-free existed in the KVM susbsystem of
the Linux kernel when creating devices. A local attacker could use this to
cause a denial of service (system crash). (CVE-2016-10150)

Qidan He discovered that the ICMP implementation in the Linux kernel did
not properly check the size of an ICMP header. A local attacker with
CAP_NET_ADMIN could use this to expose sensitive information.
(CVE-2016-8399)

Qian Zhang discovered a heap-based buffer overflow in the tipc_msg_build()
function in the Linux kernel. A local attacker could use to cause a denial
of service (system crash) or possible execute arbitrary code with
administrative privileges. (CVE-2016-8632)

Dmitry Vyukov discovered that the KVM implementation in the Linux kernel
did not properly restrict the VCPU index when I/O APIC is enabled, An
attacker in a guest VM could use this to cause a denial of service (system
crash) or possibly gain privileges in the host OS. (CVE-2016-9777)");
  script_tag(name:"affected", value:"linux on Ubuntu 16.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3190-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3190-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU16\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU16.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.8.0-37-generic", ver:"4.8.0-37.39", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.8.0-37-generic-lpae", ver:"4.8.0-37.39", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.8.0-37-lowlatency", ver:"4.8.0-37.39", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.8.0-37-powerpc-e500mc", ver:"4.8.0-37.39", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.8.0-37-powerpc-smp", ver:"4.8.0-37.39", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-4.8.0-37-powerpc64-emb", ver:"4.8.0-37.39", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic", ver:"4.8.0.37.46", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-generic-lpae", ver:"4.8.0.37.46", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-lowlatency", ver:"4.8.0.37.46", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc-e500mc", ver:"4.8.0.37.46", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc-smp", ver:"4.8.0.37.46", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-powerpc64-emb", ver:"4.8.0.37.46", rls:"UBUNTU16.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

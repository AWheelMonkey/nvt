###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux-raspi2 USN-2890-3
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
  script_oid("1.3.6.1.4.1.25623.1.0.842624");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-02-05 13:14:19 +0530 (Fri, 05 Feb 2016)");
  script_cve_id("CVE-2013-7446", "CVE-2015-7513", "CVE-2015-7550", "CVE-2015-7990",
                "CVE-2015-8374", "CVE-2015-8543", "CVE-2015-8569", "CVE-2015-8575",
                "CVE-2015-8787");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux-raspi2 USN-2890-3");
  script_tag(name:"summary", value:"Check the version of linux-raspi2");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that a use-after-free
  vulnerability existed in the AF_UNIX implementation in the Linux kernel. A
  local attacker could use crafted epoll_ctl calls to cause a denial of service
  (system crash) or expose sensitive information. (CVE-2013-7446)

  It was discovered that the KVM implementation in the Linux kernel did not
  properly restore the values of the Programmable Interrupt Timer (PIT). A
  user-assisted attacker in a KVM guest could cause a denial of service in
  the host (system crash). (CVE-2015-7513)

  It was discovered that the Linux kernel keyring subsystem contained a race
  between read and revoke operations. A local attacker could use this to
  cause a denial of service (system crash). (CVE-2015-7550)

  Sasha Levin discovered that the Reliable Datagram Sockets (RDS)
  implementation in the Linux kernel had a race condition when checking
  whether a socket was bound or not. A local attacker could use this to cause
  a denial of service (system crash). (CVE-2015-7990)

  It was discovered that the Btrfs implementation in the Linux kernel
  incorrectly handled compressed inline extants on truncation. A local
  attacker could use this to expose sensitive information. (CVE-2015-8374)

  It was discovered that the Linux kernel networking implementation did
  not validate protocol identifiers for certain protocol families, A local
  attacker could use this to cause a denial of service (system crash) or
  possibly gain administrative privileges. (CVE-2015-8543)

  Dmitry Vyukov discovered that the pptp implementation in the Linux kernel
  did not verify an address length when setting up a socket. A local attacker
  could use this to craft an application that exposed sensitive information
  from kernel memory. (CVE-2015-8569)

  David Miller discovered that the Bluetooth implementation in the Linux
  kernel did not properly validate the socket address length for Synchronous
  Connection-Oriented (SCO) sockets. A local attacker could use this to
  expose sensitive information. (CVE-2015-8575)

  It was discovered that the netfilter Network Address Translation (NAT)
  implementation did not ensure that data structures were initialized when
  handling IPv4 addresses. An attacker could use this to cause a denial of
  service (system crash). (CVE-2015-8787)");

  script_tag(name:"affected", value:"linux-raspi2 on Ubuntu 15.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2890-3");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2890-3/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU15\.10");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.2.0-1022-raspi2", ver:"4.2.0-1022.29", rls:"UBUNTU15.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2049_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for linux USN-2049-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.841655");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-12-17 12:08:51 +0530 (Tue, 17 Dec 2013)");
  script_cve_id("CVE-2013-4270", "CVE-2013-4299", "CVE-2013-4343", "CVE-2013-4350",
                "CVE-2013-4387", "CVE-2013-4470");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux USN-2049-1");


  script_tag(name:"affected", value:"linux on Ubuntu 13.10");
  script_tag(name:"insight", value:"Miroslav Vadkerti discovered a flaw in how the permissions
for network sysctls are handled in the Linux kernel. An unprivileged local
user could exploit this flaw to have privileged access to files in
/proc/sys/net/. (CVE-2013-4270)

A flaw was discovered in the Linux kernel's dm snapshot facility. A remote
authenticated user could exploit this flaw to obtain sensitive information
or modify/corrupt data. (CVE-2013-4299)

Wannes Rombouts reported a vulnerability in the networking tuntap interface
of the Linux kernel. A local user with the CAP_NET_ADMIN capability could
leverage this flaw to gain full admin privileges. (CVE-2013-4343)

Alan Chester reported a flaw in the IPv6 Stream Control Transmission
Protocol (SCTP) of the Linux kernel. A remote attacker could exploit this
flaw to obtain sensitive information by sniffing network traffic.
(CVE-2013-4350)

Dmitry Vyukov reported a flaw in the Linux kernel's handling of IPv6 UDP
Fragmentation Offload (UFO) processing. A remote attacker could leverage
this flaw to cause a denial of service (system crash). (CVE-2013-4387)

Hannes Frederic Sowa discovered a flaw in the Linux kernel's UDP
Fragmenttation Offload (UFO). An unprivileged local user could exploit this
flaw to cause a denial of service (system crash) or possibly gain
administrative privileges. (CVE-2013-4470)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2049-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2049-1/");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU13\.10");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU13.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.11.0-14-generic", ver:"3.11.0-14.21", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.11.0-14-generic-lpae", ver:"3.11.0-14.21", rls:"UBUNTU13.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

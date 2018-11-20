###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for linux USN-2907-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842651");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-02-23 06:25:44 +0100 (Tue, 23 Feb 2016)");
  script_cve_id("CVE-2016-1576", "CVE-2016-1575", "CVE-2015-7550", "CVE-2015-8543",
                "CVE-2015-8569", "CVE-2015-8575", "CVE-2015-8785");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for linux USN-2907-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"halfdog discovered that OverlayFS,
  when mounting on top of a FUSE mount, incorrectly propagated file attributes,
  including setuid. A local unprivileged attacker could use this to gain privileges.
  (CVE-2016-1576)

  halfdog discovered that OverlayFS in the Linux kernel incorrectly
  pr opagated security sensitive extended attributes, such as
  POSIX ACLs. A local unprivileged attacker could use this to gain
  privileges. (CVE-2016-1575)

  It was discovered that the Linux kernel keyring subsystem contained a race
  between read and revoke operations. A local attacker could use this to
  cause a denial of service (system crash). (CVE-2015-7550)

  &#37101 &#27704 &#21018  discovered that the Linux kernel networking implementation did
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

  It was discovered that the Linux kernel's Filesystem in Userspace (FUSE)
  implementation did not handle initial zero length segments properly. A
  local attacker could use this to cause a denial of service (unkillable
  task). (CVE-2015-8785)");
  script_tag(name:"affected", value:"linux on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2907-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2907-1/");
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

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-generic", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-generic-lpae", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-lowlatency", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-powerpc-e500", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-powerpc-e500mc", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-powerpc-smp", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-powerpc64-emb", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-3.13.0-79-powerpc64-smp", ver:"3.13.0-79.123", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

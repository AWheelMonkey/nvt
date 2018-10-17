###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3991.nasl 7368 2017-10-06 12:38:25Z asteins $
#
# Auto-generated from advisory DSA 3991-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.703991");
  script_version("$Revision: 7368 $");
  script_cve_id("CVE-2017-12809", "CVE-2017-13672", "CVE-2017-13711", "CVE-2017-14167", "CVE-2017-9375");
  script_name("Debian Security Advisory DSA 3991-1 (qemu - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-10-06 14:38:25 +0200 (Fri, 06 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-03 00:00:00 +0200 (Tue, 03 Oct 2017)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3991.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"qemu on Debian Linux");
  script_tag(name:"insight", value:"QEMU is a fast processor emulator: currently the package supports
ARM, CRIS, i386, M68k (ColdFire), MicroBlaze, MIPS, PowerPC, SH4,
SPARC and x86-64 emulation. By using dynamic translation it achieves
reasonable speed while being easy to port on new host CPUs. QEMU has
two operating modes:");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1:2.8+dfsg-6+deb9u3.

We recommend that you upgrade your qemu packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities were found in qemu, a fast processor emulator:

CVE-2017-9375 
Denial of service via memory leak in USB XHCI emulation.

CVE-2017-12809 
Denial of service in the CDROM device drive emulation.

CVE-2017-13672 
Denial of service in VGA display emulation.

CVE-2017-13711 
Denial of service in SLIRP networking support.

CVE-2017-14167 
Incorrect validation of multiboot headers could result in the
execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"qemu", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-block-extra", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-guest-agent", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-arm", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-common", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-mips", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-misc", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-ppc", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-sparc", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-x86", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-binfmt", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-static", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-utils", ver:"1:2.8+dfsg-6+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

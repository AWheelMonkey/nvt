###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4338.nasl 12310 2018-11-12 07:30:19Z cfischer $
#
# Auto-generated from advisory DSA 4338-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704338");
  script_version("$Revision: 12310 $");
  script_cve_id("CVE-2018-10839", "CVE-2018-17962", "CVE-2018-17963");
  script_name("Debian Security Advisory DSA 4338-1 (qemu - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 08:30:19 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-11 00:00:00 +0100 (Sun, 11 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4338.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"qemu on Debian Linux");
  script_tag(name:"insight", value:"QEMU is a fast processor emulator: currently the package supports
ARM, CRIS, i386, M68k (ColdFire), MicroBlaze, MIPS, PowerPC, SH4,
SPARC and x86-64 emulation. By using dynamic translation it achieves
reasonable speed while being easy to port on new host CPUs. QEMU has
two operating modes:");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1:2.8+dfsg-6+deb9u5.

We recommend that you upgrade your qemu packages.

For the detailed security status of qemu please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/qemu");
  script_tag(name:"summary",  value:"Integer overflows in the processing of packets in network cards emulated
by QEMU, a fast processor emulator, could result in denial of service.

In addition this update backports support to passthrough the new CPU
features added in the intel-microcode update shipped in DSA 4273 to
x86-based guests.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"qemu", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-block-extra", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-guest-agent", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-arm", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-common", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-mips", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-misc", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-ppc", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-sparc", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system-x86", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-binfmt", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-static", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-utils", ver:"1:2.8+dfsg-6+deb9u5", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

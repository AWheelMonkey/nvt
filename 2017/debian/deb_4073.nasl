###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4073.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# Auto-generated from advisory DSA 4073-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704073");
  script_version("$Revision: 8493 $");
  script_cve_id("CVE-2017-1000407", "CVE-2017-1000410", "CVE-2017-16538", "CVE-2017-16644", "CVE-2017-16995", "CVE-2017-17448", "CVE-2017-17449", "CVE-2017-17450", "CVE-2017-17558", "CVE-2017-17712", "CVE-2017-17741", "CVE-2017-17805", "CVE-2017-17806", "CVE-2017-17807", "CVE-2017-17862", "CVE-2017-17863", "CVE-2017-17864", "CVE-2017-8824");
  script_name("Debian Security Advisory DSA 4073-1 (linux - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-23 00:00:00 +0100 (Sat, 23 Dec 2017)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4073.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"linux on Debian Linux");
  script_tag(name:"insight", value:"The Linux kernel is the core of the Linux operating system.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 4.9.65-3+deb9u1.

We recommend that you upgrade your linux packages.

For the detailed security status of linux please refer to its security
tracker page at: https://security-tracker.debian.org/tracker/linux");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in the Linux kernel that
may lead to a privilege escalation, denial of service or information
leaks.

CVE-2017-8824Mohamed Ghannam discovered that the DCCP implementation did not
correctly manage resources when a socket is disconnected and
reconnected, potentially leading to a use-after-free. A local
user could use this for denial of service (crash or data
corruption) or possibly for privilege escalation. On systems that
do not already have the dccp module loaded, this can be mitigated
by disabling it:
echo>> /etc/modprobe.d/disable-dccp.conf install dccp falseCVE-2017-16538 
Andrey Konovalov reported that the dvb-usb-lmedm04 media driver
did not correctly handle some error conditions during
initialisation. A physically present user with a specially
designed USB device can use this to cause a denial of service
(crash).

CVE-2017-16644 
Andrey Konovalov reported that the hdpvr media driver did not
correctly handle some error conditions during initialisation. A
physically present user with a specially designed USB device can
use this to cause a denial of service (crash).

CVE-2017-16995 
Jann Horn discovered that the Extended BPF verifier did not
correctly model the behaviour of 32-bit load instructions. A
local user can use this for privilege escalation.

CVE-2017-17448 
Kevin Cernekee discovered that the netfilter subsystem allowed
users with the CAP_NET_ADMIN capability in any user namespace, not
just the root namespace, to enable and disable connection tracking
helpers. This could lead to denial of service, violation of
network security policy, or have other impact.

CVE-2017-17449 
Kevin Cernekee discovered that the netlink subsystem allowed
users with the CAP_NET_ADMIN capability in any user namespace
to monitor netlink traffic in all net namespaces, not just
those owned by that user namespace. This could lead to
exposure of sensitive information.

CVE-2017-17450 
Kevin Cernekee discovered that the xt_osf module allowed users
with the CAP_NET_ADMIN capability in any user namespace to modify
the global OS fingerprint list.

CVE-2017-17558 
Andrey Konovalov reported that that USB core did not correctly
handle some error conditions during initialisation. A physically
present user with a specially designed USB device can use this to
cause a denial of service (crash or memory corruption), or
possibly for privilege escalation.

CVE-2017-17712 
Mohamed Ghannam discovered a race condition in the IPv4 raw socket
implementation. A local user could use this to obtain sensitive
information from the kernel.

CVE-2017-17741 
Dmitry Vyukov reported that the KVM implementation for x86 would
over-read data from memory when emulating an MMIO write if the
kvm_mmio tracepoint was enabled. A guest virtual machine might be
able to use this to cause a denial of service (crash).

CVE-2017-17805 
It was discovered that some implementations of the Salsa20 block
cipher did not correctly handle zero-length input. A local user
could use this to cause a denial of service (crash) or possibly
have other security impact.

CVE-2017-17806 
It was discovered that the HMAC implementation could be used with
an underlying hash algorithm that requires a key, which was not
intended. A local user could use this to cause a denial of
service (crash or memory corruption), or possibly for privilege
escalation.

CVE-2017-17807 
Eric Biggers discovered that the KEYS subsystem lacked a check for
write permission when adding keys to a process's default keyring.
A local user could use this to cause a denial of service or to
obtain sensitive information.

CVE-2017-17862 
Alexei Starovoitov discovered that the Extended BPF verifier
ignored unreachable code, even though it would still be processed
by JIT compilers. This could possibly be used by local users for
denial of service. It also increases the severity of bugs in
determining unreachable code.

CVE-2017-17863 
Jann Horn discovered that the Extended BPF verifier did not
correctly model pointer arithmetic on the stack frame pointer.
A local user can use this for privilege escalation.

CVE-2017-17864 
Jann Horn discovered that the Extended BPF verifier could fail to
detect pointer leaks from conditional code. A local user could
use this to obtain sensitive information in order to exploit
other vulnerabilities.

CVE-2017-1000407 
Andrew Honig reported that the KVM implementation for Intel
processors allowed direct access to host I/O port 0x80, which
is not generally safe. On some systems this allows a guest
VM to cause a denial of service (crash) of the host.

CVE-2017-1000410 
Ben Seri reported that the Bluetooth subsystem did not correctly
handle short EFS information elements in L2CAP messages. An
attacker able to communicate over Bluetooth could use this to
obtain sensitive information from the kernel.

The various problems in the Extended BPF verifier can be mitigated by
disabling use of Extended BPF by unprivileged users:
sysctl kernel.unprivileged_bpf_disabled=1Debian disables unprivileged user namespaces by default, but if they
are enabled (via the kernel.unprivileged_userns_clone sysctl) then
CVE-2017-17448 
can be exploited by any local user.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"hyperv-daemons", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcpupower-dev", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcpupower1", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libusbip-dev", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-compiler-gcc-6-arm", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-compiler-gcc-6-s390", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-compiler-gcc-6-x86", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-cpupower", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-doc-4.9", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-4kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-5kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-686", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-arm64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-armel", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-armhf", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-i386", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-mips", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-mips64el", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-mipsel", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-ppc64el", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-s390x", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-arm64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-armmp", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-armmp-lpae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-common", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-common-rt", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-loongson-3", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-marvell", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-octeon", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-powerpc64le", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-rt-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-rt-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-s390x", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-4kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-5kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-686", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-arm64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-armel", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-armhf", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-i386", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-mips", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-mips64el", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-mipsel", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-ppc64el", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-s390x", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-arm64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-armmp", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-armmp-lpae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-common", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-common-rt", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-loongson-3", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-marvell", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-octeon", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-powerpc64le", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-rt-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-rt-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-s390x", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-4kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-4kc-malta-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-5kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-5kc-malta-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686-pae-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-amd64-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-arm64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-arm64-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp-lpae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp-lpae-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-loongson-3", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-loongson-3-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-marvell", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-marvell-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-octeon", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-octeon-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-powerpc64le", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-powerpc64le-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-686-pae-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-amd64-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-s390x", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-3-s390x-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-4kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-4kc-malta-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-5kc-malta", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-5kc-malta-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686-pae-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-amd64-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-arm64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-arm64-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp-lpae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp-lpae-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-loongson-3", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-loongson-3-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-marvell", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-marvell-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-octeon", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-octeon-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-powerpc64le", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-powerpc64le-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-686-pae", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-686-pae-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-amd64", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-amd64-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-s390x", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-4.9.0-4-s390x-dbg", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-kbuild-4.9", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-libc-dev", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-manual-4.9", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-perf-4.9", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-source-4.9", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-support-4.9.0-3", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-support-4.9.0-4", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"usbip", ver:"4.9.65-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

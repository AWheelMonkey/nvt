###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1422.nasl 12806 2018-12-17 06:39:00Z ckuersteiner $
#
# Auto-generated from advisory DLA 1422-2 using nvtgen 1.0
# Script version: 2.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891422");
  script_version("$Revision: 12806 $");
  script_cve_id("CVE-2017-5715", "CVE-2017-5753", "CVE-2018-1000204", "CVE-2018-1066", "CVE-2018-10853",
                "CVE-2018-1093", "CVE-2018-10940", "CVE-2018-1130", "CVE-2018-11506", "CVE-2018-12233",
                "CVE-2018-3665", "CVE-2018-5814", "CVE-2018-9422");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1422-2] linux security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-17 07:39:00 +0100 (Mon, 17 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-07-16 00:00:00 +0200 (Mon, 16 Jul 2018)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00016.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"linux on Debian Linux");
  script_tag(name:"insight", value:"The Linux kernel is the core of the Linux operating system.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
3.16.57-1. This update additionally fixes Debian bug #898165, and
includes many more bug fixes from stable update 3.16.57.

We recommend that you upgrade your linux packages.");
  script_tag(name:"summary",  value:"The previous update to linux failed to build for the armhf (ARM EABI
hard-float) architecture. This update corrects that. For all other
architectures, there is no need to upgrade or reboot again. For
reference, the relevant part of the original advisory text follows.

Several vulnerabilities have been discovered in the Linux kernel that
may lead to a privilege escalation, denial of service or information
leaks.

CVE-2017-5715

Multiple researchers have discovered a vulnerability in various
processors supporting speculative execution, enabling an attacker
controlling an unprivileged process to read memory from arbitrary
addresses, including from the kernel and all other processes
running on the system.

This specific attack has been named Spectre variant 2 (branch
target injection) and is mitigated for the x86 architecture (amd64
and i386) by using new microcoded features.

This mitigation requires an update to the processor's microcode,
which is non-free. For recent Intel processors, this is included
in the intel-microcode package from version 3.20180425.1~deb8u1.
For other processors, it may be included in an update to the
system BIOS or UEFI firmware, or in a later update to the
amd64-microcode package.

This vulnerability was already mitigated for the x86 architecture
by the 'retpoline' feature.

CVE-2017-5753

Further instances of code that was vulnerable to Spectre variant 1
(bounds-check bypass) have been mitigated.

CVE-2018-1066

Dan Aloni reported to Red Hat that the CIFS client implementation
would dereference a null pointer if the server sent an invalid
response during NTLMSSP setup negotiation. This could be used by a
malicious server for denial of service.

The previously applied mitigation for this issue was not
appropriate for Linux 3.16 and has been replaced by an alternate
fix.

CVE-2018-1093

Wen Xu reported that a crafted ext4 filesystem image could trigger
an out-of-bounds read in the ext4_valid_block_bitmap() function. A
local user able to mount arbitrary filesystems could use this for
denial of service.

CVE-2018-1130

The syzbot software found that the DCCP implementation of
sendmsg() does not check the socket state, potentially leading
to a null pointer dereference. A local user could use this to
cause a denial of service (crash). 

CVE-2018-3665

Multiple researchers have discovered that some Intel x86
processors can speculatively read floating-point and vector
registers even when access to those registers is disabled. The
Linux kernel's 'lazy FPU' feature relies on that access control to
avoid saving and restoring those registers for tasks that do not
use them, and was enabled by default on x86 processors that do
not support the XSAVEOPT instruction.

If 'lazy FPU' is enabled on one of the affected processors, an
attacker controlling an unprivileged process may be able to read
sensitive information from other users' processes or the kernel.
This specifically affects processors based on the 'Nehalem' and
'Westemere' core designs.

This issue has been mitigated by disabling 'lazy FPU' by default
on all x86 processors that support the FXSAVE and FXRSTOR
instructions, which includes all processors known to be affected
and most processors that perform speculative execution. It can
also be mitigated by adding the kernel parameter: eagerfpu=on

CVE-2018-5814

Jakub Jirasek reported race conditions in the USB/IP host driver.
A malicious client could use this to cause a denial of service
(crash or memory corruption), and possibly to execute code, on a
USB/IP server.

CVE-2018-9422

It was reported that the futex() system call could be used by an
unprivileged user for privilege escalation.

CVE-2018-10853

Andy Lutomirski and Mika Penttil? reported that KVM for x86
processors did not perform a necessary privilege check when
emulating certain instructions. This could be used by an
unprivileged user in a guest VM to escalate their privileges
within the guest.

CVE-2018-10940

Dan Carpenter reported that the optical disc driver (cdrom) does
not correctly validate the parameter to the CDROM_MEDIA_CHANGED
ioctl. A user with access to a cdrom device could use this to
cause a denial of service (crash).

CVE-2018-11506

Piotr Gabriel Kosinski and Daniel Shapira reported that the
SCSI optical disc driver (sr) did not allocate a sufficiently
large buffer for sense data. A user with access to a SCSI
optical disc device that can produce more than 64 bytes of
sense data could use this to cause a denial of service (crash
or memory corruption), and possibly for privilege escalation.

CVE-2018-12233

Shankara Pailoor reported that a crafted JFS filesystem image
could trigger a denial of service (memory corruption). This
could possibly also be used for privilege escalation.

CVE-2018-1000204

The syzbot software found that the SCSI generic driver (sg) would
in some circumstances allow reading data from uninitialised
buffers, which could include sensitive information from the kernel
or other tasks. However, only privileged users with the
CAP_SYS_ADMIN or CAP_SYS_RAWIO capability were allowed to do this,
so this has little or no security impact.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"linux-compiler-gcc-4.8-arm", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-compiler-gcc-4.8-x86", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-compiler-gcc-4.9-x86", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-doc-3.16", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-586", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-686-pae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-all", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-all-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-all-armel", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-all-armhf", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-all-i386", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-armmp", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-armmp-lpae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-common", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-ixp4xx", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-kirkwood", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-orion5x", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-4-versatile", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-586", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-686-pae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-all", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-all-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-all-armel", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-all-armhf", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-all-i386", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-armmp", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-armmp-lpae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-common", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-ixp4xx", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-kirkwood", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-orion5x", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-5-versatile", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-586", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-686-pae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-all", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-all-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-all-armel", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-all-armhf", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-all-i386", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-armmp", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-armmp-lpae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-common", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-ixp4xx", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-kirkwood", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-orion5x", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-headers-3.16.0-6-versatile", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-586", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-686-pae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-686-pae-dbg", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-amd64-dbg", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-armmp", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-armmp-lpae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-ixp4xx", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-kirkwood", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-orion5x", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-4-versatile", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-586", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-686-pae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-686-pae-dbg", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-amd64-dbg", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-armmp", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-armmp-lpae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-ixp4xx", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-kirkwood", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-orion5x", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-5-versatile", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-586", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-686-pae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-686-pae-dbg", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-amd64-dbg", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-armmp", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-armmp-lpae", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-ixp4xx", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-kirkwood", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-orion5x", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-image-3.16.0-6-versatile", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-libc-dev", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-manual-3.16", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-source-3.16", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-support-3.16.0-4", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-support-3.16.0-6", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xen-linux-system-3.16.0-4-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xen-linux-system-3.16.0-5-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xen-linux-system-3.16.0-6-amd64", ver:"3.16.57-1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

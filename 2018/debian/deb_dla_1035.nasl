###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1035.nasl 11317 2018-09-11 08:57:27Z asteins $
#
# Auto-generated from advisory DLA 1035-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891035");
  script_version("$Revision: 11317 $");
  script_cve_id("CVE-2016-9602", "CVE-2016-9603", "CVE-2017-7377", "CVE-2017-7471", "CVE-2017-7493", "CVE-2017-7718", "CVE-2017-7980", "CVE-2017-8086");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1035-1] qemu security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-11 10:57:27 +0200 (Tue, 11 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-02-08 00:00:00 +0100 (Thu, 08 Feb 2018)");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/07/msg00027.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"qemu on Debian Linux");
  script_tag(name:"insight", value:"QEMU is a fast processor emulator: currently the package supports
ARM, CRIS, i386, M68k (ColdFire), MicroBlaze, MIPS, PowerPC, SH4,
SPARC and x86-64 emulation. By using dynamic translation it achieves
reasonable speed while being easy to port on new host CPUs. QEMU has
two operating modes:");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.1.2+dfsg-6+deb7u22.

We recommend that you upgrade your qemu packages.");
  script_tag(name:"summary",  value:"Several vulnerabilities were discovered in qemu, a fast processor
emulator. The Common Vulnerabilities and Exposures project identifies
the following problems:

CVE-2016-9603

qemu-kvm built with the Cirrus CLGD 54xx VGA Emulator and the VNC
display driver support is vulnerable to a heap buffer overflow
issue. It could occur when Vnc client attempts to update its
display after a vga operation is performed by a guest.

A privileged user/process inside guest could use this flaw to crash
the Qemu process resulting in DoS OR potentially leverage it to
execute arbitrary code on the host with privileges of the Qemu
process.

CVE-2017-7718

qemu-kvm built with the Cirrus CLGD 54xx VGA Emulator support is
vulnerable to an out-of-bounds access issue. It could occur while
copying VGA data via bitblt functions cirrus_bitblt_rop_fwd_transp_
and/or cirrus_bitblt_rop_fwd_.

A privileged user inside guest could use this flaw to crash the
Qemu process resulting in DoS.

CVE-2017-7980

qemu-kvm built with the Cirrus CLGD 54xx VGA Emulator support is
vulnerable to an out-of-bounds r/w access issues. It could occur
while copying VGA data via various bitblt functions.

A privileged user inside guest could use this flaw to crash the
Qemu process resulting in DoS OR potentially execute arbitrary code
on a host with privileges of Qemu process on the host.

CVE-2016-9602

Quick Emulator(Qemu) built with the VirtFS, host directory sharing via
Plan 9 File System(9pfs) support, is vulnerable to an improper link
following issue. It could occur while accessing symbolic link files
on a shared host directory.

A privileged user inside guest could use this flaw to access host file
system beyond the shared folder and potentially escalating their
privileges on a host.

CVE-2017-7377

Quick Emulator(Qemu) built with the virtio-9p back-end support is
vulnerable to a memory leakage issue. It could occur while doing a I/O
operation via v9fs_create/v9fs_lcreate routine.

A privileged user/process inside guest could use this flaw to leak
host memory resulting in Dos.

CVE-2017-7471

Quick Emulator(Qemu) built with the VirtFS, host directory sharing via
Plan 9 File System(9pfs) support, is vulnerable to an improper access
control issue. It could occur while accessing files on a shared host
directory.

A privileged user inside guest could use this flaw to access host file
system beyond the shared folder and potentially escalating their
privileges on a host.

CVE-2017-7493

Quick Emulator(Qemu) built with the VirtFS, host directory sharing via
Plan 9 File System(9pfs) support, is vulnerable to an improper access
control issue. It could occur while accessing virtfs metadata files
in mapped-file security mode.

A guest user could use this flaw to escalate their privileges inside
guest.

CVE-2017-8086

Quick Emulator(Qemu) built with the virtio-9p back-end support is
vulnerable to a memory leakage issue. It could occur while querying
file system extended attributes via 9pfs_list_xattr() routine.

A privileged user/process inside guest could use this flaw to leak
host memory resulting in Dos.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"qemu", ver:"1.1.2+dfsg-6+deb7u22", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-keymaps", ver:"1.1.2+dfsg-6+deb7u22", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-system", ver:"1.1.2+dfsg-6+deb7u22", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user", ver:"1.1.2+dfsg-6+deb7u22", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-user-static", ver:"1.1.2+dfsg-6+deb7u22", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-utils", ver:"1.1.2+dfsg-6+deb7u22", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

# OpenVAS Vulnerability Test
# $Id: deb_3349.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3349-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703349");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-5165", "CVE-2015-5745");
    script_name("Debian Security Advisory DSA 3349-1 (qemu-kvm - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-09-02 00:00:00 +0200 (Wed, 02 Sep 2015)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3349.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "qemu-kvm on Debian Linux");
    script_tag(name: "insight",   value: "Using KVM, one can run multiple virtual
PCs, each running unmodified Linux or Windows images. Each virtual machine has
private virtualized hardware: a network card, disk, graphics adapter, etc.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 1.1.2+dfsg-6+deb7u9.

We recommend that you upgrade your qemu-kvm packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in qemu-kvm, a full virtualization solution on x86 hardware.

CVE-2015-5165 
Donghai Zhu discovered that the QEMU model of the RTL8139 network
card did not sufficiently validate inputs in the C+ mode offload
emulation, allowing a malicious guest to read uninitialized memory
from the QEMU process's heap.

CVE-2015-5745 
A buffer overflow vulnerability was discovered in the way QEMU
handles the virtio-serial device. A malicious guest could use this
flaw to mount a denial of service (QEMU process crash).");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"kvm", ver:"1.1.2+dfsg-6+deb7u9", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm", ver:"1.1.2+dfsg-6+deb7u9", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"qemu-kvm-dbg", ver:"1.1.2+dfsg-6+deb7u9", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

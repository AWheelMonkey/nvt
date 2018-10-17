# OpenVAS Vulnerability Test
# $Id: deb_3400.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3400-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703400");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-1335");
    script_name("Debian Security Advisory DSA 3400-1 (lxc - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-11-19 00:00:00 +0100 (Thu, 19 Nov 2015)");
    script_tag(name:"cvss_base", value:"7.2");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3400.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "lxc on Debian Linux");
    script_tag(name: "insight",   value: "Containers are insulated areas inside
a system, which have their own namespace for filesystem, network, PID, IPC, CPU
and memory allocation and which can be created using the Control Group and
Namespace features included in the Linux kernel.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 1:1.0.6-6+deb8u2.

We recommend that you upgrade your lxc packages.");
    script_tag(name: "summary",   value: "Roman Fiedler discovered a directory
traversal flaw in LXC, the Linux Containers userspace tools. A local attacker
with access to a LXC container could exploit this flaw to run programs inside
the container that are not confined by AppArmor or expose unintended files in
the host to the container.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"lxc", ver:"1:1.0.6-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lxc-dbg", ver:"1:1.0.6-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_3317.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3317-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703317");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-1331", "CVE-2015-1334");
    script_name("Debian Security Advisory DSA 3317-1 (lxc - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-07-25 00:00:00 +0200 (Sat, 25 Jul 2015)");
    script_tag(name:"cvss_base", value:"4.9");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:C/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3317.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "lxc on Debian Linux");
        script_tag(name: "insight",   value: "Containers are insulated areas inside a system, which have their own namespace
for filesystem, network, PID, IPC, CPU and memory allocation and which can be
created using the Control Group and Namespace features included in the Linux
kernel.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these problems have been fixed in
version 1:1.0.6-6+deb8u1.

For the testing distribution (stretch), these problems have been fixed
in version 1:1.0.7-4.

For the unstable distribution (sid), these problems have been fixed in
version 1:1.0.7-4.

We recommend that you upgrade your lxc packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been discovered in LXC, the Linux
Containers userspace tools. The Common Vulnerabilities and Exposures
project identifies the following problems:

CVE-2015-1331 
Roman Fiedler discovered a directory traversal flaw in LXC when
creating lock files. A local attacker could exploit this flaw to
create an arbitrary file as the root user.

CVE-2015-1334 
Roman Fiedler discovered that LXC incorrectly trusted the
container's proc filesystem to set up AppArmor profile changes and
SELinux domain transitions. A malicious container could create a
fake proc filesystem and use this flaw to run programs inside the
container that are not confined by AppArmor or SELinux.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"lxc", ver:"1:1.0.6-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lxc-dbg", ver:"1:1.0.6-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_3812.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3812-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703812");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2017-6903");
    script_name("Debian Security Advisory DSA 3812-1 (ioquake3 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-03-18 00:00:00 +0100 (Sat, 18 Mar 2017)");
    script_tag(name:"cvss_base", value:"9.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3812.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "ioquake3 on Debian Linux");
        script_tag(name: "insight",   value: "This package installs a modified version of the ioQuake3 game engine,
which can be used to play various games based on that engine, such as
OpenArena, Quake III: Arena, World of Padman and Urban Terror.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 1.36+u20140802+gca9eebb-2+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 1.36+u20161101+dfsg1-2.

We recommend that you upgrade your ioquake3 packages.");
    script_tag(name: "summary",   value: "It was discovered that ioquake3, a modified version of the ioQuake3 game
engine performs insufficent restrictions on automatically downloaded
content (pk3 files or game code), which allows malicious game servers to
modify configuration settings including driver settings.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ioquake3", ver:"1.36+u20140802+gca9eebb-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ioquake3-dbg", ver:"1.36+u20140802+gca9eebb-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ioquake3-server", ver:"1.36+u20140802+gca9eebb-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

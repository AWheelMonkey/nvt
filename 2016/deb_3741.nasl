# OpenVAS Vulnerability Test
# $Id: deb_3741.nasl 8261 2017-12-29 09:13:46Z teissa $
# Auto-generated from advisory DSA 3741-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703741");
    script_version("$Revision: 8261 $");
    script_cve_id("CVE-2016-1254");
    script_name("Debian Security Advisory DSA 3741-1 (tor - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-29 10:13:46 +0100 (Fri, 29 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-12-20 00:00:00 +0100 (Tue, 20 Dec 2016)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3741.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tor on Debian Linux");
    script_tag(name: "insight",   value: "Tor is a connection-based low-latency
anonymous communication system.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 0.2.5.12-4.

For the testing (stretch) and unstable (sid) distributions, this
problem has been fixed in version 0.2.9.8-2.

We recommend that you upgrade your tor packages.");
    script_tag(name: "summary",   value: "It was discovered that Tor, a
connection-based low-latency anonymous communication system, may read one byte
past a buffer when parsing hidden service descriptors. This issue may enable a
hostile hidden service to crash Tor clients depending on hardening options and
malloc implementation.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"tor", ver:"0.2.9.8-2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tor-dbg", ver:"0.2.9.8-2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tor-geoipdb", ver:"0.2.9.8-2", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tor", ver:"0.2.5.12-4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tor-dbg", ver:"0.2.5.12-4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tor-geoipdb", ver:"0.2.5.12-4", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

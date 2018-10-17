# OpenVAS Vulnerability Test
# $Id: deb_3442.nasl 8115 2017-12-14 07:30:22Z teissa $
# Auto-generated from advisory DSA 3442-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703442");
    script_version("$Revision: 8115 $");
    script_cve_id("CVE-2015-8605");
    script_name("Debian Security Advisory DSA 3442-1 (isc-dhcp - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-14 08:30:22 +0100 (Thu, 14 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-01-13 00:00:00 +0100 (Wed, 13 Jan 2016)");
    script_tag(name:"cvss_base", value:"5.7");
    script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:N/I:N/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3442.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "isc-dhcp on Debian Linux");
    script_tag(name: "insight",   value: "Dynamic Host Configuration Protocol
(DHCP) is a protocol that gives client machines 'leases' for IP addresses and
can automatically set their network configuration.

This is the Internet Software Consortium's implementation of a
DHCP client.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 4.2.2.dfsg.1-5+deb70u8.

For the stable distribution (jessie), this problem has been fixed in
version 4.3.1-6+deb8u2.

For the testing (stretch) and unstable (sid) distributions, this
problem will be fixed soon.

We recommend that you upgrade your isc-dhcp packages.");
    script_tag(name: "summary",   value: "It was discovered that a maliciously
crafted packet can crash any of the isc-dhcp applications. This includes the DHCP
client, relay, and server application. Only IPv4 setups are affected.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"isc-dhcp-client", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-client-dbg", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-common", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-dbg", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-dev", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay-dbg", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-dbg", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-ldap", ver:"4.3.1-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-client", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-client-dbg", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-common", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-dev", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay-dbg", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-dbg", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-ldap", ver:"4.2.2.dfsg.1-5+deb70u8", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

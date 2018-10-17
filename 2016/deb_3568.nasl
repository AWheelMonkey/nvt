# OpenVAS Vulnerability Test
# $Id: deb_3568.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3568-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703568");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-4008");
    script_name("Debian Security Advisory DSA 3568-1 (libtasn1-6 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-05-05 00:00:00 +0200 (Thu, 05 May 2016)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3568.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libtasn1-6 on Debian Linux");
    script_tag(name: "insight",   value: "Manage ASN1 (Abstract Syntax
Notation One) structures. The main features of this library are:

* on-line ASN1 structure management that doesn't require any C code
file generation.
* off-line ASN1 structure management with C code file generation
containing an array.
* DER (Distinguish Encoding Rules) encoding
* no limits for INTEGER and ENUMERATED values");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 4.2-3+deb8u2.

For the testing distribution (stretch), this problem has been fixed
in version 4.8-1.

For the unstable distribution (sid), this problem has been fixed in
version 4.8-1.

We recommend that you upgrade your libtasn1-6 packages.");
    script_tag(name: "summary",   value: "Pascal Cuoq and Miod Vallat discovered
that Libtasn1, a library to manage ASN.1 structures, does not correctly handle
certain malformed DER certificates. A remote attacker can take advantage of this
flaw to cause an application using the Libtasn1 library to hang, resulting in a
denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libtasn1-3-bin", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6:amd64", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6:i386", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6-dbg:amd64", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6-dbg:i386", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6-dev", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-bin", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-doc", ver:"4.2-3+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-3-bin", ver:"4.8-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6:amd64", ver:"4.8-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6:i386", ver:"4.8-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-6-dev", ver:"4.8-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-bin", ver:"4.8-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtasn1-doc", ver:"4.8-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_3468.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3468-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703468");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2015-5291", "CVE-2015-8036");
    script_name("Debian Security Advisory DSA 3468-1 (polarssl - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-02-06 00:00:00 +0100 (Sat, 06 Feb 2016)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3468.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "polarssl on Debian Linux");
    script_tag(name: "insight",   value: "PolarSSL is a fork of the abandonned
project XySSL. It is a lean crypto library providing SSL and TLS support in your
programs.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 1.2.9-1~deb7u6.

For the stable distribution (jessie), these problems have been fixed in
version 1.3.9-2.1+deb8u1.

We recommend that you upgrade your polarssl packages.");
    script_tag(name: "summary",   value: "It was discovered that polarssl, a library
providing SSL and TLS support, contained two heap-based buffer overflows that could
allow a remote attacker to trigger denial of service (via application crash) or
arbitrary code execution.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libpolarssl-dev", ver:"1.2.9-1~deb7u6", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-runtime", ver:"1.2.9-1~deb7u6", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl0", ver:"1.2.9-1~deb7u6", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-dev", ver:"1.3.9-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl-runtime", ver:"1.3.9-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpolarssl7", ver:"1.3.9-2.1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

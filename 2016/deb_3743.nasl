# OpenVAS Vulnerability Test
# $Id: deb_3743.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3743-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703743");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2016-9964");
    script_name("Debian Security Advisory DSA 3743-1 (python-bottle - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-12-20 00:00:00 +0100 (Tue, 20 Dec 2016)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3743.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "python-bottle on Debian Linux");
    script_tag(name: "insight",   value: "Bottle is a fast and simple
WSGI-framework for the Python programming language. It offers request
dispatching with url parameter support (routes), templates, key/value
databases, a built-in HTTP server and adapters for many third party
WSGI/HTTP-server and template engines.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 0.12.7-1+deb8u1.

For the testing (stretch) and unstable (sid) distributions, this
problem has been fixed in version 0.12.11-1.

We recommend that you upgrade your python-bottle packages.");
    script_tag(name: "summary",   value: "It was discovered that bottle, a
WSGI-framework for the Python programming language, did not properly filter
'\r\n' sequences when handling redirections. This allowed an attacker to perform
CRLF attacks such as HTTP header injection.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"python-bottle", ver:"0.12.7-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-bottle-doc", ver:"0.12.7-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python3-bottle", ver:"0.12.7-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-bottle", ver:"0.12.11-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-bottle-doc", ver:"0.12.11-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python3-bottle", ver:"0.12.11-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

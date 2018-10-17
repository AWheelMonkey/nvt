# OpenVAS Vulnerability Test
# $Id: deb_3473.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3473-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703473");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-0742", "CVE-2016-0746", "CVE-2016-0747");
    script_name("Debian Security Advisory DSA 3473-1 (nginx - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-02-11 00:00:00 +0100 (Thu, 11 Feb 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3473.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "nginx on Debian Linux");
    script_tag(name: "insight",   value: "Nginx ('engine X') is a high-performance
web and reverse proxy server created by Igor Sysoev. It can be used both as a
standalone web server and as a proxy to reduce the load on back-end HTTP or mail
servers.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 1.2.1-2.2+wheezy4.

For the stable distribution (jessie), these problems have been fixed in
version 1.6.2-5+deb8u1.

For the testing distribution (stretch), these problems have been fixed
in version 1.9.10-1.

For the unstable distribution (sid), these problems have been fixed in
version 1.9.10-1.

We recommend that you upgrade your nginx packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were
discovered in the resolver in nginx, a small, powerful, scalable web/proxy server,
leading to denial of service or, potentially, to arbitrary code execution. These
only affect nginx if the resolver directive is used in a configuration file.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"nginx", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-common", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-doc", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras-dbg", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full-dbg", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light-dbg", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-naxsi", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-naxsi-dbg", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-naxsi-ui", ver:"1.2.1-2.2+wheezy4", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-common", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-doc", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras-dbg", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full-dbg", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light-dbg", ver:"1.6.2-5+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-common", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-doc", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras-dbg", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full-dbg", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light-dbg", ver:"1.9.10-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

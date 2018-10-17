# OpenVAS Vulnerability Test
# $Id: deb_3540.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3540-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703540");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2016-2347");
    script_name("Debian Security Advisory DSA 3540-1 (lhasa - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-04-03 00:00:00 +0200 (Sun, 03 Apr 2016)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3540.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "lhasa on Debian Linux");
    script_tag(name: "insight",   value: "Lhasa lha is a tool for parsing LHA
(.lzh) archives and a free replacement for the Unix LHA tool.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 0.0.7-2+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 0.2.0+git3fe46-1+deb8u1.

For the testing distribution (stretch), this problem has been fixed
in version 0.3.1-1.

For the unstable distribution (sid), this problem has been fixed in
version 0.3.1-1.

We recommend that you upgrade your lhasa packages.");
    script_tag(name: "summary",   value: "Marcin Noga discovered an integer
underflow in Lhasa, a lzh archive decompressor, which might result in the execution
of arbitrary code if a malformed archive is processed.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"lhasa", ver:"0.0.7-2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa-dev", ver:"0.0.7-2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa0:amd64", ver:"0.0.7-2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa0:i386", ver:"0.0.7-2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"lhasa", ver:"0.3.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa-dev", ver:"0.3.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa0:amd64", ver:"0.3.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa0:i386", ver:"0.3.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"lhasa", ver:"0.2.0+git3fe46-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa-dev", ver:"0.2.0+git3fe46-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa0:amd64", ver:"0.2.0+git3fe46-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblhasa0:i386", ver:"0.2.0+git3fe46-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

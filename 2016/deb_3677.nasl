# OpenVAS Vulnerability Test
# $Id: deb_3677.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3677-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703677");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-5418", "CVE-2016-6250", "CVE-2016-7166");
    script_name("Debian Security Advisory DSA 3677-1 (libarchive - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-09-25 00:00:00 +0200 (Sun, 25 Sep 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3677.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libarchive on Debian Linux");
    script_tag(name: "insight",   value: "The libarchive library provides a
flexible interface for reading and writing streaming archive files such as
tar and cpio.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 3.1.2-11+deb8u3.

We recommend that you upgrade your libarchive packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in libarchive, a multi-format archive and compression library, which may lead to
denial of service (memory consumption and application crash), bypass of sandboxing
restrictions and overwrite arbitrary files with arbitrary data from an
archive, or the execution of arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"bsdcpio", ver:"3.1.2-11+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bsdtar", ver:"3.1.2-11+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libarchive-dev:amd64", ver:"3.1.2-11+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libarchive-dev:i386", ver:"3.1.2-11+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libarchive13:amd64", ver:"3.1.2-11+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libarchive13:i386", ver:"3.1.2-11+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}


if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

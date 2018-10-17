# OpenVAS Vulnerability Test
# $Id: deb_3112.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3112-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703112");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-8145");
    script_name("Debian Security Advisory DSA 3112-1 (sox - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-12-23 00:00:00 +0100 (Tue, 23 Dec 2014)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3112.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "sox on Debian Linux");
    script_tag(name: "insight",   value: "SoX is a command line utility that
can convert various formats of computer audio files in to other formats. It
can also apply various effects to these sound files during the conversion. As
an added bonus, SoX can play and record audio files on several unix-style
platforms.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 14.4.0-3+deb7u1.

For the upcoming stable distribution (jessie) and the unstable
distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your sox packages.");
    script_tag(name: "summary",   value: "Michele Spagnuolo of the Google Security
Team discovered two heap-based buffer overflows in SoX, the Swiss Army knife of
sound processing programs. A specially crafted wav file could cause an application
using SoX to crash or, possibly, execute arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libsox-dev", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-all", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-alsa", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-ao", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-base", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-ffmpeg", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-mp3", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-oss", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox-fmt-pulse", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsox2", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sox", ver:"14.4.0-3+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

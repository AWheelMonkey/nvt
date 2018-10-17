###########################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3082.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3082-1 using nvtgen 1.0
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
##############################################################################

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703082");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-8962", "CVE-2014-9028");
    script_name("Debian Security Advisory DSA 3082-1 (flac - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-11-30 00:00:00 +0100 (Sun, 30 Nov 2014)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3082.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "flac on Debian Linux");
    script_tag(name: "insight",   value: "FLAC stands for Free Lossless Audio
Codec. Grossly oversimplified, FLAC is similar to MP3, but lossless. The FLAC
project consists of:");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 1.2.1-6+deb7u1.

For the testing distribution (jessie) and unstable distribution (sid),
these problems have been fixed in version 1.3.0-3.

We recommend that you upgrade your flac packages.");
    script_tag(name: "summary",   value: "Michele Spagnuolo, of Google Security
Team, and Miroslav Lichvar, of Red Hat, discovered two issues in flac, a library
handling Free Lossless Audio Codec media: by providing a specially crafted FLAC
file, an attacker could execute arbitrary code.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"flac", ver:"1.2.1-6+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libflac++-dev", ver:"1.2.1-6+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libflac++6", ver:"1.2.1-6+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libflac-dev", ver:"1.2.1-6+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libflac-doc", ver:"1.2.1-6+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libflac8", ver:"1.2.1-6+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

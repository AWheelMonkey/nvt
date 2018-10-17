# OpenVAS Vulnerability Test
# $Id: deb_3555.nasl 8115 2017-12-14 07:30:22Z teissa $
# Auto-generated from advisory DSA 3555-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703555");
    script_version("$Revision: 8115 $");
    script_cve_id("CVE-2011-5326", "CVE-2014-9771", "CVE-2016-3993", "CVE-2016-3994",
                  "CVE-2016-4024");
    script_name("Debian Security Advisory DSA 3555-1 (imlib2 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-14 08:30:22 +0100 (Thu, 14 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-04-23 00:00:00 +0200 (Sat, 23 Apr 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3555.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "imlib2 on Debian Linux");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 1.4.5-1+deb7u2.

For the stable distribution (jessie), these problems have been fixed in
version 1.4.6-2+deb8u2.

For the unstable distribution (sid), these problems have been fixed in
version 1.4.8-1.

We recommend that you upgrade your imlib2 packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were discovered
in imlib2, an image manipulation library.

CVE-2011-5326 
Kevin Ryde discovered that attempting to draw a 2x1 radi ellipse
results in a floating point exception.

CVE-2014-9771 
It was discovered that an integer overflow could lead to invalid
memory reads and unreasonably large memory allocations.

CVE-2016-3993 
Yuriy M. Kaminskiy discovered that drawing using coordinates from
an untrusted source could lead to an out-of-bound memory read, which
in turn could result in an application crash.

CVE-2016-3994 
Jakub Wilk discovered that a malformed image could lead to an
out-of-bound read in the GIF loader, which may result in an
application crash or information leak.

CVE-2016-4024 
Yuriy M. Kaminskiy discovered an integer overflow that could lead to
an insufficient heap allocation and out-of-bound memory write.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libimlib2", ver:"1.4.5-1+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libimlib2-dev", ver:"1.4.5-1+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libimlib2", ver:"1.4.6-2+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libimlib2-dev", ver:"1.4.6-2+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

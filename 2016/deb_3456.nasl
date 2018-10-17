# OpenVAS Vulnerability Test
# $Id: deb_3456.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3456-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703456");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2015-6792", "CVE-2016-1612", "CVE-2016-1613", "CVE-2016-1614",
                  "CVE-2016-1615", "CVE-2016-1616", "CVE-2016-1617", "CVE-2016-1618",
                  "CVE-2016-1619", "CVE-2016-1620");
    script_name("Debian Security Advisory DSA 3456-1 (chromium-browser - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-01-27 00:00:00 +0100 (Wed, 27 Jan 2016)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3456.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "chromium-browser on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 48.0.2564.82-1~deb8u1.

For the testing distribution (stretch), these problems will be fixed soon.

For the unstable distribution (sid), these problems have been fixed in
version 48.0.2564.82-1.

We recommend that you upgrade your chromium-browser packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities were
discovered in the chromium web browser.

CVE-2015-6792
An issue was found in the handling of MIDI files.

CVE-2016-1612
cloudfuzzer discovered a logic error related to receiver
compatibility in the v8 javascript library.

CVE-2016-1613
A use-after-free issue was discovered in the pdfium library.

CVE-2016-1614
Christoph Diehl discovered an information leak in Webkit/Blink.

CVE-2016-1615
Ron Masas discovered a way to spoof URLs.

CVE-2016-1616
Luan Herrera discovered a way to spoof URLs.

CVE-2016-1617
jenuis discovered a way to discover whether an HSTS web site had
been visited.

CVE-2016-1618
Aaron Toponce discovered the use of weak random number
generator.

CVE-2016-1619
Keve Nagy discovered an out-of-bounds-read issue in the pdfium
library.

CVE-2016-1620
The chrome 48 development team found and fixed various issues
during internal auditing. Also multiple issues were fixed in
the v8 javascript library, version 4.7.271.17.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"chromedriver", ver:"48.0.2564.82-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium", ver:"48.0.2564.82-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-dbg", ver:"48.0.2564.82-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-inspector", ver:"48.0.2564.82-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-l10n", ver:"48.0.2564.82-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_3050.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3050-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703050");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-1574", "CVE-2014-1576", "CVE-2014-1577", "CVE-2014-1578", "CVE-2014-1581", "CVE-2014-1583", "CVE-2014-1585", "CVE-2014-1586");
    script_name("Debian Security Advisory DSA 3050-1 (iceweasel - security update)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-10-15 00:00:00 +0200 (Wed, 15 Oct 2014)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3050.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "iceweasel on Debian Linux");
        script_tag(name: "insight",   value: "Iceweasel is Firefox, rebranded. It is a powerful, extensible web browser
with support for modern web application technologies.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy), these problems have been fixed in
version 31.2.0esr-2~deb7u1.

For the unstable distribution (sid), these problems have been fixed in
version 31.2.0esr-1.

For the experimental distribution, these problems have been fixed in
version 33.0-1.

We recommend that you upgrade your iceweasel packages.");
    script_tag(name: "summary",   value: "Multiple security issues have been found in Iceweasel, Debian's version
of the Mozilla Firefox web browser: Multiple memory safety errors, buffer
overflows, use-after-frees and other implementation errors may lead to
the execution of arbitrary code, denial of service, the bypass of the
same-origin policy or a loss of privacy.

This update updates Iceweasel to the ESR31 series of Firefox. The new
release introduces a new user interface.

In addition, this update also disables SSLv3.");
    script_tag(name: "vuldetect", value:  "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ach", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-af", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ak", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-all", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-as", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ast", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-be", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-bd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ca", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-csb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cy", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-da", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-de", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-el", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-gb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-za", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eo", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-cl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-es", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-mx", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-et", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fa", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ff", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fy-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ga-ie", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gu-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-he", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hi-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hy-am", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-id", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-is", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-it", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ja", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-km", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ko", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ku", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lij", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lv", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mai", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ml", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nb-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nn-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nso", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-or", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pa-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-pt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-rm", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ro", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ru", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-si", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-son", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sq", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sv-se", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta-lk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-te", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-th", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-tr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-uk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-vi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-cn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-tw", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ach", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-af", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ak", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-all", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-as", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ast", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-be", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-bd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ca", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-csb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cy", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-da", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-de", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-el", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-gb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-za", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eo", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-cl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-es", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-mx", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-et", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fa", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ff", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fy-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ga-ie", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gu-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-he", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hi-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hy-am", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-id", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-is", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-it", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ja", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-km", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ko", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ku", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lij", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lv", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mai", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ml", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nb-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nn-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nso", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-or", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pa-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-pt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-rm", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ro", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ru", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-si", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-son", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sq", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sv-se", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta-lk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-te", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-th", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-tr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-uk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-vi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-cn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-tw", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ach", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-af", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ak", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-all", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-as", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ast", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-be", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-bd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ca", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-csb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cy", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-da", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-de", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-el", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-gb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-za", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eo", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-cl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-es", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-mx", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-et", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fa", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ff", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fy-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ga-ie", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gu-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-he", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hi-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hy-am", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-id", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-is", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-it", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ja", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-km", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ko", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ku", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lij", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lv", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mai", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ml", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nb-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nn-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nso", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-or", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pa-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-pt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-rm", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ro", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ru", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-si", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-son", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sq", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sv-se", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta-lk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-te", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-th", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-tr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-uk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-vi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-cn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-tw", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ach", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-af", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ak", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-all", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-as", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ast", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-be", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-bd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ca", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cs", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-csb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cy", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-da", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-de", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-el", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-gb", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-za", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eo", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-ar", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-cl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-es", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-mx", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-et", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fa", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ff", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fy-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ga-ie", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gd", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gu-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-he", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hi-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hy-am", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-id", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-is", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-it", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ja", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-km", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ko", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ku", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lij", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lv", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mai", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ml", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nb-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nn-no", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nso", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-or", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pa-in", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-br", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-pt", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-rm", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ro", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ru", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-si", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sl", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-son", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sq", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sv-se", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta-lk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-te", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-th", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-tr", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-uk", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-vi", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-cn", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-tw", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zu", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs24d-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-24.0-dbg", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"31.2.0esr-2~deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

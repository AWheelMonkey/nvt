# OpenVAS Vulnerability Test
# $Id: deb_2583_1.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2583-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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

include("revisions-lib.inc");

tag_affected  = "iceweasel on Debian Linux";
tag_insight   = "Firefox is a redesign of the Mozilla browser component, similar to
Galeon, K-Meleon and Camino, but written using the XUL user interface
language and designed to be lightweight and cross-platform.";
tag_solution  = "For the stable distribution (squeeze), these problems have been fixed in
version 3.5.16-20.

For the testing distribution (wheezy), these problems have been fixed in
version 10.0.11esr-1.

For the unstable distribution (sid), these problems have been fixed in
version 10.0.11esr-1.

We recommend that you upgrade your iceweasel packages.";
tag_summary   = "Multiple vulnerabilities have been found in Iceweasel, the Debian web browser
based on Mozilla Firefox:

CVE-2012-5829Heap-based buffer overflow in the nsWindow::OnExposeEvent function could
allow remote attackers to execute arbitrary code.

CVE-2012-5842Multiple unspecified vulnerabilities in the browser engine could allow remote
attackers to cause a denial of service (memory corruption and application
crash) or possibly execute arbitrary code.

CVE-2012-4207The HZ-GB-2312 character-set implementation does not properly handle a ~
(tilde) character in proximity to a chunk delimiter, which allows remote
attackers to conduct cross-site scripting (XSS) attacks via a crafted
document.

CVE-2012-4201The evalInSandbox implementation uses an incorrect context during the
handling of JavaScript code that sets the location.href property, which
allows remote attackers to conduct cross-site scripting (XSS) attacks or read
arbitrary files by leveraging a sandboxed add-on.

CVE-2012-4216Use-after-free vulnerability in the gfxFont::GetFontEntry function allows
remote attackers to execute arbitrary code or cause a denial of service (heap
memory corruption) via unspecified vectors.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892583");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2012-5829", "CVE-2012-4201", "CVE-2012-5842", "CVE-2012-4216", "CVE-2012-4207");
    script_name("Debian Security Advisory DSA 2583-1 (iceweasel - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name:"creation_date", value:"2013-09-18 11:53:02 +0200 (Wed, 18 Sep 2013)");
    script_tag(name: "cvss_base", value:"10.0");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

    script_xref(name: "URL", value: "http://www.debian.org/security/2012/dsa-2583.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: tag_affected);
    script_tag(name: "insight",   value: tag_insight);
#    script_tag(name: "impact",    value: tag_impact);
    script_tag(name: "solution",  value: tag_solution);
    script_tag(name: "summary",   value: tag_summary);
    script_tag(name: "vuldetect", value: tag_vuldetect);
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");

    exit(0);
}

include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs2d", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs2d-dbg", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-1.9.1", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-1.9.1-dbg", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"3.5.16-20", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-dbg", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ach", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-af", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ak", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-all", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ar", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-as", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ast", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-be", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bg", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-bd", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bn-in", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-br", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-bs", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ca", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cs", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-csb", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-cy", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-da", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-de", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-el", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-gb", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-en-za", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eo", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-ar", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-cl", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-es", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-es-mx", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-et", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-eu", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fa", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ff", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fi", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fr", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-fy-nl", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ga-ie", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gd", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gl", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-gu-in", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-he", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hi-in", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hr", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hu", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-hy-am", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-id", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-is", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-it", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ja", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kk", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-km", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-kn", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ko", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ku", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lg", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lij", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lt", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-lv", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mai", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mk", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ml", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-mr", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nb-no", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nl", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nn-no", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-nso", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-or", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pa-in", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pl", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-br", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-pt-pt", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-rm", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ro", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ru", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-si", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sk", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sl", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-son", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sq", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sr", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-sv-se", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-ta-lk", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-te", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-th", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-tr", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-uk", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-vi", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-cn", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zh-tw", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceweasel-l10n-zu", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs-dev", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmozjs17d-dbg", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spidermonkey-bin", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-17.0-dbg", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xulrunner-dev", ver:"10.0.11esr-1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

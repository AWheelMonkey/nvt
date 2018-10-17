# OpenVAS Vulnerability Test
# $Id: deb_2572_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2572-1 (iceape)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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
tag_insight = "Several vulnerabilities have been discovered in Iceape, an internet
suite based on Seamonkey:

CVE-2012-3982
Multiple unspecified vulnerabilities in the browser engine
allow remote attackers to cause a denial of service (memory
corruption and application crash) or possibly execute
arbitrary code via unknown vectors.

CVE-2012-3986
Icedove does not properly restrict calls to DOMWindowUtils
methods, which allows remote attackers to bypass intended
access restrictions via crafted JavaScript code.

CVE-2012-3990
A Use-after-free vulnerability in the IME State Manager
implementation allows remote attackers to execute arbitrary
code via unspecified vectors, related to the
nsIContent::GetNameSpaceID function.

CVE-2012-3991
Icedove does not properly restrict JSAPI access to the
GetProperty function, which allows remote attackers to bypass
the Same Origin Policy and possibly have unspecified other
impact via a crafted web site.

CVE-2012-4179
A use-after-free vulnerability in the
nsHTMLCSSUtils::CreateCSSPropertyTxn function allows remote
attackers to execute arbitrary code or cause a denial of
service (heap memory corruption) via unspecified vectors.

CVE-2012-4180
A heap-based buffer overflow in the
nsHTMLEditor::IsPrevCharInNodeWhitespace function allows
remote attackers to execute arbitrary code via unspecified
vectors.

CVE-2012-4182
A use-after-free vulnerability in the
nsTextEditRules::WillInsert function allows remote attackers
to execute arbitrary code or cause a denial of service (heap
memory corruption) via unspecified vectors.

CVE-2012-4186
A heap-based buffer overflow in the
nsWav-eReader::DecodeAudioData function allows remote attackers
to execute arbitrary code via unspecified vectors.

CVE-2012-4188
A heap-based buffer overflow in the Convolve3x3 function
allows remote attackers to execute arbitrary code via
unspecified vectors.

Additionally, this update fixes a regression in the patch for
CVE-2012-3959, released in DSA-2554-1.

For the stable distribution (squeeze), these problems have been fixed in
version 2.0.11-16.

For the testing distribution (wheezy), these problems have been fixed in
version 10.0.10esr-1.

For the unstable distribution (sid), these problems have been fixed in
version 10.0.10esr-1.

We recommend that you upgrade your iceape packages.";
tag_summary = "The remote host is missing an update to iceape
announced via advisory DSA 2572-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202572-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.72567");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2012-3982", "CVE-2012-3986", "CVE-2012-3990", "CVE-2012-3991", "CVE-2012-4179", "CVE-2012-4180", "CVE-2012-4182", "CVE-2012-4186", "CVE-2012-4188", "CVE-2012-3959");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-11-16 03:15:37 -0500 (Fri, 16 Nov 2012)");
 script_name("Debian Security Advisory DSA 2572-1 (iceape)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"iceape", ver:"2.0.11-16", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-browser", ver:"2.0.11-16", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-chatzilla", ver:"2.0.11-16", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-dbg", ver:"2.0.11-16", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-dev", ver:"2.0.11-16", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-mailnews", ver:"2.0.11-16", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-browser", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-chatzilla", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-dbg", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-all", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-be", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-ca", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-cs", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-de", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-en-gb", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-es-ar", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-es-es", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-fi", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-fr", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-gl", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-hu", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-it", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-ja", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-lt", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-nb-no", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-nl", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-pl", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-pt-pt", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-ru", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-sk", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-sv-se", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-tr", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"iceape-l10n-zh-cn", ver:"2.7.10-1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

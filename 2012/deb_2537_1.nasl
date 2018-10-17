# OpenVAS Vulnerability Test
# $Id: deb_2537_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2537-1 (typo3-src)
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
tag_insight = "Several vulnerabilities were discovered in TYPO3, a content management
system.

CVE-2012-3527
An insecure call to unserialize in the help system enables
arbitrary code execution by authenticated users.

CVE-2012-3528
The TYPO3 backend contains several cross-site scripting
vulnerabilities.

CVE-2012-3529
Authenticated users who can access the configuration module
can obtain the encryption key, allowing them to escalate their
privileges.

CVE-2012-3530
The RemoveXSS HTML sanitizer did not remove several HTML5
JavaScript, thus failing to mitigate the impact of cross-site
scripting vulnerabilities.

For the stable distribution (squeeze), these problems have been fixed
in version 4.3.9+dfsg1-1+squeeze5.

For the testing distribution (wheezy) and the unstable distribution
(sid), these problems have been fixed in version 4.5.19+dfsg1-1.

We recommend that you upgrade your typo3-src packages.";
tag_summary = "The remote host is missing an update to typo3-src
announced via advisory DSA 2537-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202537-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71862");
 script_tag(name:"cvss_base", value:"4.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
 script_cve_id("CVE-2012-3527", "CVE-2012-3528", "CVE-2012-3529", "CVE-2012-3530", "CVE-2012-3531");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-09-07 11:46:25 -0400 (Fri, 07 Sep 2012)");
 script_name("Debian Security Advisory DSA 2537-1 (typo3-src)");



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
if((res = isdpkgvuln(pkg:"typo3", ver:"4.3.9+dfsg1-1+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"typo3-database", ver:"4.3.9+dfsg1-1+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"typo3-src-4.3", ver:"4.3.9+dfsg1-1+squeeze5", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"typo3", ver:"4.5.19+dfsg1-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"typo3-database", ver:"4.5.19+dfsg1-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"typo3-dummy", ver:"4.5.19+dfsg1-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"typo3-src-4.5", ver:"4.5.19+dfsg1-1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

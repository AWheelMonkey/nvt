# OpenVAS Vulnerability Test
# $Id: deb_2475_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2475-1 (openssl)
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
tag_insight = "It was discovered that openssl did not correctly handle explicit
Initialization Vectors for CBC encryption modes, as used in TLS 1.1,
1.2, and DTLS. An incorrect calculation would lead to an integer
underflow and incorrect memory access, causing denial of service
(application crash.)

For the stable distribution (squeeze), this problem has been fixed in
version 0.9.8o-4squeeze13.

For the testing distribution (wheezy), and the unstable distribution
(sid), this problem has been fixed in version 1.0.1c-1.

We recommend that you upgrade your openssl packages.";
tag_summary = "The remote host is missing an update to openssl
announced via advisory DSA 2475-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202475-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71353");
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2012-2333");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-05-31 11:51:33 -0400 (Thu, 31 May 2012)");
 script_name("Debian Security Advisory DSA 2475-1 (openssl)");



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
if((res = isdpkgvuln(pkg:"libcrypto0.9.8-udeb", ver:"0.9.8o-4squeeze12", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl-dev", ver:"0.9.8o-4squeeze13", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl0.9.8", ver:"0.9.8o-4squeeze13", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl0.9.8-dbg", ver:"0.9.8o-4squeeze13", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openssl", ver:"0.9.8o-4squeeze13", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libcrypto1.0.0-udeb", ver:"1.0.1c-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl-dev", ver:"1.0.1c-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl-doc", ver:"1.0.1c-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl1.0.0", ver:"1.0.1c-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libssl1.0.0-dbg", ver:"1.0.1c-1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openssl", ver:"1.0.1c-1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

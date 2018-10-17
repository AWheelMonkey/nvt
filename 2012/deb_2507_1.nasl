# OpenVAS Vulnerability Test
# $Id: deb_2507_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2507-1 (openjdk-6)
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
tag_insight = "Several vulnerabilities have been discovered in OpenJDK, an
implementation of the Oracle Java platform.

CVE-2012-1711 CVE-2012-1719

Multiple errors in the CORBA implementation could lead to
breakouts of the Java sandbox

CVE-2012-1713

Missing input sanitising in the font manager could lead to
the execution of arbitrary code.

CVE-2012-1716

The SynthLookAndFeel Swing class could be abused to break
out of the Java sandbox.

CVE-2012-1717

Several temporary files were created insecurely, resulting in
local information disclosure.

CVE-2012-1718

Certificate revocation lists were incorrectly implemented.

CVE-2012-1723 CVE-2012-1725

Validation errors in the bytecode verifier of the Hotspot VM
could lead to breakouts of the Java sandbox.

CVE-2012-1724

Missing input sanitising in the XML parser could lead to denial
of service through an infinite loop.

For the stable distribution (squeeze), this problem has been fixed in
version 6b18-1.8.13-0+squeeze2.

For the unstable distribution (sid), this problem has been fixed in
version 6b24-1.11.3-1.

We recommend that you upgrade your openjdk-6 packages.";
tag_summary = "The remote host is missing an update to openjdk-6
announced via advisory DSA 2507-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202507-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71486");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2012-1711", "CVE-2012-1713", "CVE-2012-1716", "CVE-2012-1717", "CVE-2012-1718", "CVE-2012-1719", "CVE-2012-1723", "CVE-2012-1724", "CVE-2012-1725");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-08-10 03:08:11 -0400 (Fri, 10 Aug 2012)");
 script_name("Debian Security Advisory DSA 2507-1 (openjdk-6)");



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
if((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"icedtea6-plugin", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b18-1.8.13-0+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

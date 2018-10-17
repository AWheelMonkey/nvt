# OpenVAS Vulnerability Test
# $Id: deb_2420_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2420-1 (openjdk-6)
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

CVE-2011-3377
The Iced Tea browser plugin included in the openjdk-6 package
does not properly enforce the Same Origin Policy on web content
served under a domain name which has a common suffix with the
required domain name.

CVE-2011-3563
The Java Sound component did not properly check for array
boundaries.  A malicious input or an untrusted Java application
or applet could use this flaw to cause Java Virtual Machine to
crash or disclose portion of its memory.

CVE-2011-5035
The OpenJDK embedded web server did not guard against an
excessive number of a request parameters, leading to a denial
of service vulnerability involving hash collisions.

CVE-2012-0497
It was discovered that Java2D did not properly check graphics
rendering objects before passing them to the native renderer.
This could lead to JVM crash or Java sandbox bypass.

CVE-2012-0501
The ZIP central directory parser used by java.util.zip.ZipFile
entered an infinite recursion in native code when processing a
crafted ZIP file, leading to a denial of service.

CVE-2012-0502
A flaw was found in the AWT KeyboardFocusManager class that
could allow untrusted Java applets to acquire keyboard focus
and possibly steal sensitive information.

CVE-2012-0503
The java.util.TimeZone.setDefault() method lacked a security
manager invocation, allowing an untrusted Java application or
applet to set a new default time zone.

CVE-2012-0505
The Java serialization code leaked references to serialization
exceptions, possibly leaking critical objects to untrusted
code in Java applets and applications.

CVE-2012-0506
It was discovered that CORBA implementation in Java did not
properly protect repository identifiers (that can be obtained
using _ids() method) on certain Corba objects.  This could
have been used to perform modification of the data that should
have been immutable.

CVE-2012-0507
The AtomicReferenceArray class implementation did not properly
check if the array is of an expected Object[] type.  A
malicious Java application or applet could use this flaw to
cause Java Virtual Machine to crash or bypass Java sandbox
restrictions

For the stable distribution (squeeze), these problems have been fixed in
version 6b18-1.8.13-0+squeeze1.

For the testing distribution (wheezy) and the unstable distribution
(sid), these problems have been fixed in version 6b24-1.11.1-1.

We recommend that you upgrade your openjdk-6 packages.";
tag_summary = "The remote host is missing an update to openjdk-6
announced via advisory DSA 2420-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202420-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71148");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-3377", "CVE-2011-3563", "CVE-2011-5035", "CVE-2012-0497", "CVE-2012-0501", "CVE-2012-0502", "CVE-2012-0503", "CVE-2012-0505", "CVE-2012-0506", "CVE-2012-0507");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-03-12 11:32:55 -0400 (Mon, 12 Mar 2012)");
 script_name("Debian Security Advisory DSA 2420-1 (openjdk-6)");



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
if((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"icedtea6-plugin", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b18-1.8.13-0+squeeze1", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"icedtea-6-jre-cacao", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"icedtea-6-jre-jamvm", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-zero", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b24-1.11.1-3", rls:"DEB7.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

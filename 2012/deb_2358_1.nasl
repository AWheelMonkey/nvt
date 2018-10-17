# OpenVAS Vulnerability Test
# $Id: deb_2358_1.nasl 8528 2018-01-25 07:57:36Z teissa $
# Description: Auto-generated from advisory DSA 2358-1 (openjdk-6)
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
implementation of the Java platform.  This combines the two previous
openjdk-6 advisories, DSA-2311-1 and DSA-2356-1.

CVE-2011-0862
Integer overflow errors in the JPEG and font parser allow
untrusted code (including applets) to elevate its privileges.

CVE-2011-0864
Hotspot, the just-in-time compiler in OpenJDK, mishandled
certain byte code instructions, allowing untrusted code
(including applets) to crash the virtual machine.

CVE-2011-0865
A race condition in signed object deserialization could
allow untrusted code to modify signed content, apparently
leaving its signature intact.

CVE-2011-0867
Untrusted code (including applets) could access information
about network interfaces which was not intended to be public.
(Note that the interface MAC address is still available to
untrusted code.)

CVE-2011-0868
A float-to-long conversion could overflow, , allowing
untrusted code (including applets) to crash the virtual
machine.

CVE-2011-0869
Untrusted code (including applets) could intercept HTTP
requests by reconfiguring proxy settings through a SOAP
connection.

CVE-2011-0871
Untrusted code (including applets) could elevate its
privileges through the Swing MediaTracker code.

CVE-2011-3389
The TLS implementation does not guard properly against certain
chosen-plaintext attacks when block ciphers are used in CBC
mode.

CVE-2011-3521
The CORBA implementation contains a deserialization
vulnerability in the IIOP implementation, allowing untrusted
Java code (such as applets) to elevate its privileges.

CVE-2011-3544
The Java scripting engine lacks necessary security manager
checks, allowing untrusted Java code (such as applets) to
elevate its privileges.

CVE-2011-3547
The skip() method in java.io.InputStream uses a shared buffer,
allowing untrusted Java code (such as applets) to access data
that is skipped by other code.

CVE-2011-3548
The java.awt.AWTKeyStroke class contains a flaw which allows
untrusted Java code (such as applets) to elevate its
privileges.

CVE-2011-3551
The Java2D C code contains an integer overflow which results
in a heap-based buffer overflow, potentially allowing
untrusted Java code (such as applets) to elevate its
privileges.

CVE-2011-3552
Malicous Java code can use up an excessive amount of UDP
ports, leading to a denial of service.

CVE-2011-3553
JAX-WS enables stack traces for certain server responses by
default, potentially leaking sensitive information.

CVE-2011-3554
JAR files in pack200 format are not properly checked for
errors, potentially leading to arbitrary code execution when
unpacking crafted pack200 files.

CVE-2011-3556
The RMI Registry server lacks access restrictions on certain
methods, allowing a remote client to execute arbitrary code.

CVE-2011-3557
The RMI Registry server fails to properly restrict privileges
of untrusted Java code, allowing RMI clients to elevate their
privileges on the RMI Registry server.

CVE-2011-3560
The com.sun.net.ssl.HttpsURLConnection class does not perform
proper security manager checks in the setSSLSocketFactory()
method, allowing untrusted Java code to bypass security policy
restrictions.

For the oldstable distribution (lenny), these problems have been fixed
in version 6b18-1.8.10-0~lenny1.

We recommend that you upgrade your openjdk-6 packages.";
tag_summary = "The remote host is missing an update to openjdk-6
announced via advisory DSA 2358-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202358-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.70571");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2011-0862", "CVE-2011-0864", "CVE-2011-0865", "CVE-2011-0867", "CVE-2011-0868", "CVE-2011-0869", "CVE-2011-0871", "CVE-2011-3389", "CVE-2011-3521", "CVE-2011-3544", "CVE-2011-3547", "CVE-2011-3548", "CVE-2011-3551", "CVE-2011-3552", "CVE-2011-3553", "CVE-2011-3554", "CVE-2011-3556", "CVE-2011-3557", "CVE-2011-3560");
 script_version("$Revision: 8528 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:57:36 +0100 (Thu, 25 Jan 2018) $");
 script_tag(name:"creation_date", value:"2012-02-11 02:33:46 -0500 (Sat, 11 Feb 2012)");
 script_name("Debian Security Advisory DSA 2358-1 (openjdk-6)");


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
if((res = isdpkgvuln(pkg:"openjdk-6-dbg", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-demo", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-doc", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jdk", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-headless", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-jre-lib", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"openjdk-6-source", ver:"6b18-1.8.10-0~lenny2", rls:"DEB5.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_3065.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3065-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703065");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2013-2172");
    script_name("Debian Security Advisory DSA 3065-1 (libxml-security-java - security update)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2014-11-06 00:00:00 +0100 (Thu, 06 Nov 2014)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3065.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libxml-security-java on Debian Linux");
        script_tag(name: "insight",   value: "Apache Santuario supports XML-Signature Syntax and Processing, W3C
Recommendation 12 February 2002, and XML Encryption Syntax and Processing, W3C
Recommendation 10 December 2002. As of version 1.4, the Java library supports
the standard Java API JSR-105: XML Digital Signature APIs.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy), this problem has been fixed in
version 1.4.5-1+deb7u1.

For the testing distribution (jessie), this problem has been fixed in
version 1.5.5-2.

For the unstable distribution (sid), this problem has been fixed in
version 1.5.5-2.

We recommend that you upgrade your libxml-security-java packages.");
    script_tag(name: "summary",   value: "James Forshaw discovered that, in Apache Santuario XML Security for
Java, CanonicalizationMethod parameters were incorrectly validated:
by specifying an arbitrary weak canonicalization algorithm, an
attacker could spoof XML signatures.");
    script_tag(name: "vuldetect", value:  "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    script_tag(name:"solution_type", value:"VendorFix");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libxml-security-java", ver:"1.4.5-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java-doc", ver:"1.4.5-1+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java", ver:"1.4.5-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java-doc", ver:"1.4.5-1+deb7u1", rls:"DEB7.1")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java", ver:"1.4.5-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java-doc", ver:"1.4.5-1+deb7u1", rls:"DEB7.2")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java", ver:"1.4.5-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-java-doc", ver:"1.4.5-1+deb7u1", rls:"DEB7.3")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

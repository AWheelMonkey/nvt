# OpenVAS Vulnerability Test
# $Id: deb_2710.nasl 9353 2018-04-06 07:14:20Z cfischer $
# Auto-generated from advisory DSA 2710-1 using nvtgen 1.0
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

tag_affected  = "xml-security-c on Debian Linux";
tag_insight   = "XML-Security-C is a library for the XML Digital Security specification.
It provides processing and handling of XML Key Management Specifications
(XKMS) messages.";
tag_solution  = "For the oldstable distribution (squeeze), these problems have been fixed in
version 1.5.1-3+squeeze2.

For the stable distribution (wheezy), these problems have been fixed in
version 1.6.1-5+deb7u1.

For the unstable distribution (sid), these problems have been fixed in
version 1.6.1-6.

We recommend that you upgrade your xml-security-c packages.";
tag_summary   = "James Forshaw from Context Information Security discovered several
vulnerabilities in xml-security-c, an implementation of the XML Digital
Security specification. The Common Vulnerabilities and Exposures project
identifies the following problems:

CVE-2013-2153 
The implementation of XML digital signatures in the Santuario-C++
library is vulnerable to a spoofing issue allowing an attacker to
reuse existing signatures with arbitrary content.

CVE-2013-2154 
A stack overflow, possibly leading to arbitrary code execution,
exists in the processing of malformed XPointer expressions in the
XML Signature Reference processing code.

CVE-2013-2155 
A bug in the processing of the output length of an HMAC-based XML
Signature would cause a denial of service when processing specially
chosen input.

CVE-2013-2156 
A heap overflow exists in the processing of the PrefixList attribute
optionally used in conjunction with Exclusive Canonicalization,
potentially allowing arbitrary code execution.";
tag_vuldetect = "This check tests the installed software version using the apt package manager.";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.892710");
    script_version("$Revision: 9353 $");
    script_cve_id("CVE-2013-2156", "CVE-2013-2154", "CVE-2013-2153", "CVE-2013-2155");
    script_name("Debian Security Advisory DSA 2710-1 (xml-security-c - several vulnerabilities)");
    script_tag(name: "last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value:"2013-06-18 00:00:00 +0200 (Tue, 18 Jun 2013)");
    script_tag(name: "cvss_base", value:"7.5");
    script_tag(name: "cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

    script_xref(name: "URL", value: "http://www.debian.org/security/2013/dsa-2710.html");


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
if ((res = isdpkgvuln(pkg:"libxml-security-c-dev", ver:"1.5.1-3+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-c15", ver:"1.5.1-3+squeeze2", rls:"DEB6.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-c-dev", ver:"1.6.1-5+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-c16", ver:"1.6.1-5+deb7u1", rls:"DEB7.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

# OpenVAS Vulnerability Test
# $Id: deb_3336.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3336-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703336");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-2721", "CVE-2015-2730");
    script_name("Debian Security Advisory DSA 3336-1 (nss - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-08-17 00:00:00 +0200 (Mon, 17 Aug 2015)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3336.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "nss on Debian Linux");
    script_tag(name: "insight",   value: "nss is a set of libraries designed
to support cross-platform development of security-enabled client and server
applications.");
    script_tag(name: "solution",  value: "For the oldstable distribution
(wheezy), these problems have been fixed in version 2:3.14.5-1+deb7u5.

For the stable distribution (jessie), these problems have been fixed in
version 2:3.17.2-1.1+deb8u1.

For the testing distribution (stretch), these problems have been fixed
in version 2:3.19.1-1.

For the unstable distribution (sid), these problems have been fixed in
version 2:3.19.1-1.

We recommend that you upgrade your nss packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been
discovered in nss, the Mozilla Network Security Service library. The Common
Vulnerabilities and Exposures project identifies the following problems:

CVE-2015-2721 
Karthikeyan Bhargavan discovered that NSS incorrectly handles state
transitions for the TLS state machine. A man-in-the-middle attacker
could exploit this flaw to skip the ServerKeyExchange message and
remove the forward-secrecy property.

CVE-2015-2730 
Watson Ladd discovered that NSS does not properly perform Elliptical
Curve Cryptography (ECC) multiplication, allowing a remote attacker
to potentially spoof ECDSA signatures.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libnss3:amd64", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3:i386", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-1d:amd64", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-1d:i386", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-dbg:amd64", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-dbg:i386", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-dev", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libnss3-tools", ver:"2:3.14.5-1+deb7u5", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

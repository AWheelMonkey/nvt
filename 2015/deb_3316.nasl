# OpenVAS Vulnerability Test
# $Id: deb_3316.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3316-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703316");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2014-8873", "CVE-2015-0460", "CVE-2015-0469", "CVE-2015-0470",
                  "CVE-2015-0477", "CVE-2015-0478", "CVE-2015-0480", "CVE-2015-0488",
                  "CVE-2015-2590", "CVE-2015-2601", "CVE-2015-2613", "CVE-2015-2621",
                  "CVE-2015-2625", "CVE-2015-2628", "CVE-2015-2632", "CVE-2015-2808",
                  "CVE-2015-4000", "CVE-2015-4731", "CVE-2015-4732", "CVE-2015-4733",
                  "CVE-2015-4748", "CVE-2015-4749", "CVE-2015-4760");
    script_name("Debian Security Advisory DSA 3316-1 (openjdk-7 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-07-25 00:00:00 +0200 (Sat, 25 Jul 2015)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3316.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "openjdk-7 on Debian Linux");
        script_tag(name: "insight",   value: "OpenJDK is a development environment for building applications,
applets, and components using the Java programming language.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), these problems have been fixed
in version 7u79-2.5.6-1~deb7u1.

For the stable distribution (jessie), these problems have been fixed in
version 7u79-2.5.6-1~deb8u1.

For the unstable distribution (sid), these problems have been fixed in
version 7u79-2.5.6-1.

We recommend that you upgrade your openjdk-7 packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been discovered in OpenJDK, an
implementation of the Oracle Java platform, resulting in the execution
of arbitrary code, breakouts of the Java sandbox, information disclosure,
denial of service or insecure cryptography.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-cacao", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-dbg", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-demo", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-doc", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jdk", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-source", ver:"7u79-2.5.6-1~deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-dbg", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-demo", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-doc", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jdk", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-source", ver:"7u79-2.5.6-1~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

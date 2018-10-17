# OpenVAS Vulnerability Test
# $Id: deb_3235.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3235-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703235");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-0460", "CVE-2015-0469", "CVE-2015-0470", "CVE-2015-0477",
                  "CVE-2015-0478", "CVE-2015-0480", "CVE-2015-0488");
    script_name("Debian Security Advisory DSA 3235-1 (openjdk-7 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-04-24 00:00:00 +0200 (Fri, 24 Apr 2015)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3235.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "openjdk-7 on Debian Linux");
    script_tag(name: "insight",   value: "OpenJDK is a development environment
for building applications, applets, and components using the Java programming
language.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 7u79-2.5.5-1~deb7u1.

For the upcoming stable distribution (jessie), these problems will be
fixed soon in version 7u79-2.5.5-1~deb8u1 (the update will be available
shortly after the final jessie release).

For the unstable distribution (sid), these problems have been fixed in
version 7u79-2.5.5-1.

We recommend that you upgrade your openjdk-7 packages.");
    script_tag(name: "summary",   value: "Several vulnerabilities have been
discovered in OpenJDK, an implementation of the Oracle Java platform, resulting
in the execution of arbitrary code, breakouts of the Java sandbox, information
disclosure or denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-cacao:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-cacao:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-dbg:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-dbg:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-demo", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-doc", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jdk:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jdk:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:amd64", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:i386", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-source", ver:"7u79-2.5.5-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

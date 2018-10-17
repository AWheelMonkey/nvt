# OpenVAS Vulnerability Test
# $Id: deb_3245.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3245-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703245");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-1855");
    script_name("Debian Security Advisory DSA 3245-1 (ruby1.8 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-05-02 00:00:00 +0200 (Sat, 02 May 2015)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3245.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "ruby1.8 on Debian Linux");
        script_tag(name: "insight",   value: "Ruby is the interpreted scripting language for quick and easy
object-oriented programming. It has many features to process text
files and to do system management tasks (as in perl). It is simple,
straight-forward, and extensible.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), this problem has been fixed
in version 1.8.7.358-7.1+deb7u3.

We recommend that you upgrade your ruby1.8 packages.");
    script_tag(name: "summary",   value: "It was discovered that the Ruby OpenSSL extension, part of the interpreter
for the Ruby language, did not properly implement hostname matching, in
violation of RFC 6125. This could allow remote attackers to perform a
man-in-the-middle attack via crafted SSL certificates.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libruby1.8", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libruby1.8-dbg", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtcltk-ruby1.8", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ri1.8", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby1.8", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby1.8-dev", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby1.8-examples", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby1.8-full", ver:"1.8.7.358-7.1+deb7u3", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

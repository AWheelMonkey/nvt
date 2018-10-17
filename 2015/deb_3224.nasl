# OpenVAS Vulnerability Test
# $Id: deb_3224.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3224-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703224");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2013-7439");
    script_name("Debian Security Advisory DSA 3224-1 (libx11 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-04-12 00:00:00 +0200 (Sun, 12 Apr 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3224.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libx11 on Debian Linux");
    script_tag(name: "insight",   value: "libX11 provides a client interface
to the X Window System, otherwise known as 'Xlib'.  It provides a complete API
for the basic functions of the window system.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 2:1.5.0-1+deb7u2.

For the upcoming stable distribution (jessie), this problem has been
fixed in version 2:1.6.0-1.

For the unstable distribution (sid), this problem has been fixed in
version 2:1.6.0-1.

We recommend that you upgrade your libx11 packages.");
    script_tag(name: "summary",   value: "Abhishek Arya discovered a
buffer overflow in the MakeBigReq macro provided by libx11, which could result
in denial of service or the execution of arbitrary code.

Several other xorg packages (e.g. libxrender) will be recompiled against
the fixed package after the release of this update. For detailed
information on the status of recompiled packages please refer to the
Debian Security Tracker at
https://security-tracker.debian.org/tracker/CVE-2013-7439 
.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libx11-6:amd64", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-6:i386", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-6-dbg:amd64", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-6-dbg:i386", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-data", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-dev:amd64", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-dev:i386", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-doc", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb-dev", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb1:amd64", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb1:i386", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb1-dbg:amd64", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb1-dbg:i386", ver:"2:1.5.0-1+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

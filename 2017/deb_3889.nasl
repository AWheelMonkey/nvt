# OpenVAS Vulnerability Test
# $Id: deb_3889.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3889-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703889");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2017-1000376");
    script_name("Debian Security Advisory DSA 3889-1 (libffi - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-06-19 00:00:00 +0200 (Mon, 19 Jun 2017)");
    script_tag(name:"cvss_base", value:"6.9");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3889.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libffi on Debian Linux");
    script_tag(name: "solution",  value: "For the full details, please refer to their advisory published at:
https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt 
For the oldstable distribution (jessie), this problem has been fixed
in version 3.1-2+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 3.2.1-4.

For the testing distribution (buster), this problem has been fixed
in version 3.2.1-4.

For the unstable distribution (sid), this problem has been fixed in
version 3.2.1-4.

We recommend that you upgrade your libffi packages.");
    script_tag(name: "summary",   value: "libffi, a library used to call code written in one language from code written
in a different language, was enforcing an executable stack on the i386
architecture. While this might not be considered a vulnerability by itself,
this could be leveraged when exploiting other vulnerabilities, like for example
the stack clash class of vulnerabilities discovered by Qualys Research Labs.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libffi-dev", ver:"3.2.1-4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6", ver:"3.2.1-4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6-dbg", ver:"3.2.1-4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6-udeb", ver:"3.2.1-4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi-dev", ver:"3.2.1-4", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6", ver:"3.2.1-4", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6-dbg", ver:"3.2.1-4", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6-udeb", ver:"3.2.1-4", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi-dev", ver:"3.1-2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6", ver:"3.1-2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libffi6-dbg", ver:"3.1-2+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

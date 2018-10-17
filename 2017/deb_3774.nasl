# OpenVAS Vulnerability Test
# $Id: deb_3774.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3774-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703774");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2016-10165");
    script_name("Debian Security Advisory DSA 3774-1 (lcms2 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-01-29 00:00:00 +0100 (Sun, 29 Jan 2017)");
    script_tag(name:"cvss_base", value:"5.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3774.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "lcms2 on Debian Linux");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 2.6-3+deb8u1.

For the testing distribution (stretch) and the unstable distribution
(sid), this problem has been fixed in version 2.8-4.

We recommend that you upgrade your lcms2 packages.");
    script_tag(name: "summary",   value: "Ibrahim M. El-Sayed discovered an
out-of-bounds heap read vulnerability in the function Type_MLU_Read in lcms2,
the Little CMS 2 color management library, which can be triggered by an image
with a specially crafted ICC profile and leading to a heap memory leak or
denial-of-service for applications using the lcms2 library.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"liblcms2-2:amd64", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-2:i386", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"liblcms2-dbg:amd64", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-dbg:i386", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"liblcms2-dev:amd64", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-dev:i386", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}


if ((res = isdpkgvuln(pkg:"liblcms2-utils", ver:"2.6-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-2:amd64", ver:"2.8-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-2:i386", ver:"2.8-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-dev:amd64", ver:"2.8-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-dev:i386", ver:"2.8-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblcms2-utils", ver:"2.8-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

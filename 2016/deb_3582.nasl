# OpenVAS Vulnerability Test
# $Id: deb_3582.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3582-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703582");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2015-1283", "CVE-2016-0718", "CVE-2016-4472");
    script_name("Debian Security Advisory DSA 3582-1 (expat - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-05-18 00:00:00 +0200 (Wed, 18 May 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3582.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "expat on Debian Linux");
    script_tag(name: "insight",   value: "This package contains xmlwf, an example
application of expat, the C library for parsing XML. The arguments to xmlwf are
one or more files which are each to be checked for XML well-formedness.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 2.1.0-6+deb8u2. Additionally this update
refreshes the fix for CVE-2015-1283 to avoid relying on undefined behavior.

We recommend that you upgrade your expat packages.");
    script_tag(name: "summary",   value: "Gustavo Grieco discovered that Expat,
an XML parsing C library, does not properly handle certain kinds of malformed input
documents, resulting in buffer overflows during processing and error reporting. A
remote attacker can take advantage of this flaw to cause an application using
the Expat library to crash, or potentially, to execute arbitrary code
with the privileges of the user running the application.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"expat", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lib64expat1", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lib64expat1-dev", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexpat1:amd64", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexpat1:i386", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"libexpat1-dev:amd64", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexpat1-dev:i386", ver:"2.1.0-6+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

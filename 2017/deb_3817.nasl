# OpenVAS Vulnerability Test
# $Id: deb_3817.nasl 10012 2018-05-30 03:37:26Z ckuersteiner $
# Auto-generated from advisory DSA 3817-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703817");
    script_version("$Revision: 10012 $");
    script_cve_id("CVE-2016-9601");
    script_name("Debian Security Advisory DSA 3817-1 (jbig2dec - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-05-30 05:37:26 +0200 (Wed, 30 May 2018) $");
    script_tag(name: "creation_date", value: "2017-03-24 00:00:00 +0100 (Fri, 24 Mar 2017)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3817.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "jbig2dec on Debian Linux");
        script_tag(name: "insight",   value: "jbig2dec is a decoder library and example utility implementing the JBIG2
bi-level image compression spec. Also known as ITU T.88 and ISO IEC
14492, and included by reference in Adobe's PDF version 1.4 and later.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 0.13-4~deb8u1.

For the upcoming stable distribution (stretch), this problem has been
fixed in version 0.13-4.

For the unstable distribution (sid), this problem has been fixed in
version 0.13-4.

We recommend that you upgrade your jbig2dec packages.");
    script_tag(name: "summary",   value: "Multiple security issues have been found in the JBIG2 decoder library,
which may lead to lead to denial of service or the execution of arbitrary
code if a malformed image file (usually embedded in a PDF document) is
opened.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"jbig2dec", ver:"0.13-4~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjbig2dec0", ver:"0.13-4~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"libjbig2dec0-dev", ver:"0.13-4~deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"jbig2dec", ver:"0.13-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"libjbig2dec0:amd64", ver:"0.13-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjbig2dec0:i386", ver:"0.13-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if ((res = isdpkgvuln(pkg:"libjbig2dec0-dev", ver:"0.13-4", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

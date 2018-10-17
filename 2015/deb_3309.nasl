# OpenVAS Vulnerability Test
# $Id: deb_3309.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3309-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703309");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-5522", "CVE-2015-5523");
    script_name("Debian Security Advisory DSA 3309-1 (tidy - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-07-18 00:00:00 +0200 (Sat, 18 Jul 2015)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3309.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tidy on Debian Linux");
        script_tag(name: "insight",   value: "Corrects markup in a way compliant with the latest standards, and
optimal for the popular browsers. It has a comprehensive knowledge
of the attributes defined in the HTML 4.0 recommendation from W3C,
and understands the US ASCII, ISO Latin-1, UTF-8 and the ISO 2022
family of 7-bit encodings. In the output:");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy), these problems have been fixed
in version 20091223cvs-1.2+deb7u1.

For the stable distribution (jessie), these problems have been fixed in
version 20091223cvs-1.4+deb8u1.

For the unstable distribution (sid), these problems will be fixed soon.

We recommend that you upgrade your tidy packages.");
    script_tag(name: "summary",   value: "Fernando Muoz discovered that invalid HTML input passed to tidy, an
HTML syntax checker and reformatter, could trigger a buffer overflow.
This could allow remote attackers to cause a denial of service (crash)
or potentially execute arbitrary code.

Geoff McLane also discovered that a similar issue could trigger an
integer overflow, leading to a memory allocation of 4GB. This could
allow remote attackers to cause a denial of service by saturating the
target's memory.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libtidy-0.99-0", ver:"20091223cvs-1.2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtidy-dev", ver:"20091223cvs-1.2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tidy", ver:"20091223cvs-1.2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tidy-doc", ver:"20091223cvs-1.2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtidy-0.99-0", ver:"20091223cvs-1.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtidy-dev", ver:"20091223cvs-1.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tidy", ver:"20091223cvs-1.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tidy-doc", ver:"20091223cvs-1.4+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

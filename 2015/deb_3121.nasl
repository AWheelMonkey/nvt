# OpenVAS Vulnerability Test
# $Id: deb_3121.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3121-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703121");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2014-8116", "CVE-2014-8117", "CVE-2014-9620");
    script_name("Debian Security Advisory DSA 3121-1 (file - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-01-08 00:00:00 +0100 (Thu, 08 Jan 2015)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3121.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "file on Debian Linux");
    script_tag(name: "insight",   value: "File tests each argument in an attempt
to classify it. There are three sets of tests, performed in this order:
filesystem tests, magic number tests, and language tests. The first test that
succeeds causes the file type to be printed.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 5.11-2+deb7u7.

For the upcoming stable distribution (jessie), these problems will be
fixed soon.

For the unstable distribution (sid), these problems have been fixed in
version 1:5.21+15-1.

We recommend that you upgrade your file packages.");
    script_tag(name: "summary",   value: "Multiple security issues have been
found in file, a tool/library to determine a file type. Processing a malformed
file could result in denial of service. Most of the changes are related to
parsing ELF files.

As part of the fixes, several limits on aspects of the detection were
added or tightened, sometimes resulting in messages like recursion
limit exceeded or too many program header sections.

To mitigate such shortcomings, these limits are controllable by a new
- -P, --parameter option in the file program.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"file", ver:"5.11-2+deb7u7", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagic-dev", ver:"5.11-2+deb7u7", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagic1", ver:"5.11-2+deb7u7", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-magic", ver:"5.11-2+deb7u7", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-magic-dbg", ver:"5.11-2+deb7u7", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

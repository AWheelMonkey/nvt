# OpenVAS Vulnerability Test
# $Id: deb_3485.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3485-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703485");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2013-7448");
    script_name("Debian Security Advisory DSA 3485-1 (didiwiki - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-02-20 00:00:00 +0100 (Sat, 20 Feb 2016)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3485.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "didiwiki on Debian Linux");
    script_tag(name: "insight",   value: "DidiWiki is aimed at those who need a
quick and lightweight wiki for personal use, such as notes, 'to do' lists, etc.
It is written in C, and has very low system requirements (binary size of ~25k
stripped). This makes it particularly useful for handhelds. DidiWiki
does not require installation of a separate webserver, scripting
language, or database.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 0.5-11+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 0.5-11+deb8u1.

For the testing (stretch) and unstable (sid) distributions, this
problem has been fixed in version 0.5-12.

We recommend that you upgrade your didiwiki packages.");
    script_tag(name: "summary",   value: "Alexander Izmailov discovered that
didiwiki, a wiki implementation, failed to correctly validate user-supplied
input, thus allowing a malicious user to access any part of the filesystem.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"didiwiki", ver:"0.5-11+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"didiwiki", ver:"0.5-12", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"didiwiki", ver:"0.5-11+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

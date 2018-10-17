# OpenVAS Vulnerability Test
# $Id: deb_3425.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3425-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703425");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-0861");
    script_name("Debian Security Advisory DSA 3425-1 (tryton-server - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-12-17 00:00:00 +0100 (Thu, 17 Dec 2015)");
    script_tag(name:"cvss_base", value:"4.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3425.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "tryton-server on Debian Linux");
    script_tag(name: "insight",   value: "Tryton is a high-level general purpose
application platform written in Python and using PostgreSQL as database engine.
It is the core base of a complete business solution.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 3.4.0-3+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 3.8.1-1.

We recommend that you upgrade your tryton-server packages.");
    script_tag(name: "summary",   value: "Cdric Krier discovered a vulnerability
in the server-side of Tryton, an application framework written in Python. An
authenticated malicious user can write arbitrary values in record fields due missed
checks of access permissions when multiple records are written.

The oldstable distribution (wheezy) is not affected.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"tryton-server", ver:"3.4.0-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tryton-server-doc", ver:"3.4.0-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

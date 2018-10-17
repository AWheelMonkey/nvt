# OpenVAS Vulnerability Test
# $Id: deb_3708.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3708-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703708");
    script_version("$Revision: 8154 $");
    
    script_name("Debian Security Advisory DSA 3708-1 (mat - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name:"creation_date", value:"2016-11-14 17:59:49 +0530 (Mon, 14 Nov 2016)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3708.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "mat on Debian Linux");
    script_tag(name: "insight",   value: "Metadata consist of information that
characterizes data. Metadata are used to provide documentation for data products.
In essence, metadata answer who, what, when, where, why, and how about every facet
of the data that are being documented.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 0.5.2-3+deb8u1. This update disables PDF
support in MAT entirely.

We recommend that you upgrade your mat packages.");
    script_tag(name: "summary",   value: "Hartmut Goebel discovered that MAT, a
toolkit to anonymise/remove metadata from files did not remove metadata from images
embededed in PDF documents.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"mat", ver:"0.5.2-3+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

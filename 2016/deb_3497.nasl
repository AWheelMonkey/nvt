# OpenVAS Vulnerability Test
# $Id: deb_3497.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3497-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703497");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-2228");
    script_name("Debian Security Advisory DSA 3497-1 (php-horde - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name:"creation_date", value:"2016-03-08 12:37:33 +0530 (Tue, 08 Mar 2016)");
    script_tag(name:"cvss_base", value:"4.3");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3497.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "php-horde on Debian Linux");
        script_tag(name: "insight",   value: "The Horde Application Framework is a flexible, modular, general-purpose web
application framework written in PHP. It provides an extensive array of
components that are targeted at the common problems and tasks involved in
developing modern web applications. It is the basis for a large number of
production-level web applications, notably the Horde Groupware suites. For
more information on Horde or the Horde Groupware suites, visit
http://www.horde.org.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), this problem has been fixed in
version 5.2.1+debian0-2+deb8u3.

For the testing distribution (stretch), this problem has been fixed
in version 5.2.9+debian0-1.

For the unstable distribution (sid), this problem has been fixed in
version 5.2.9+debian0-1.

We recommend that you upgrade your php-horde packages.");
    script_tag(name: "summary",   value: "It was discovered that php-horde, a flexible, modular, general-purpose
web application framework written in PHP, is prone to a cross-site
scripting vulnerability.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"php-horde", ver:"5.2.9+debian0-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"php-horde", ver:"5.2.1+debian0-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

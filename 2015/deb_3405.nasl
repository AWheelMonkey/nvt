# OpenVAS Vulnerability Test
# $Id: deb_3405.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3405-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703405");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-0859");
    script_name("Debian Security Advisory DSA 3405-1 (smokeping - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-11-25 00:00:00 +0100 (Wed, 25 Nov 2015)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3405.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "smokeping on Debian Linux");
    script_tag(name: "insight",   value: "SmokePing consists of a daemon
process which organizes the latency measurements and a CGI which presents
the graphs.");
    script_tag(name: "solution",  value: "For the oldstable distribution
(wheezy), this problem has been fixed in version 2.6.8-2+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 2.6.9-1+deb8u1.

We recommend that you upgrade your smokeping packages.");
    script_tag(name: "summary",   value: "Tero Marttila discovered that the
Debian packaging for smokeping installed it in such a way that the CGI
implementation of Apache httpd (mod_cgi) passed additional arguments to the
smokeping_cgi program, potentially leading to arbitrary code execution in
response to crafted HTTP requests.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"smokeping", ver:"2.6.8-2+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"smokeping", ver:"2.6.9-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

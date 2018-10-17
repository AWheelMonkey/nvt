# OpenVAS Vulnerability Test
# $Id: deb_3322.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3322-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703322");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-3225");
    script_name("Debian Security Advisory DSA 3322-1 (ruby-rack - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-07-31 00:00:00 +0200 (Fri, 31 Jul 2015)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3322.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "ruby-rack on Debian Linux");
    script_tag(name: "insight",   value: "Rack provides a minimal, modular and
adaptable interface for developing web applications in Ruby. By wrapping HTTP
requests and responses in the simplest way possible, it unifies and distills the
API for web servers, web frameworks, and software in between (the so-called
middleware) into a single method call.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 1.4.1-2.1+deb7u1.

For the stable distribution (jessie), this problem has been fixed in
version 1.5.2-3+deb8u1.

For the unstable distribution (sid), this problem has been fixed in
version 1.5.2-4.

We recommend that you upgrade your ruby-rack packages.");
    script_tag(name: "summary",   value: "Tomek Rabczak from the NCC Group discovered
a flaw in the normalize_params() method in Rack, a modular Ruby webserver interface.
A remote attacker can use this flaw via specially crafted requests to
cause a `SystemStackError` and potentially cause a denial of service
condition for the service.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"librack-ruby", ver:"1.4.1-2.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librack-ruby1.8", ver:"1.4.1-2.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librack-ruby1.9.1", ver:"1.4.1-2.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-rack", ver:"1.4.1-2.1+deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

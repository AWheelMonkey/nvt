# OpenVAS Vulnerability Test
# $Id: deb_3462.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3462-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703462");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2015-8747", "CVE-2015-8748");
    script_name("Debian Security Advisory DSA 3462-1 (radicale - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-01-30 00:00:00 +0100 (Sat, 30 Jan 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3462.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "radicale on Debian Linux");
    script_tag(name: "insight",   value: "Radicale is a CalDAV (calendar) and CardDAV (contact) server.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
these problems have been fixed in version 0.7-1.1+deb7u1.

For the stable distribution (jessie), these problems have been fixed in
version 0.9-1+deb8u1.

For the testing distribution (stretch), these problems have been fixed
in version 1.1.1-1.

For the unstable distribution (sid), these problems have been fixed in
version 1.1.1-1.

We recommend that you upgrade your radicale packages.");
    script_tag(name: "summary",   value: "Two vulnerabilities were fixed
in radicale, a CardDAV/CalDAV server.

CVE-2015-8747
The (not configured by default and not available on Wheezy)
multifilesystem storage backend allows read and write access to
arbitrary files (still subject to the DAC permissions of the user
the radicale server is running as).

CVE-2015-8748
If an attacker is able to authenticate with a user name like `.*',
he can bypass read/write limitations imposed by regex-based rules,
including the built-in rules `owner_write' (read for everybody,
write for the calendar owner) and `owner_only' (read and write for
the the calendar owner).");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"python-radicale", ver:"1.1.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python3-radicale", ver:"1.1.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"radicale", ver:"1.1.1-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-radicale", ver:"0.7-1.1+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"radicale", ver:"0.7-1.1+deb7u1", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-radicale", ver:"0.9-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"radicale", ver:"0.9-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

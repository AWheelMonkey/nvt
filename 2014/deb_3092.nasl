# OpenVAS Vulnerability Test
# $Id: deb_3092.nasl 9354 2018-04-06 07:15:32Z cfischer $
# Auto-generated from advisory DSA 3092-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703092");
    script_version("$Revision: 9354 $");
    script_cve_id("CVE-2014-1587", "CVE-2014-1590", "CVE-2014-1592", "CVE-2014-1593",
                  "CVE-2014-1594");
    script_name("Debian Security Advisory DSA 3092-1 (icedove - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:15:32 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2014-12-07 00:00:00 +0100 (Sun, 07 Dec 2014)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2014/dsa-3092.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2014 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "icedove on Debian Linux");
    script_tag(name: "insight",   value: "Icedove is an unbranded Thunderbird
mail client suitable for free distribution. It supports different mail accounts
(POP, IMAP, Gmail), has an integrated learning Spam filter, and offers easy
organization of mails with tagging and virtual folders. Also, more features can
be added by installing extensions.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
these problems have been fixed in version 31.3.0-1~deb7u1.

For the upcoming stable distribution (jessie), these problems will be
fixed soon.

For the unstable distribution (sid), these problems have been fixed in
version 31.3.0-1.

We recommend that you upgrade your icedove packages.");
    script_tag(name: "summary",   value: "Multiple security issues have been found
in Icedove, Debian's version of the Mozilla Thunderbird mail and news client:
Multiple memory safety errors, buffer overflows, use-after-frees and other
implementation errors may lead to the execution of arbitrary code, the bypass of
security restrictions or denial of service.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"calendar-google-provider", ver:"31.3.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"calendar-timezones", ver:"31.3.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove", ver:"31.3.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove-dbg", ver:"31.3.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icedove-dev", ver:"31.3.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"iceowl-extension", ver:"31.3.0-1~deb7u1", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

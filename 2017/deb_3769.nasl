# OpenVAS Vulnerability Test
# $Id: deb_3769.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3769-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
    script_oid("1.3.6.1.4.1.25623.1.0.703769");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2016-10074");
    script_name("Debian Security Advisory DSA 3769-1 (libphp-swiftmailer - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-01-22 00:00:00 +0100 (Sun, 22 Jan 2017)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3769.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libphp-swiftmailer on Debian Linux");
    script_tag(name: "insight",   value: "This is a transitional dummy package.
It can safely be removed.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 5.2.2-1+deb8u1.

For the testing (stretch) and unstable (sid) distributions, this
problem has been fixed in version 5.4.2-1.1.

We recommend that you upgrade your libphp-swiftmailer packages.");
    script_tag(name: "summary",   value: "Dawid Golunski from LegalHackers
discovered that PHP Swift Mailer, a mailing solution for PHP, did not correctly
validate user input. This allowed a remote attacker to execute arbitrary code by
passing specially formatted email addresses in specific email headers.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libphp-swiftmailer", ver:"5.2.2-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"php-swiftmailer", ver:"5.2.2-1+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libphp-swiftmailer", ver:"5.4.2-1.1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"php-swiftmailer", ver:"5.4.2-1.1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

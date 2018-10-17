# OpenVAS Vulnerability Test
# $Id: deb_3512.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3512-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703512");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-2851");
    script_name("Debian Security Advisory DSA 3512-1 (libotr - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-03-09 00:00:00 +0100 (Wed, 09 Mar 2016)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3512.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "libotr on Debian Linux");
    script_tag(name: "insight",   value: "libotr is an Off-the-Record (OTR) Messaging Library and Toolkit.");
    script_tag(name: "solution",  value: "For the oldstable distribution (wheezy),
this problem has been fixed in version 3.2.1-1+deb7u2.

For the stable distribution (jessie), this problem has been fixed in
version 4.1.0-2+deb8u1.

We recommend that you upgrade your libotr packages.");
    script_tag(name: "summary",   value: "Markus Vervier of X41 D-Sec GmbH discovered
an integer overflow vulnerability in libotr, an off-the-record (OTR) messaging
library, in the way how the sizes of portions of incoming messages were stored. A
remote attacker can exploit this flaw by sending crafted messages to an
application that is using libotr to perform denial of service attacks
(application crash), or potentially, execute arbitrary code with the
privileges of the user running the application.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libotr2", ver:"3.2.1-1+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libotr2-bin", ver:"3.2.1-1+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libotr2-dev", ver:"3.2.1-1+deb7u2", rls_regex:"DEB7.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libotr5", ver:"4.1.0-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libotr5-bin", ver:"4.1.0-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libotr5-dev", ver:"4.1.0-2+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

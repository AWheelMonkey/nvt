# OpenVAS Vulnerability Test
# $Id: deb_3625.nasl 8154 2017-12-18 07:30:14Z teissa $
# Auto-generated from advisory DSA 3625-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703625");
    script_version("$Revision: 8154 $");
    script_cve_id("CVE-2016-4051", "CVE-2016-4052", "CVE-2016-4053", "CVE-2016-4054",
                  "CVE-2016-4554", "CVE-2016-4555", "CVE-2016-4556");
    script_name("Debian Security Advisory DSA 3625-1 (squid3 - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-18 08:30:14 +0100 (Mon, 18 Dec 2017) $");
    script_tag(name:"creation_date", value:"2016-08-02 10:57:49 +0530 (Tue, 02 Aug 2016)");
    script_tag(name:"cvss_base", value:"6.8");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3625.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "squid3 on Debian Linux");
    script_tag(name: "insight",   value: "Squid is a high-performance proxy caching
server for web clients, supporting FTP, gopher, ICY and HTTP data objects.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie), these
problems have been fixed in version 3.4.8-6+deb8u3.

For the testing (stretch) and unstable (sid) distributions, these
problems have been fixed in version 3.5.19-1.

We recommend that you upgrade your squid3 packages.");
    script_tag(name: "summary",   value: "Several security issues have been discovered
in the Squid caching proxy.

CVE-2016-4051:

CESG and Yuriy M. Kaminskiy discovered that Squid cachemgr.cgi was
vulnerable to a buffer overflow when processing remotely supplied
inputs relayed through Squid.

CVE-2016-4052:

CESG discovered that a buffer overflow made Squid vulnerable to a
Denial of Service (DoS) attack when processing ESI responses.

CVE-2016-4053:

CESG found that Squid was vulnerable to public information
disclosure of the server stack layout when processing ESI responses.

CVE-2016-4054:

CESG discovered that Squid was vulnerable to remote code execution
when processing ESI responses.

CVE-2016-4554:

Jianjun Chen found that Squid was vulnerable to a header smuggling
attack that could lead to cache poisoning and to bypass of
same-origin security policy in Squid and some client browsers.

CVE-2016-4555,
CVE-2016-4556:

'bfek-18' and '@vftable' found that Squid was vulnerable to a Denial
of Service (DoS) attack when processing ESI responses, due to
incorrect pointer handling and reference counting.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"squid-cgi", ver:"3.4.8-6+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-purge", ver:"3.4.8-6+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3", ver:"3.4.8-6+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-common", ver:"3.4.8-6+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-dbg", ver:"3.4.8-6+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squidclient", ver:"3.4.8-6+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-cgi", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-common", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-dbg", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-purge", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squidclient", ver:"3.5.19-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

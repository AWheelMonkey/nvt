# OpenVAS Vulnerability Test
# $Id: deb_3900.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3900-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703900");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2017-7479", "CVE-2017-7508", "CVE-2017-7520", "CVE-2017-7521");
    script_name("Debian Security Advisory DSA 3900-1 (openvpn - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-06-27 00:00:00 +0200 (Tue, 27 Jun 2017)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3900.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "openvpn on Debian Linux");
        script_tag(name: "insight",   value: "OpenVPN is an application to securely tunnel IP networks over a
single UDP or TCP port. It can be used to access remote sites, make
secure point-to-point connections, enhance wireless security, etc.");
    script_tag(name: "solution",  value: "For the oldstable distribution (jessie), these problems have been fixed
in version 2.3.4-5+deb8u2.

For the stable distribution (stretch), these problems have been fixed in
version 2.4.0-6+deb9u1.

For the testing distribution (buster), these problems have been fixed
in version 2.4.3-1.

For the unstable distribution (sid), these problems have been fixed in
version 2.4.3-1.

We recommend that you upgrade your openvpn packages.");
    script_tag(name: "summary",   value: "Several issues were discovered in openvpn, a virtual private network
application.

CVE-2017-7479 
It was discovered that openvpn did not properly handle the
rollover of packet identifiers. This would allow an authenticated
remote attacker to cause a denial-of-service via application
crash.

CVE-2017-7508 
Guido Vranken discovered that openvpn did not properly handle
specific malformed IPv6 packets. This would allow a remote
attacker to cause a denial-of-service via application crash.

CVE-2017-7520 
Guido Vranken discovered that openvpn did not properly handle
clients connecting to an HTTP proxy with NTLMv2
authentication. This would allow a remote attacker to cause a
denial-of-service via application crash, or potentially leak
sensitive information like the user's proxy password.

CVE-2017-7521 
Guido Vranken discovered that openvpn did not properly handle
some x509 extensions. This would allow a remote attacker to cause
a denial-of-service via application crash.");
    script_tag(name: "vuldetect", value: "This check tests the installed software version using the apt package manager.");

    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"openvpn", ver:"2.3.4-5+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openvpn", ver:"2.4.0-6+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openvpn", ver:"2.4.3-1", rls_regex:"DEB10.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

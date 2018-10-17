# OpenVAS Vulnerability Test
# $Id: deb_3251.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3251-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703251");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-3294");
    script_name("Debian Security Advisory DSA 3251-1 (dnsmasq - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-05-05 00:00:00 +0200 (Tue, 05 May 2015)");
    script_tag(name:"cvss_base", value:"6.4");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3251.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "dnsmasq on Debian Linux");
    script_tag(name: "insight",   value: "Dnsmasq is a lightweight, easy to
configure, DNS forwarder and DHCP server. It is designed to provide DNS and
optionally, DHCP, to a small network. It can serve the names of local machines
which are not in the global DNS. The DHCP server integrates with the DNS
server and allows machines with DHCP-allocated addresses
to appear in the DNS with names configured either in each host or
in a central configuration file. Dnsmasq supports static and dynamic
DHCP leases and BOOTP/TFTP for network booting of diskless machines.");
    script_tag(name: "solution",  value: "For the oldstable distribution
(wheezy), this problem has been fixed in version 2.62-3+deb7u2.

For the stable distribution (jessie), this problem has been fixed in
version 2.72-3+deb8u1.

For the testing distribution (stretch) and the unstable distribution
(sid), this problem will be fixed soon.

We recommend that you upgrade your dnsmasq packages.");
    script_tag(name: "summary",   value: "Nick Sampanis discovered that dnsmasq,
a small caching DNS proxy and DHCP/TFTP server, did not properly check the return
value of the setup_reply() function called during a TCP connection, which is used
then as a size argument in a function which writes data on the client's
connection. A remote attacker could exploit this issue via a specially
crafted DNS request to cause dnsmasq to crash, or potentially to obtain
sensitive information from process memory.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"dnsmasq", ver:"2.62-3+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dnsmasq-base", ver:"2.62-3+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dnsmasq-utils", ver:"2.62-3+deb7u2", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

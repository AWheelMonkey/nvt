# OpenVAS Vulnerability Test
# $Id: deb_3654.nasl 8131 2017-12-15 07:30:28Z teissa $
# Auto-generated from advisory DSA 3654-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703654");
    script_version("$Revision: 8131 $");
    script_cve_id("CVE-2016-4036", "CVE-2016-4049");
    script_name("Debian Security Advisory DSA 3654-1 (quagga - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-15 08:30:28 +0100 (Fri, 15 Dec 2017) $");
    script_tag(name: "creation_date", value: "2016-08-26 00:00:00 +0200 (Fri, 26 Aug 2016)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3654.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "quagga on Debian Linux");
    script_tag(name: "insight",   value: "GNU Quagga is free software which
manages TCP/IP based routing protocols. It supports BGP4, BGP4+, OSPFv2, OSPFv3,
IS-IS, RIPv1, RIPv2, and RIPng as well as the IPv6 versions of these.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
these problems have been fixed in version 0.99.23.1-1+deb8u2.

We recommend that you upgrade your quagga packages.");
    script_tag(name: "summary",   value: "Two vulnerabilities were discovered
in quagga, a BGP/OSPF/RIP routing daemon.

CVE-2016-4036 
Tams Nmeth discovered that sensitive configuration files in
/etc/quagga were world-readable despite containing sensitive
information.

CVE-2016-4049 
Evgeny Uskov discovered that a bgpd instance handling many peers
could be crashed by a malicious user when requesting a route dump.");
    script_tag(name: "vuldetect", value: "This check tests the installed
software version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"quagga", ver:"0.99.23.1-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"quagga-dbg", ver:"0.99.23.1-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"quagga-doc", ver:"0.99.23.1-1+deb8u2", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

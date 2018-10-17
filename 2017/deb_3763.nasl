# OpenVAS Vulnerability Test
# $Id: deb_3763.nasl 9356 2018-04-06 07:17:02Z cfischer $
# Auto-generated from advisory DSA 3763-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703763");
    script_version("$Revision: 9356 $");
    script_cve_id("CVE-2016-7068");
    script_name("Debian Security Advisory DSA 3763-1 (pdns-recursor - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:17:02 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2017-01-13 00:00:00 +0100 (Fri, 13 Jan 2017)");
    script_tag(name: "cvss_base", value: "10.0");
    script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:C/I:C/A:C");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2017/dsa-3763.html");

    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "pdns-recursor on Debian Linux");
    script_tag(name: "insight",   value: "PowerDNS is a versatile nameserver
which supports a large number of different backends ranging from simple zonefiles
to relational databases and load balancing/failover algorithms.
PowerDNS tries to emphasize speed and security.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 3.6.2-2+deb8u3.

We recommend that you upgrade your pdns-recursor packages.");
    script_tag(name: "summary",   value: "Florian Heinz and Martin Kluge reported
that pdns-recursor, a recursive DNS server, parses all records present in a query
regardless of whether they are needed or even legitimate, allowing a remote, unauthenticated
attacker to cause an abnormal CPU usage load on the pdns server,
resulting in a partial denial of service if the system becomes
overloaded.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"pdns-recursor", ver:"3.6.2-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"pdns-recursor-dbg", ver:"3.6.2-2+deb8u3", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

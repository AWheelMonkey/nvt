# OpenVAS Vulnerability Test
# $Id: deb_3636.nasl 8168 2017-12-19 07:30:15Z teissa $
# Auto-generated from advisory DSA 3636-1 using nvtgen 1.0
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
    script_oid("1.3.6.1.4.1.25623.1.0.703636");
    script_version("$Revision: 8168 $");
    script_cve_id("CVE-2016-6254");
    script_name("Debian Security Advisory DSA 3636-1 (collectd - security update)");
    script_tag(name: "last_modification", value: "$Date: 2017-12-19 08:30:15 +0100 (Tue, 19 Dec 2017) $");
    script_tag(name:"creation_date", value:"2016-08-04 16:27:35 +0530 (Thu, 04 Aug 2016)");
    script_tag(name:"cvss_base", value:"6.4");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");
    script_tag(name: "solution_type", value: "VendorFix");
    script_tag(name: "qod_type", value: "package");

    script_xref(name: "URL", value: "http://www.debian.org/security/2016/dsa-3636.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2016 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "collectd on Debian Linux");
    script_tag(name: "insight",   value: "collectd is a small daemon which collects
system information periodically and provides mechanisms to monitor and store the
values in a variety of ways. Since the daemon doesn't need to startup every time it
wants to update the values it's very fast and easy on the system. Also, the
statistics are very fine grained since the files are updated every 10 seconds by
default.");
    script_tag(name: "solution",  value: "For the stable distribution (jessie),
this problem has been fixed in version 5.4.1-6+deb8u1.

For the testing (stretch) and unstable (sid) distributions, this
problem has been fixed in version 5.5.2-1.

We recommend that you upgrade your collectd packages.");
    script_tag(name: "summary",   value: "Emilien Gaspar discovered that collectd,
a statistics collection and monitoring daemon, incorrectly processed incoming
network packets. This resulted in a heap overflow, allowing a remote attacker
to either cause a DoS via application crash, or potentially execute
arbitrary code.

Additionally, security researchers at Columbia University and the
University of Virginia discovered that collectd failed to verify a
return value during initialization. This meant the daemon could
sometimes be started without the desired, secure settings.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"collectd", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-core", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-dbg", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-dev", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-utils", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcollectdclient-dev", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcollectdclient1", ver:"5.5.2-1", rls_regex:"DEB9.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-core", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-dbg", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-dev", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"collectd-utils", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcollectdclient-dev", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libcollectdclient1", ver:"5.4.1-6+deb8u1", rls_regex:"DEB8.[0-9]+")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4133.nasl 9096 2018-03-14 11:25:43Z cfischer $
#
# Auto-generated from advisory DSA 4133-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704133");
  script_version("$Revision: 9096 $");
  script_cve_id("CVE-2017-3144", "CVE-2018-5732", "CVE-2018-5733");
  script_name("Debian Security Advisory DSA 4133-1 (isc-dhcp - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-03-14 12:25:43 +0100 (Wed, 14 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-07 00:00:00 +0100 (Wed, 07 Mar 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4133.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"isc-dhcp on Debian Linux");
  script_tag(name:"insight", value:"Dynamic Host Configuration Protocol (DHCP) is a protocol that
gives client machines 'leases' for IP addresses and can
automatically set their network configuration.

This is the Internet Software Consortium's implementation of a
DHCP client.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 4.3.1-6+deb8u3.

For the stable distribution (stretch), these problems have been fixed in
version 4.3.5-3+deb9u1.

We recommend that you upgrade your isc-dhcp packages.

For the detailed security status of isc-dhcp please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/isc-dhcp");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in the ISC DHCP client,
relay and server. The Common Vulnerabilities and Exposures project
identifies the following issues:

CVE-2017-3144 
It was discovered that the DHCP server does not properly clean up
closed OMAPI connections, which can lead to exhaustion of the pool
of socket descriptors available to the DHCP server, resulting in
denial of service.

CVE-2018-5732 
Felix Wilhelm of the Google Security Team discovered that the DHCP
client is prone to an out-of-bound memory access vulnerability when
processing specially constructed DHCP options responses, resulting
in potential execution of arbitrary code by a malicious DHCP server.

CVE-2018-5733 
Felix Wilhelm of the Google Security Team discovered that the DHCP
server does not properly handle reference counting when processing
client requests. A malicious client can take advantage of this flaw
to cause a denial of service (dhcpd crash) by sending large amounts
of traffic.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"isc-dhcp-client", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-client-ddns", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-common", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-dev", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-ldap", ver:"4.3.5-3+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-client", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-client-dbg", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-common", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-dbg", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-dev", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-relay-dbg", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-dbg", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"isc-dhcp-server-ldap", ver:"4.3.1-6+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

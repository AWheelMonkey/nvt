###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4292.nasl 11342 2018-09-12 06:02:53Z cfischer $
#
# Auto-generated from advisory DSA 4292-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704292");
  script_version("$Revision: 11342 $");
  script_cve_id("CVE-2018-16657");
  script_name("Debian Security Advisory DSA 4292-1 (kamailio - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 08:02:53 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-11 00:00:00 +0200 (Tue, 11 Sep 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4292.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"kamailio on Debian Linux");
  script_tag(name:"insight", value:"Kamailio is a very fast and flexible SIP (RFC3261)
proxy server. Written entirely in C, Kamailio can handle thousands calls
per second even on low-budget hardware.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 4.4.4-2+deb9u3.

We recommend that you upgrade your kamailio packages.

For the detailed security status of kamailio please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/kamailio");
  script_tag(name:"summary",  value:"Henning Westerholt discovered a flaw related to the Via header
processing in kamailio, a very fast, dynamic and configurable SIP
server. An unauthenticated attacker can take advantage of this flaw to
mount a denial of service attack via a specially crafted SIP message
with an invalid Via header.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"kamailio", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-autheph-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-berkeley-bin", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-berkeley-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-carrierroute-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-cnxcc-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-cpl-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-dbg", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-erlang-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-extra-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-geoip-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-ims-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-java-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-json-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-kazoo-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-ldap-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-lua-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-memcached-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-mono-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-mysql-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-outbound-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-perl-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-postgres-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-presence-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-purple-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-python-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-radius-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-redis-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-sctp-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-snmpstats-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-sqlite-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-tls-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-unixodbc-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-utils-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-websocket-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-xml-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"kamailio-xmpp-modules", ver:"4.4.4-2+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

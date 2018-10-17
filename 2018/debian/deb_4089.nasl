###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4089.nasl 8454 2018-01-18 00:06:34Z teissa $
#
# Auto-generated from advisory DSA 4089-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704089");
  script_version("$Revision: 8454 $");
  script_cve_id("CVE-2017-3145");
  script_name("Debian Security Advisory DSA 4089-1 (bind9 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-01-18 01:06:34 +0100 (Thu, 18 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-16 00:00:00 +0100 (Tue, 16 Jan 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4089.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"bind9 on Debian Linux");
  script_tag(name:"insight", value:"The Berkeley Internet Name Domain (BIND) implements an Internet domain
name server. BIND is the most widely-used name server software on the
Internet, and is supported by the Internet Software Consortium, www.isc.org.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1:9.9.5.dfsg-9+deb8u15.

For the stable distribution (stretch), this problem has been fixed in
version 1:9.10.3.dfsg.P4-12.3+deb9u4.

We recommend that you upgrade your bind9 packages.

For the detailed security status of bind9 please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/bind9");
  script_tag(name:"summary",  value:"Jayachandran Palanisamy of Cygate AB reported that BIND, a DNS server
implementation, was improperly sequencing cleanup operations, leading in
some cases to a use-after-free error, triggering an assertion failure
and crash in named.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"bind9", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9-doc", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9-host", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9utils", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dnsutils", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"host", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libbind-dev", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libbind-export-dev", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libbind9-140", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdns-export162", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdns162", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libirs-export141", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libirs141", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisc-export160", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisc160", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccc-export140", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccc140", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccfg-export140", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccfg140", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblwres141", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lwresd", ver:"1:9.10.3.dfsg.P4-12.3+deb9u4", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9-doc", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9-host", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bind9utils", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dnsutils", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"host", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libbind-dev", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libbind-export-dev", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libbind9-90", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdns-export100", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdns100", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libirs-export91", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisc-export95", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisc95", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccc90", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccfg-export90", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libisccfg90", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"liblwres90", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lwresd", ver:"1:9.9.5.dfsg-9+deb8u15", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

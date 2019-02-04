###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4314.nasl 12568 2018-11-29 07:50:34Z mmartin $
#
# Auto-generated from advisory DSA 4314-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704314");
  script_version("$Revision: 12568 $");
  script_cve_id("CVE-2018-18065");
  script_name("Debian Security Advisory DSA 4314-1 (net-snmp - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-29 08:50:34 +0100 (Thu, 29 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-11 00:00:00 +0200 (Thu, 11 Oct 2018)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4314.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"net-snmp on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 5.7.3+dfsg-1.7+deb9u1.

We recommend that you upgrade your net-snmp packages.

For the detailed security status of net-snmp please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/net-snmp");
  script_tag(name:"summary",  value:"Magnus Klaaborg Stubman discovered a NULL pointer dereference bug in
net-snmp, a suite of Simple Network Management Protocol applications,
allowing a remote, authenticated attacker to crash the snmpd process
(causing a denial of service).");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libsnmp-base", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsnmp-dev", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsnmp-perl", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsnmp30", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libsnmp30-dbg", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-netsnmp", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"snmp", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"snmpd", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"snmptrapd", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tkmib", ver:"5.7.3+dfsg-1.7+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

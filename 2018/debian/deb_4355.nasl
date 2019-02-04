###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4355.nasl 13394 2019-02-01 07:36:10Z mmartin $
#
# Auto-generated from advisory DSA 4355-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704355");
  script_version("$Revision: 13394 $");
  script_cve_id("CVE-2018-0732", "CVE-2018-0734", "CVE-2018-0737", "CVE-2018-5407");
  script_name("Debian Security Advisory DSA 4355-1 (openssl1.0 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-02-01 08:36:10 +0100 (Fri, 01 Feb 2019) $");
  script_tag(name:"creation_date", value:"2018-12-19 00:00:00 +0100 (Wed, 19 Dec 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4355.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"openssl1.0 on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1.0.2q-1~deb9u1. Going forward, openssl1.0 security updates for
stretch will be based on the 1.0.2x upstream releases.

We recommend that you upgrade your openssl1.0 packages.

For the detailed security status of openssl1.0 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/openssl1.0");
  script_tag(name:"summary",  value:"Several local side channel attacks and a denial of service via large
Diffie-Hellman parameters were discovered in OpenSSL, a Secure Sockets
Layer toolkit.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libcrypto1.0.2-udeb", ver:"1.0.2q-1~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0-dev", ver:"1.0.2q-1~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.2", ver:"1.0.2q-1~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.2-udeb", ver:"1.0.2q-1~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

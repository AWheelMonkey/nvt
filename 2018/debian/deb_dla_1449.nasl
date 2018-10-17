###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1449.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# Auto-generated from advisory DLA 1449-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891449");
  script_version("$Revision: 10965 $");
  script_cve_id("CVE-2018-0732", "CVE-2018-0737");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1449-1] openssl security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-30 00:00:00 +0200 (Mon, 30 Jul 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00043.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"openssl on Debian Linux");
  script_tag(name:"insight", value:"This package is part of the OpenSSL project's implementation of the SSL
and TLS cryptographic protocols for secure communication over the
Internet.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
1.0.1t-1+deb8u9.

We recommend that you upgrade your openssl packages.");
  script_tag(name:"summary",  value:"Two issues were discovered in OpenSSL, the Secure Sockets Layer toolkit.

CVE-2018-0732

Denial of service by a malicious server that sends a very large
prime value to the client during TLS handshake.

CVE-2018-0737

Alejandro Cabrera Aldaya, Billy Brumley, Cesar Pereida Garcia and
Luis Manuel Alvarez Tapia discovered that the OpenSSL RSA Key
generation algorithm has been shown to be vulnerable to a cache
timing side channel attack. An attacker with sufficient access to
mount cache timing attacks during the RSA key generation process
could recover the private key.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libssl-dev", ver:"1.0.1t-1+deb8u9", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl-doc", ver:"1.0.1t-1+deb8u9", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.0", ver:"1.0.1t-1+deb8u9", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.0-dbg", ver:"1.0.1t-1+deb8u9", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openssl", ver:"1.0.1t-1+deb8u9", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

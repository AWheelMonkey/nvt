###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3959.nasl 7085 2017-09-08 15:01:13Z cfischer $
#
# Auto-generated from advisory DSA 3959-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.703959");
  script_version("$Revision: 7085 $");
  script_cve_id("CVE-2017-0379");
  script_name("Debian Security Advisory DSA 3959-1 (libgcrypt20 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-09-08 17:01:13 +0200 (Fri, 08 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-08-29 00:00:00 +0200 (Tue, 29 Aug 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3959.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"libgcrypt20 on Debian Linux");
  script_tag(name:"insight", value:"libgcrypt contains cryptographic functions. Many important free
ciphers, hash algorithms and public key signing algorithms have been
implemented:");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1.7.6-2+deb9u2.

For the unstable distribution (sid), this problem has been fixed in
version 1.7.9-1.

We recommend that you upgrade your libgcrypt20 packages.");
  script_tag(name:"summary",  value:"Daniel Genkin, Luke Valenta and Yuval Yarom discovered that Libgcrypt
is prone to a local side-channel attack against the ECDH encryption with
Curve25519, allowing recovery of the private key.

See https://eprint.iacr.org/2017/806 
for details.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libgcrypt-mingw-w64-dev", ver:"1.7.6-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt11-dev", ver:"1.7.6-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt20", ver:"1.7.6-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt20-dev", ver:"1.7.6-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt20-doc", ver:"1.7.6-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

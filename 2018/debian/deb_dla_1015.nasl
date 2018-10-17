###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1015.nasl 11768 2018-10-05 14:07:38Z cfischer $
#
# Auto-generated from advisory DLA 1015-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891015");
  script_version("$Revision: 11768 $");
  script_cve_id("CVE-2017-7526");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1015-1] libgcrypt11 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-05 16:07:38 +0200 (Fri, 05 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-02-05 00:00:00 +0100 (Mon, 05 Feb 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/07/msg00007.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"libgcrypt11 on Debian Linux");
  script_tag(name:"insight", value:"libgcrypt contains cryptographic functions. Many important free
ciphers, hash algorithms and public key signing algorithms have been
implemented:
Arcfour, Blowfish, CAST5, DES, AES, Twofish, Serpent, rfc2268 (rc2), SEED,
Camellia, CRC, MD4, MD5, RIPE-MD160, SHA-1, SHA-256, SHA-512, Tiger,
Whirlpool, DSA, DSA2, ElGamal, RSA, ECC.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', this issue has been fixed in libgcrypt11 version
1.5.0-5+deb7u6.

We recommend that you upgrade your libgcrypt11 packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a key disclosure vulnerability in libgcrypt11
a library of cryptographic routines:

It is well known that constant-time implementations of modular exponentiation
cannot use sliding windows. However, software libraries such as Libgcrypt,
used by GnuPG, continue to use sliding windows. It is widely believed that,
even if the complete pattern of squarings and multiplications is observed
through a side-channel attack, the number of exponent bits leaked is not
sufficient to carry out a full key-recovery attack against RSA.
Specifically, 4-bit sliding windows leak only 40% of the bits, and 5-bit
sliding windows leak only 33% of the bits.

-- Sliding right into disaster: Left-to-right sliding windows leak
<");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libgcrypt11", ver:"1.5.0-5+deb7u6", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt11-dbg", ver:"1.5.0-5+deb7u6", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt11-dev", ver:"1.5.0-5+deb7u6", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcrypt11-doc", ver:"1.5.0-5+deb7u6", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

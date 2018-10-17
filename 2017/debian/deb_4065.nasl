###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4065.nasl 8291 2018-01-04 09:51:36Z asteins $
#
# Auto-generated from advisory DSA 4065-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704065");
  script_version("$Revision: 8291 $");
  script_cve_id("CVE-2017-3737", "CVE-2017-3738");
  script_name("Debian Security Advisory DSA 4065-1 (openssl1.0 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-01-04 10:51:36 +0100 (Thu, 04 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-17 00:00:00 +0100 (Sun, 17 Dec 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4065.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"openssl1.0 on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1.0.2l-2+deb9u2.

We recommend that you upgrade your openssl1.0 packages.

For the detailed security status of openssl1.0 please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/openssl1.0");
  script_tag(name:"summary",  value:"Multiple vulnerabilities have been discovered in OpenSSL, a Secure
Sockets Layer toolkit. The Common Vulnerabilities and Exposures project
identifies the following issues:

CVE-2017-3737 
David Benjamin of Google reported that OpenSSL does not properly
handle SSL_read() and SSL_write() while being invoked in an error
state, causing data to be passed without being decrypted or
encrypted directly from the SSL/TLS record layer.

CVE-2017-3738 
It was discovered that OpenSSL contains an overflow bug in the AVX2
Montgomery multiplication procedure used in exponentiation with
1024-bit moduli.

Details can be found in the upstream advisory:
https://www.openssl.org/news/secadv/20171207.txt");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libssl1.0-dev", ver:"1.0.2l-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.2", ver:"1.0.2l-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

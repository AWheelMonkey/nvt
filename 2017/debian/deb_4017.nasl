###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4017.nasl 7992 2017-12-05 08:34:22Z teissa $
#
# Auto-generated from advisory DSA 4017-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704017");
  script_version("$Revision: 7992 $");
  script_cve_id("CVE-2017-3735", "CVE-2017-3736");
  script_name("Debian Security Advisory DSA 4017-1 (openssl1.0 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-05 09:34:22 +0100 (Tue, 05 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-11-03 00:00:00 +0100 (Fri, 03 Nov 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4017.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"openssl1.0 on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1.0.2l-2+deb9u1.

For the unstable distribution (sid), these problems have been fixed in
version 1.0.2m-1.

We recommend that you upgrade your openssl1.0 packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities have been discovered in OpenSSL, a Secure
Sockets Layer toolkit. The Common Vulnerabilities and Exposures project
identifies the following issues:

CVE-2017-3735 
It was discovered that OpenSSL is prone to a one-byte buffer
overread while parsing a malformed IPAddressFamily extension in an
X.509 certificate.

Details can be found in the upstream advisory:
https://www.openssl.org/news/secadv/20170828.txtCVE-2017-3736 
It was discovered that OpenSSL contains a carry propagation bug in
the x86_64 Montgomery squaring procedure.

Details can be found in the upstream advisory:
https://www.openssl.org/news/secadv/20171102.txt");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libssl1.0-dev", ver:"1.0.2l-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libssl1.0.2", ver:"1.0.2l-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

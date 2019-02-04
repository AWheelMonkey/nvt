###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4344.nasl 12832 2018-12-19 07:49:53Z asteins $
#
# Auto-generated from advisory DSA 4344-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704344");
  script_version("$Revision: 12832 $");
  script_cve_id("CVE-2018-19206");
  script_name("Debian Security Advisory DSA 4344-1 (roundcube - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-19 08:49:53 +0100 (Wed, 19 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-24 00:00:00 +0100 (Sat, 24 Nov 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4344.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"roundcube on Debian Linux");
  script_tag(name:"insight", value:"RoundCube Webmail is a browser-based multilingual IMAP client with an
application-like user interface. It provides full functionality
expected from an e-mail client, including MIME support, address book,
folder manipulation and message filters.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1.2.3+dfsg.1-4+deb9u3.

We recommend that you upgrade your roundcube packages.

For the detailed security status of roundcube please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/roundcube");
  script_tag(name:"summary",  value:"Aidan Marlin discovered that roundcube, a skinnable AJAX based webmail
solution for IMAP servers, is prone to a cross-site scripting
vulnerability in handling invalid style tag content.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"roundcube", ver:"1.2.3+dfsg.1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"roundcube-core", ver:"1.2.3+dfsg.1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"roundcube-mysql", ver:"1.2.3+dfsg.1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"roundcube-pgsql", ver:"1.2.3+dfsg.1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"roundcube-plugins", ver:"1.2.3+dfsg.1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"roundcube-sqlite3", ver:"1.2.3+dfsg.1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

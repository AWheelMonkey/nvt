###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3950.nasl 7013 2017-08-25 13:17:51Z asteins $
#
# Auto-generated from advisory DSA 3950-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.703950");
  script_version("$Revision: 7013 $");
  script_cve_id("CVE-2017-6886", "CVE-2017-6887");
  script_name("Debian Security Advisory DSA 3950-1 (libraw - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-08-25 15:17:51 +0200 (Fri, 25 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-21 00:00:00 +0200 (Mon, 21 Aug 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3950.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"libraw on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 0.16.0-9+deb8u3.

For the stable distribution (stretch), these problems have been fixed in
version 0.17.2-6+deb9u1.

We recommend that you upgrade your libraw packages.");
  script_tag(name:"summary",  value:"Hossein Lotfi and Jakub Jirasek from Secunia Research have discovered
multiple vulnerabilities in LibRaw, a library for reading RAW images. An
attacker could cause a memory corruption leading to a DoS (Denial of
Service) with craft KDC or TIFF file.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libraw-bin", ver:"0.16.0-9+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw-dev", ver:"0.16.0-9+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw-doc", ver:"0.16.0-9+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw10", ver:"0.16.0-9+deb8u3", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw-bin", ver:"0.17.2-6+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw-dev", ver:"0.17.2-6+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw-doc", ver:"0.17.2-6+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libraw15", ver:"0.17.2-6+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

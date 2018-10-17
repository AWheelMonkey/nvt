###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4058.nasl 8065 2017-12-09 20:53:54Z teissa $
#
# Auto-generated from advisory DSA 4058-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704058");
  script_version("$Revision: 8065 $");
  script_cve_id("CVE-2017-1000229", "CVE-2017-16938");
  script_name("Debian Security Advisory DSA 4058-1 (optipng - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-09 21:53:54 +0100 (Sat, 09 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-08 00:00:00 +0100 (Fri, 08 Dec 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4058.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"optipng on Debian Linux");
  script_tag(name:"insight", value:"OptiPNG is a PNG optimizer that recompresses the image files to a smaller
size. It losslessly reduces the bit depth, the color type and the color
palette of the image, runs a suite of compression methods and strategies,
and selects the compression parameters that yield the smallest output file.
It also recognizes several external file formats like BMP, GIF, TIFF and
PNM (PBM, PGM, PPM).");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 0.7.5-1+deb8u2.

For the stable distribution (stretch), these problems have been fixed in
version 0.7.6-1+deb9u1.

We recommend that you upgrade your optipng packages.

For the detailed security status of optipng please refer to its security
tracker page at: https://security-tracker.debian.org/tracker/optipng");
  script_tag(name:"summary",  value:"Two vulnerabilities were discovered in optipng, an advanced PNG
optimizer, which may result in denial of service or the execution of
arbitrary code if a malformed file is processed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"optipng", ver:"0.7.5-1+deb8u2", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"optipng", ver:"0.7.6-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

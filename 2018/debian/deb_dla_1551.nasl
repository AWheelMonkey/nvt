###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1551.nasl 12164 2018-10-30 09:02:07Z asteins $
#
# Auto-generated from advisory DLA 1551-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891551");
  script_version("$Revision: 12164 $");
  script_cve_id("CVE-2018-10958", "CVE-2018-10999", "CVE-2018-16336");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1551-1] exiv2 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-30 10:02:07 +0100 (Tue, 30 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-22 00:00:00 +0200 (Mon, 22 Oct 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/10/msg00012.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net", re:"ssh/login/release=DEB8\.[0-9]+");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"exiv2 on Debian Linux");
  script_tag(name:"insight", value:"Exiv2 is a C++ library and a command line utility to manage image metadata.
It provides fast and easy read and write access to the Exif, IPTC and XMP
metadata of images in various formats");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
0.24-4.1+deb8u2.

We recommend that you upgrade your exiv2 packages.");
  script_tag(name:"summary",  value:"A vulnerability has been discovered in exiv2 (CVE-2018-16336), a C++
library and a command line utility to manage image metadata, resulting
in remote denial of service (heap-based buffer over-read/overflow) via
a crafted image file.

Additionally, this update includes a minor change to the patch for the
CVE-2018-10958/CVE-2018-10999 vulnerability first addressed in DLA
1402-1. The initial patch was overly restrictive and has been adjusted
to remove the excessive restriction.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"exiv2", ver:"0.24-4.1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-13", ver:"0.24-4.1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-dbg", ver:"0.24-4.1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-dev", ver:"0.24-4.1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libexiv2-doc", ver:"0.24-4.1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1638.nasl 13237 2019-01-23 10:24:40Z asteins $
#
# Auto-generated from advisory DLA 1638-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.891638");
  script_version("$Revision: 13237 $");
  script_cve_id("CVE-2016-3616", "CVE-2018-11212", "CVE-2018-11213", "CVE-2018-11214", "CVE-2018-1152");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1638-1] libjpeg-turbo security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-23 11:24:40 +0100 (Wed, 23 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-23 00:00:00 +0100 (Wed, 23 Jan 2019)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/01/msg00015.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"libjpeg-turbo on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
1:1.3.1-12+deb8u1.

We recommend that you upgrade your libjpeg-turbo packages.");
  script_tag(name:"summary", value:"Several vulnerabilities have been resolved in libjpeg-turbo, Debian's
default JPEG implementation.

CVE-2016-3616

The cjpeg utility in libjpeg allowed remote attackers to cause a
denial of service (NULL pointer dereference and application crash) or
execute arbitrary code via a crafted file.

This issue got fixed by the same patch that fixed CVE-2018-11213 and
CVE-2018-11214.

CVE-2018-1152

libjpeg-turbo has been found vulnerable to a denial of service
vulnerability caused by a divide by zero when processing a crafted
BMP image. The issue has been resolved by a boundary check.

CVE-2018-11212

The alloc_sarray function in jmemmgr.c allowed remote attackers to
cause a denial of service (divide-by-zero error) via a crafted file.

The issue has been addressed by checking the image size when reading
a targa file and throwing an error when image width or height is 0.

CVE-2018-11213
CVE-2018-11214

The get_text_gray_row and get_text_rgb_row functions in rdppm.c both
allowed remote attackers to cause a denial of service (Segmentation
fault) via a crafted file.

By checking the range of integer values in PPM text files and adding
checks to ensure values are within the specified range, both issues");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libjpeg-dev", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjpeg-turbo-progs", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjpeg-turbo-progs-dbg", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjpeg62-turbo", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjpeg62-turbo-dbg", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjpeg62-turbo-dev", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libturbojpeg1", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libturbojpeg1-dbg", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libturbojpeg1-dev", ver:"1:1.3.1-12+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

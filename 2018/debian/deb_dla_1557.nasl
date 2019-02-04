###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1557.nasl 12697 2018-12-07 07:56:28Z mmartin $
#
# Auto-generated from advisory DLA 1557-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891557");
  script_version("$Revision: 12697 $");
  script_cve_id("CVE-2018-17100", "CVE-2018-17101", "CVE-2018-18557");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1557-1] tiff security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-07 08:56:28 +0100 (Fri, 07 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-10-29 00:00:00 +0100 (Mon, 29 Oct 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/10/msg00019.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"tiff on Debian Linux");
  script_tag(name:"insight", value:"libtiff is a library providing support for the Tag Image File Format
(TIFF), a widely used format for storing image data.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
4.0.3-12.3+deb8u7.

We recommend that you upgrade your tiff packages.");
  script_tag(name:"summary",  value:"CVE-2018-17100
An int32 overflow can cause a denial of service (application
crash) or possibly have unspecified other impact via a crafted
image file

CVE-2018-17101
Out-of-bounds writes can cause a denial of service (application
crash) or possibly have unspecified other impact via a crafted
image file

CVE-2018-18557
Out-of-bounds write due to ignoring buffer size can cause a denial
of service (application crash) or possibly have unspecified other
impact via a crafted image file");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libtiff-doc", ver:"4.0.3-12.3+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtiff-opengl", ver:"4.0.3-12.3+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtiff-tools", ver:"4.0.3-12.3+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtiff5", ver:"4.0.3-12.3+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtiff5-dev", ver:"4.0.3-12.3+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtiffxx5", ver:"4.0.3-12.3+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

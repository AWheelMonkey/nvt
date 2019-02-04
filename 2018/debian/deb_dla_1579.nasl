###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1579.nasl 12568 2018-11-29 07:50:34Z mmartin $
#
# Auto-generated from advisory DLA 1579-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891579");
  script_version("$Revision: 12568 $");
  script_cve_id("CVE-2017-17480", "CVE-2018-18088");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1579-1] openjpeg2 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-29 08:50:34 +0100 (Thu, 29 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-20 00:00:00 +0100 (Tue, 20 Nov 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00018.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"openjpeg2 on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
2.1.0-2+deb8u5.

We recommend that you upgrade your openjpeg2 packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities have been discovered in openjpeg2, the
open-source JPEG 2000 codec.

CVE-2017-17480

Write stack buffer overflow due to missing buffer length formatter in
fscanf call (jp3d and jpwl codecs). This vulnerability might be
leveraged by remote attackers using crafted jp3d and jpwl files to
cause denial of service or possibly remote code execution.

CVE-2018-18088

Null pointer dereference caused by null image components in imagetopnm.
This vulnerability might be leveraged by remote attackers using crafted
BMP files to cause denial of service.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libopenjp2-7", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjp2-7-dbg", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjp2-7-dev", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjp2-tools", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjp3d-tools", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjp3d7", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjpip-dec-server", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjpip-server", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjpip-viewer", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libopenjpip7", ver:"2.1.0-2+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

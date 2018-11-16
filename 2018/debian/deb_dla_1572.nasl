###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1572.nasl 12271 2018-11-09 07:13:18Z cfischer $
#
# Auto-generated from advisory DLA 1572-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891572");
  script_version("$Revision: 12271 $");
  script_cve_id("CVE-2018-16845");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1572-1] nginx security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 08:13:18 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-09 00:00:00 +0100 (Fri, 09 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00010.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"nginx on Debian Linux");
  script_tag(name:"insight", value:"Nginx ('engine X') is a high-performance web and reverse proxy server
created by Igor Sysoev. It can be used both as a standalone web server
and as a proxy to reduce the load on back-end HTTP or mail servers.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in nginx version
1.6.2-5+deb8u6.

We recommend that you upgrade your nginx packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a denial of service (DoS) vulnerability
in the nginx web/proxy server.

As there was no validation for the size of a 64-bit atom in an MP4 file,
this could have led to a CPU hog when the size was 0, or various other
problems due to integer underflow when the calculating atom data size,
including segmentation faults or even worker-process memory disclosure.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"nginx", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-common", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-doc", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-extras-dbg", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-full-dbg", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"nginx-light-dbg", ver:"1.6.2-5+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

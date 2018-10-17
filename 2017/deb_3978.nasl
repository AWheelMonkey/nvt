###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3978.nasl 7223 2017-09-21 14:06:29Z cfischer $
#
# Auto-generated from advisory DSA 3978-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.703978");
  script_version("$Revision: 7223 $");
  script_cve_id("CVE-2017-2862");
  script_name("Debian Security Advisory DSA 3978-1 (gdk-pixbuf - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-09-21 16:06:29 +0200 (Thu, 21 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-18 00:00:00 +0200 (Mon, 18 Sep 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3978.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"gdk-pixbuf on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 2.31.1-2+deb8u6.

For the stable distribution (stretch), this problem has been fixed in
version 2.36.5-2+deb9u1.

We recommend that you upgrade your gdk-pixbuf packages.");
  script_tag(name:"summary",  value:"Marcin Noga discovered a buffer overflow in the JPEG loader of the GDK
Pixbuf library, which may result in the execution of arbitrary code if
a malformed file is opened.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gir1.2-gdkpixbuf-2.0", ver:"2.36.5-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-0", ver:"2.36.5-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-common", ver:"2.36.5-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-dev", ver:"2.36.5-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-doc", ver:"2.36.5-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gir1.2-gdkpixbuf-2.0", ver:"2.31.1-2+deb8u6", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-0", ver:"2.31.1-2+deb8u6", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-0-dbg", ver:"2.31.1-2+deb8u6", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-common", ver:"2.31.1-2+deb8u6", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-dev", ver:"2.31.1-2+deb8u6", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgdk-pixbuf2.0-doc", ver:"2.31.1-2+deb8u6", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

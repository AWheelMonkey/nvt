###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4346.nasl 13380 2019-01-31 09:40:12Z cfischer $
#
# Auto-generated from advisory DSA 4346-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704346");
  script_version("$Revision: 13380 $");
  script_cve_id("CVE-2018-19409", "CVE-2018-19475", "CVE-2018-19476", "CVE-2018-19477");
  script_name("Debian Security Advisory DSA 4346-1 (ghostscript - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-31 10:40:12 +0100 (Thu, 31 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-27 00:00:00 +0100 (Tue, 27 Nov 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  #nb: Currently lowered from packages due to an issue in revcomp seeing 9.26a~dfsg-0+deb9u1 < 9.26~dfsg-0+deb9u1
  script_tag(name:"qod_type", value:"executable_version_unreliable");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4346.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"ghostscript on Debian Linux");
  script_tag(name:"insight", value:"GPL Ghostscript is used for PostScript/PDF preview and printing.
Usually as a back-end to a program such as ghostview, it can display
PostScript and PDF documents in an X11 environment.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 9.26~dfsg-0+deb9u1.

We recommend that you upgrade your ghostscript packages.

For the detailed security status of ghostscript please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/ghostscript");
  script_tag(name:"summary",  value:"Several vulnerabilities were discovered in Ghostscript, the GPL
PostScript/PDF interpreter, which may result in denial of service or the
execution of arbitrary code if a malformed Postscript file is processed
(despite the -dSAFER sandbox being enabled).

This update rebases ghostscript for stretch to the upstream version 9.26
which includes additional changes.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ghostscript", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ghostscript-dbg", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ghostscript-doc", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ghostscript-x", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgs-dev", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgs9", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgs9-common", ver:"9.26~dfsg-0+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

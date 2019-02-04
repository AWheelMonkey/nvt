###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1547.nasl 12912 2018-12-31 08:46:47Z asteins $
#
# Auto-generated from advisory DLA 1547-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891547");
  script_version("$Revision: 12912 $");
  script_cve_id("CVE-2018-11797");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1547-1] libpdfbox-java security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-31 09:46:47 +0100 (Mon, 31 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-10-17 00:00:00 +0200 (Wed, 17 Oct 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/10/msg00008.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"libpdfbox-java on Debian Linux");
  script_tag(name:"insight", value:"The Apache PDFBox library is an open source Java tool for working with PDF
documents. This project allows creation of new PDF documents, manipulation
of existing documents and the ability to extract content from documents.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in libpdfbox-java version
1:1.8.7+dfsg-1+deb8u2.

We recommend that you upgrade your libpdfbox-java packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a denial-of-service vulnerability in
libpdfbox-java, a PDF library for Java.

A malicious PDF file could have triggered an extremely long running
computation when parsing the page tree.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libfontbox-java", ver:"1:1.8.7+dfsg-1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfontbox-java-doc", ver:"1:1.8.7+dfsg-1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjempbox-java", ver:"1:1.8.7+dfsg-1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libjempbox-java-doc", ver:"1:1.8.7+dfsg-1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpdfbox-java", ver:"1:1.8.7+dfsg-1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libpdfbox-java-doc", ver:"1:1.8.7+dfsg-1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

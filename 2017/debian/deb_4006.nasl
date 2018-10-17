###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4006.nasl 7604 2017-11-01 06:48:12Z asteins $
#
# Auto-generated from advisory DSA 4006-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704006");
  script_version("$Revision: 7604 $");
  script_cve_id("CVE-2017-14685", "CVE-2017-14686", "CVE-2017-14687", "CVE-2017-15587");
  script_name("Debian Security Advisory DSA 4006-1 (mupdf - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-11-01 07:48:12 +0100 (Wed, 01 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-10-24 00:00:00 +0200 (Tue, 24 Oct 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-4006.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"mupdf on Debian Linux");
  script_tag(name:"insight", value:"MuPDF is a lightweight PDF viewer and toolkit written in portable C.
It also reads XPS, OpenXPS and ePub documents.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 1.9a+ds1-4+deb9u1.

We recommend that you upgrade your mupdf packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities have been found in MuPDF, a PDF file viewer, which
may result in denial of service or the execution of arbitrary code.

CVE-2017-14685,
CVE-2017-14686,
and CVE-2017-14687 
WangLin discovered that a crafted .xps file can crash MuPDF and
potentially execute arbitrary code in several ways, since the
application makes unchecked assumptions on the entry format.

CVE-2017-15587 
Terry Chia and Jeremy Heng discovered an integer overflow that can
cause arbitrary code execution via a crafted .pdf file.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmupdf-dev", ver:"1.9a+ds1-4+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf", ver:"1.9a+ds1-4+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf-tools", ver:"1.9a+ds1-4+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

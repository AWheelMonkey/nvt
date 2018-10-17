###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4152.nasl 9268 2018-03-29 14:05:16Z cfischer $
#
# Auto-generated from advisory DSA 4152-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704152");
  script_version("$Revision: 9268 $");
  script_cve_id("CVE-2018-1000051", "CVE-2018-6544");
  script_name("Debian Security Advisory DSA 4152-1 (mupdf - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-03-29 16:05:16 +0200 (Thu, 29 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-27 00:00:00 +0200 (Tue, 27 Mar 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4152.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"mupdf on Debian Linux");
  script_tag(name:"insight", value:"MuPDF is a lightweight PDF viewer and toolkit written in portable C.
It also reads XPS, OpenXPS and ePub documents.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 1.5-1+deb8u4.

For the stable distribution (stretch), these problems have been fixed in
version 1.9a+ds1-4+deb9u3.

We recommend that you upgrade your mupdf packages.

For the detailed security status of mupdf please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/mupdf");
  script_tag(name:"summary",  value:"Two vulnerabilities were discovered in MuPDF, a PDF, XPS, and e-book
viewer, which may result in denial of service or remote code execution.
An attacker can craft a PDF document which, when opened in the victim
host, might consume vast amounts of memory, crash the program, or, in
some cases, execute code in the context in which the application is
running.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmupdf-dev", ver:"1.9a+ds1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf", ver:"1.9a+ds1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf-tools", ver:"1.9a+ds1-4+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmupdf-dev", ver:"1.5-1+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf", ver:"1.5-1+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mupdf-tools", ver:"1.5-1+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

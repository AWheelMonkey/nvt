###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4173.nasl 9517 2018-04-18 09:30:14Z asteins $
#
# Auto-generated from advisory DSA 4173-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704173");
  script_version("$Revision: 9517 $");
  script_cve_id("CVE-2017-12110", "CVE-2017-12111", "CVE-2017-2896", "CVE-2017-2897", "CVE-2017-2919");
  script_name("Debian Security Advisory DSA 4173-1 (r-cran-readxl - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-04-18 11:30:14 +0200 (Wed, 18 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-04-16 00:00:00 +0200 (Mon, 16 Apr 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4173.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"r-cran-readxl on Debian Linux");
  script_tag(name:"insight", value:"The readxl package imports Excel files into R. Supports '.xls' via the embedded
'libxls' C library (http://sourceforge.net/projects/libxls/) and '.xlsx' via

the embedded 'RapidXML' C++ library (http://rapidxml.sourceforge.net).");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 0.1.1-1+deb9u1.

We recommend that you upgrade your r-cran-readxl packages.

For the detailed security status of r-cran-readxl please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/r-cran-readxl");
  script_tag(name:"summary",  value:"Marcin Noga discovered multiple vulnerabilities in readxl, a GNU R
package to read Excel files (via the integrated libxls library), which
could result in the execution of arbitrary code if a malformed
spreadsheet is processed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"r-cran-readxl", ver:"0.1.1-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

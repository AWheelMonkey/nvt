###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4095.nasl 8560 2018-01-29 07:24:45Z cfischer $
#
# Auto-generated from advisory DSA 4095-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704095");
  script_version("$Revision: 8560 $");
  script_cve_id("CVE-2018-5345");
  script_name("Debian Security Advisory DSA 4095-1 (gcab - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-01-29 08:24:45 +0100 (Mon, 29 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-24 00:00:00 +0100 (Wed, 24 Jan 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4095.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"gcab on Debian Linux");
  script_tag(name:"insight", value:"gcab can list, extract and create cabinet (.cab) files, commonly used
as archives to distribute software on Windows.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 0.7-2+deb9u1.

We recommend that you upgrade your gcab packages.

For the detailed security status of gcab please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/gcab");
  script_tag(name:"summary",  value:"It was discovered that gcab, a Microsoft Cabinet file manipulation tool,
is prone to a stack-based buffer overflow vulnerability when extracting
.cab files. An attacker can take advantage of this flaw to cause a
denial-of-service or, potentially the execution of arbitrary code with
the privileges of the user running gcab, if a specially crafted .cab
file is processed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gcab", ver:"0.7-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gir1.2-libgcab-1.0", ver:"0.7-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcab-1.0-0", ver:"0.7-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcab-dev", ver:"0.7-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libgcab-doc", ver:"0.7-2+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

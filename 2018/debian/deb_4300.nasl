###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4300.nasl 11578 2018-09-25 05:40:17Z cfischer $
#
# Auto-generated from advisory DSA 4300-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704300");
  script_version("$Revision: 11578 $");
  script_cve_id("CVE-2018-10860");
  script_name("Debian Security Advisory DSA 4300-1 (libarchive-zip-perl - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-25 07:40:17 +0200 (Tue, 25 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-22 00:00:00 +0200 (Sat, 22 Sep 2018)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4300.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"libarchive-zip-perl on Debian Linux");
  script_tag(name:"insight", value:"The Archive::Zip module allows a Perl program to create, manipulate,
read, and write Zip archive files.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1.59-1+deb9u1.

We recommend that you upgrade your libarchive-zip-perl packages.

For the detailed security status of libarchive-zip-perl please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/libarchive-zip-perl");
  script_tag(name:"summary",  value:"It was discovered that Archive::Zip, a perl module for manipulation of
ZIP archives, is prone to a directory traversal vulnerability. An
attacker able to provide a specially crafted archive for processing can
take advantage of this flaw to overwrite arbitrary files during archive
extraction.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libarchive-zip-perl", ver:"1.59-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1600.nasl 12601 2018-11-30 14:21:53Z mmartin $
#
# Auto-generated from advisory DLA 1600-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891600");
  script_version("$Revision: 12601 $");
  script_cve_id("CVE-2015-8915", "CVE-2016-10209", "CVE-2016-10349", "CVE-2016-10350", "CVE-2016-8687",
                "CVE-2016-8688", "CVE-2016-8689", "CVE-2017-14166", "CVE-2017-14501", "CVE-2017-14502",
                "CVE-2017-14503", "CVE-2017-5601");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1600-1] libarchive security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-30 15:21:53 +0100 (Fri, 30 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-30 00:00:00 +0100 (Fri, 30 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00037.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"libarchive on Debian Linux");
  script_tag(name:"insight", value:"The libarchive library provides a flexible interface for reading and
writing streaming archive files such as tar and cpio.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
3.1.2-11+deb8u4.

We recommend that you upgrade your libarchive packages.");
  script_tag(name:"summary",  value:"Multiple security vulnerabilities were found in libarchive, a
multi-format archive and compression library. Heap-based buffer
over-reads, NULL pointer dereferences and out-of-bounds reads allow
remote attackers to cause a denial-of-service (application crash) via
specially crafted archive files.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"bsdcpio", ver:"3.1.2-11+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"bsdtar", ver:"3.1.2-11+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libarchive-dev", ver:"3.1.2-11+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libarchive13", ver:"3.1.2-11+deb8u4", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1505.nasl 11419 2018-09-17 06:11:05Z cfischer $
#
# Auto-generated from advisory DLA 1505-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891505");
  script_version("$Revision: 11419 $");
  script_cve_id("CVE-2018-1000637");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1505-1] zutils security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 08:11:05 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-17 00:00:00 +0200 (Mon, 17 Sep 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/09/msg00016.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"zutils on Debian Linux");
  script_tag(name:"insight", value:"Zutils is a collection of utilities for dealing with any combination of
compressed and non-compressed files transparently. Currently the supported
compressors are gzip, bzip2, lzip, and xz.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in
version 1.3-4+deb8u1.

We recommend that you upgrade your zutils packages.");
  script_tag(name:"summary",  value:"zutils version prior to version 1.8-pre2 contains a buffer
overflow vulnerability in zcat which happened with some
input files when the '-v, --show-nonprinting' option was
used (or indirectly enabled). This can result in potential
denial of service or arbitrary code execution. This attack
appear is exploitable via the victim opening a crafted
compressed file and has been fixed in 1.8-pre2.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"zutils", ver:"1.3-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"zutils-dbg", ver:"1.3-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

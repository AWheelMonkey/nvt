###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1420.nasl 11281 2018-09-07 09:10:30Z cfischer $
#
# Auto-generated from advisory DLA 1420-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891420");
  script_version("$Revision: 11281 $");
  script_cve_id("CVE-2018-13054");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1420-1] cinnamon security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-07 11:10:30 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-07-16 00:00:00 +0200 (Mon, 16 Jul 2018)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00011.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"cinnamon on Debian Linux");
  script_tag(name:"insight", value:"Cinnamon is a desktop environment which provides advanced innovative
features and a traditional user experience.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in cinnamon version
2.2.16-5+deb8u1.

We recommend that you upgrade your cinnamon packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a symlink attack in the Cinnamon
desktop environment.

An attacker could overwrite an arbitrary file on the filesystem via
a $HOME/.face icon file (as the cinnamon-settings-users.py GUI runs
as root).");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"cinnamon", ver:"2.2.16-5+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cinnamon-common", ver:"2.2.16-5+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"cinnamon-dbg", ver:"2.2.16-5+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

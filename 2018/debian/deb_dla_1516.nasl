###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1516.nasl 12193 2018-11-02 03:47:13Z ckuersteiner $
#
# Auto-generated from advisory DLA 1516-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891516");
  script_version("$Revision: 12193 $");
  script_cve_id("CVE-2018-1000801");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1516-1] okular security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-02 04:47:13 +0100 (Fri, 02 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-09-24 00:00:00 +0200 (Mon, 24 Sep 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/09/msg00027.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"okular on Debian Linux");
  script_tag(name:"insight", value:"Okular is a universal document viewer with support for advanced document
features, such as annotations, forms, and embedded files.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
4:4.14.2-2+deb8u1.

We recommend that you upgrade your okular packages.");
  script_tag(name:"summary",  value:"Joran Herve discovered that the Okular document viewer was susceptible
to directory traversal via malformed .okular files (annotated document
archives), which could result in the creation of arbitrary files.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libokularcore5", ver:"4:4.14.2-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"okular", ver:"4:4.14.2-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"okular-dbg", ver:"4:4.14.2-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"okular-dev", ver:"4:4.14.2-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"okular-extra-backends", ver:"4:4.14.2-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

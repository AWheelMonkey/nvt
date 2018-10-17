###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_927.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 927-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.890927");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-5661");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 927-1] fop security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-01-17 00:00:00 +0100 (Wed, 17 Jan 2018)");
  script_tag(name:"cvss_base", value:"7.9");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:N/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/04/msg00046.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"fop on Debian Linux");
  script_tag(name:"insight", value:"FOP is a Java application that reads a formatting object tree and then
turns it into a wide variety of output presentations (including AFP,
PCL, PDF, PNG, PostScript, RTF, TIFF, and plain text), or displays
the result on-screen.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1:1.0.dfsg2-6+deb7u1.

We recommend that you upgrade your fop packages.");
  script_tag(name:"summary",  value:"In Apache FOP before 2.2, files lying on the filesystem of the server
which uses FOP can be revealed to arbitrary users who send maliciously
formed SVG files. The file types that can be shown depend on the user
context in which the exploitable application is running. If the user is
root a full compromise of the server - including confidential or
sensitive files - would be possible. XXE can also be used to attack the
availability of the server via denial of service as the references
within a xml document can trivially trigger an amplification attack.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"fop", ver:"1:1.0.dfsg2-6+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"fop-doc", ver:"1:1.0.dfsg2-6+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfop-java", ver:"1:1.0.dfsg2-6+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

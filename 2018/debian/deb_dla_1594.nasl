###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1594.nasl 12522 2018-11-26 07:41:25Z cfischer $
#
# Auto-generated from advisory DLA 1594-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891594");
  script_version("$Revision: 12522 $");
  # TODO: No CVE assigned yet
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1594-1] xml-security-c security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-26 08:41:25 +0100 (Mon, 26 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-26 00:00:00 +0100 (Mon, 26 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00030.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"xml-security-c on Debian Linux");
  script_tag(name:"insight", value:"XML-Security-C is a library for the XML Digital Security specification.
It provides processing and handling of XML Key Management Specifications
(XKMS) messages.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
1.7.2-3+deb8u2.

We recommend that you upgrade your xml-security-c packages.");
  script_tag(name:"summary",  value:"A vulnerability in xml-security-c, a library for the XML Digital Security specification,
has been found. Different KeyInfo combinations, like signatures without public key, result in incomplete DSA structures that
crash openssl during verification.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libxml-security-c-dev", ver:"1.7.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxml-security-c17", ver:"1.7.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xml-security-c-utils", ver:"1.7.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

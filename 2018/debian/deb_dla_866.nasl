###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_866.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 866-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.890866");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-5029");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 866-1] libxslt security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-01-12 00:00:00 +0100 (Fri, 12 Jan 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/03/msg00023.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"libxslt on Debian Linux");
  script_tag(name:"insight", value:"XSLT is an XML language for defining transformations of XML files from XML
to some other arbitrary format, such as XML, HTML, plain text, etc. using
standard XSLT stylesheets. libxslt is a C library which implements XSLT
version 1.0.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', this problem has been fixed in version
1.1.26-14.1+deb7u3.

We recommend that you upgrade your libxslt packages.");
  script_tag(name:"summary",  value:"libxslt is vulnerable to an integer overflow in the xsltAddTextString
function that can be exploited to trigger an out of bounds write on 64-bit
systems.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libxslt1-dbg", ver:"1.1.26-14.1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxslt1-dev", ver:"1.1.26-14.1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libxslt1.1", ver:"1.1.26-14.1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxslt1", ver:"1.1.26-14.1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-libxslt1-dbg", ver:"1.1.26-14.1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xsltproc", ver:"1.1.26-14.1+deb7u3", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4129.nasl 9041 2018-03-07 11:55:11Z cfischer $
#
# Auto-generated from advisory DSA 4129-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704129");
  script_version("$Revision: 9041 $");
  script_cve_id("CVE-2018-7435", "CVE-2018-7436", "CVE-2018-7437", "CVE-2018-7438", "CVE-2018-7439");
  script_name("Debian Security Advisory DSA 4129-1 (freexl - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-03-07 12:55:11 +0100 (Wed, 07 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-02 00:00:00 +0100 (Fri, 02 Mar 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4129.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"freexl on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 1.0.0g-1+deb8u5.

For the stable distribution (stretch), these problems have been fixed in
version 1.0.2-2+deb9u2.

We recommend that you upgrade your freexl packages.

For the detailed security status of freexl please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/freexl");
  script_tag(name:"summary",  value:"Multiple heap buffer over reads were discovered in freexl, a library to
read Microsoft Excel spreadsheets, which could result in denial of
service.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libfreexl-dev", ver:"1.0.0g-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfreexl1", ver:"1.0.0g-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfreexl1-dbg", ver:"1.0.0g-1+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfreexl-dev", ver:"1.0.2-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfreexl1", ver:"1.0.2-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libfreexl1-dbg", ver:"1.0.2-2+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

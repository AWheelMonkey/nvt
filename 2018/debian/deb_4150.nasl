###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4150.nasl 12308 2018-11-12 03:41:06Z ckuersteiner $
#
# Auto-generated from advisory DSA 4150-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704150");
  script_version("$Revision: 12308 $");
  script_cve_id("CVE-2017-15422");
  script_name("Debian Security Advisory DSA 4150-1 (icu - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-12 04:41:06 +0100 (Mon, 12 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-03-23 00:00:00 +0100 (Fri, 23 Mar 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4150.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"icu on Debian Linux");
  script_tag(name:"insight", value:"ICU is a C++ and C library that provides robust and full-featured
Unicode and locale support.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 52.1-8+deb8u7.

For the stable distribution (stretch), this problem has been fixed in
version 57.1-6+deb9u2.

We recommend that you upgrade your icu packages.

For the detailed security status of icu please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/icu");
  script_tag(name:"summary",  value:"It was discovered that an integer overflow in the International
Components for Unicode (ICU) library could result in denial of service
and potentially the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icu-devtools", ver:"52.1-8+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icu-doc", ver:"52.1-8+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicu-dev", ver:"52.1-8+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicu52", ver:"52.1-8+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicu52-dbg", ver:"52.1-8+deb8u7", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icu-devtools", ver:"57.1-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icu-devtools-dbg", ver:"57.1-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"icu-doc", ver:"57.1-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicu-dev", ver:"57.1-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicu57", ver:"57.1-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libicu57-dbg", ver:"57.1-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

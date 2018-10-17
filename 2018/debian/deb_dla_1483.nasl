###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1483.nasl 11184 2018-09-03 09:04:45Z cfischer $
#
# Auto-generated from advisory DLA 1483-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891483");
  script_version("$Revision: 11184 $");
  script_cve_id("CVE-2018-10871", "CVE-2018-10935");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1483-1] 389-ds-base security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-03 11:04:45 +0200 (Mon, 03 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-03 00:00:00 +0200 (Mon, 03 Sep 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/08/msg00032.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"389-ds-base on Debian Linux");
  script_tag(name:"insight", value:"Based on the Lightweight Directory Access Protocol (LDAP), the 389
Directory Server is designed to manage large directories of users and
resources robustly and scalably.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
1.3.3.5-4+deb8u2.

We recommend that you upgrade your 389-ds-base packages.");
  script_tag(name:"summary",  value:"CVE-2018-10871

By default nsslapd-unhashed-pw-switch was set to 'on'. So a copy of
the unhashed password was kept in modifiers and was possibly logged in
changelog and retroCL.

Unless it is used by some plugin it does not require to keep unhashed
passwords. The nsslapd-unhashed-pw-switch option is now 'off' by
default.

CVE-2018-10935

It was discovered that any authenticated user doing a search using
ldapsearch with extended controls for server side sorting could bring
down the LDAP server itself.

The fix is to check if we are able to index the provided value. If we
are not, then slapd_qsort returns an error (LDAP_OPERATION_ERROR) .");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"389-ds", ver:"1.3.3.5-4+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base", ver:"1.3.3.5-4+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-dbg", ver:"1.3.3.5-4+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-dev", ver:"1.3.3.5-4+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-libs", ver:"1.3.3.5-4+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-libs-dbg", ver:"1.3.3.5-4+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

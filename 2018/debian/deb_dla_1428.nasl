###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1428.nasl 10868 2018-08-10 05:36:57Z ckuersteiner $
#
# Auto-generated from advisory DLA 1428-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891428");
  script_version("$Revision: 10868 $");
  script_cve_id("CVE-2015-1854", "CVE-2017-15134", "CVE-2018-1054", "CVE-2018-10850", "CVE-2018-1089");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1428-1] 389-ds-base security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 07:36:57 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-16 00:00:00 +0200 (Mon, 16 Jul 2018)");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00018.html");

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
1.3.3.5-4+deb8u1.

We recommend that you upgrade your 389-ds-base packages.");
  script_tag(name:"summary",  value:"CVE-2015-1854
A flaw was found while doing authorization of modrdn operations.
An unauthenticated attacker able to issue an ldapmodrdn call to
the directory server could perform unauthorized modifications
of entries in the directory server.

CVE-2017-15134
Improper handling of a search filter in slapi_filter_sprintf()
in slapd/util.c can lead to remote server crash and denial
of service.

CVE-2018-1054
When read access on <attribute_name> is enabled, a flaw in
SetUnicodeStringFromUTF_8 function in collate.c, can lead to
out-of-bounds memory operations.
This might result in a server crash, caused by unauthorized
users.

CVE-2018-1089
Any user (anonymous or authenticated) can crash ns-slapd with a
crafted ldapsearch query with very long filter value.

CVE-2018-10850
Due to a race condition the server could crash in turbo mode
(because of high traffic) or when a worker reads several requests
in the read buffer (more_data). Thus an anonymous attacker could
trigger a denial of service.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"389-ds", ver:"1.3.3.5-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base", ver:"1.3.3.5-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-dbg", ver:"1.3.3.5-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-dev", ver:"1.3.3.5-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-libs", ver:"1.3.3.5-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"389-ds-base-libs-dbg", ver:"1.3.3.5-4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

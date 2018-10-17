###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1462.nasl 10907 2018-08-10 14:55:29Z emoss $
#
# Auto-generated from advisory DLA 1462-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891462");
  script_version("$Revision: 10907 $");
  script_cve_id("CVE-2018-14526");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1462-1] wpa security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 16:55:29 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-10 00:00:00 +0200 (Fri, 10 Aug 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/08/msg00009.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"wpa on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
2.3-1+deb8u6.

We recommend that you upgrade your wpa packages.");
  script_tag(name:"summary",  value:"The following vulnerability was discovered in wpa_supplicant.

CVE-2018-14526:
An issue was discovered in rsn_supp/wpa.c in wpa_supplicant 2.0
through 2.6. Under certain conditions, the integrity of EAPOL-Key
messages is not checked, leading to a decryption oracle. An attacker
within range of the Access Point and client can abuse the
vulnerability to recover sensitive information.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";

if ((res = isdpkgvuln(pkg:"hostapd", ver:"2.3-1+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wpagui", ver:"2.3-1+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wpasupplicant", ver:"2.3-1+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

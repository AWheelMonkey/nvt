###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1525.nasl 11716 2018-10-02 03:28:37Z ckuersteiner $
#
# Auto-generated from advisory DLA 1525-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891525");
  script_version("$Revision: 11716 $");
  script_cve_id("CVE-2017-7653", "CVE-2017-7654", "CVE-2017-9868");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1525-1] mosquitto security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-02 05:28:37 +0200 (Tue, 02 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-01 00:00:00 +0200 (Mon, 01 Oct 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/09/msg00036.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"mosquitto on Debian Linux");
  script_tag(name:"insight", value:"This is a message broker that supports version 3.1 and 3.1.1 of the MQTT
protocol.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
1.3.4-2+deb8u3.

We recommend that you upgrade your mosquitto packages.");
  script_tag(name:"summary",  value:"CVE-2017-7653

As invalid UTF-8 strings are not correctly checked, an attacker could
cause a denial of service to other clients by disconnecting
them from the broker with special crafted topics.

CVE-2017-7654

Due to a memory leak unauthenticated clients can send special crafted
CONNECT packets which could cause a denial of service in the broker.

CVE-2017-9868

Due to wrong file permissions local users could obtain topic
information from the mosquitto database.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmosquitto-dev", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmosquitto1", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmosquittopp-dev", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmosquittopp1", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mosquitto", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mosquitto-clients", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mosquitto-dbg", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python-mosquitto", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"python3-mosquitto", ver:"1.3.4-2+deb8u3", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1596.nasl 12799 2018-12-14 07:38:54Z ckuersteiner $
#
# Auto-generated from advisory DLA 1596-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891596");
  script_version("$Revision: 12799 $");
  script_cve_id("CVE-2018-19132");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1596-1] squid3 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-14 08:38:54 +0100 (Fri, 14 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-26 00:00:00 +0100 (Mon, 26 Nov 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00032.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"squid3 on Debian Linux");
  script_tag(name:"insight", value:"Squid is a high-performance proxy caching server for web clients, supporting
FTP, gopher, ICY and HTTP data objects.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
3.4.8-6+deb8u6.

We recommend that you upgrade your squid3 packages.");
  script_tag(name:"summary",  value:"It was discovered that there can be a denial of service (DoS)
vulnerability in squid3 due to a memory leak in SNMP query rejection
code when SNMP is enabled. In environments where per-process memory
restrictions are not enforced strictly, a remote attacker to consume
all memory available to the Squid process, causing it to crash.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"squid-cgi", ver:"3.4.8-6+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid-purge", ver:"3.4.8-6+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3", ver:"3.4.8-6+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-common", ver:"3.4.8-6+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squid3-dbg", ver:"3.4.8-6+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"squidclient", ver:"3.4.8-6+deb8u6", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

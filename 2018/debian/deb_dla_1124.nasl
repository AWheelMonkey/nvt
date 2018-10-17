###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1124.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1124-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891124");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-14491", "CVE-2017-14492", "CVE-2017-14494");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1124-1] dnsmasq security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-02-07 00:00:00 +0100 (Wed, 07 Feb 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/10/msg00004.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"dnsmasq on Debian Linux");
  script_tag(name:"insight", value:"Dnsmasq is a lightweight, easy to configure, DNS forwarder and DHCP
server. It is designed to provide DNS and optionally, DHCP, to a
small network. It can serve the names of local machines which are
not in the global DNS. The DHCP server integrates with the DNS
server and allows machines with DHCP-allocated addresses
to appear in the DNS with names configured either in each host or
in a central configuration file. Dnsmasq supports static and dynamic
DHCP leases and BOOTP/TFTP for network booting of diskless machines.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
2.62-3+deb7u4.

We recommend that you upgrade your dnsmasq packages.");
  script_tag(name:"summary",  value:"Felix Wilhelm, Fermin J. Serna, Gabriel Campana, Kevin Hamacher, Ron
Bowes and Gynvael Coldwind of the Google Security Team discovered
several vulnerabilities in dnsmasq, a small caching DNS proxy and
DHCP/TFTP server, which may result in denial of service, information
leak or the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"dnsmasq", ver:"2.62-3+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dnsmasq-base", ver:"2.62-3+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dnsmasq-utils", ver:"2.62-3+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

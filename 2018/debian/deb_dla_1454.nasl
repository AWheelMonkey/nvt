###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1454.nasl 11768 2018-10-05 14:07:38Z cfischer $
#
# Auto-generated from advisory DLA 1454-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891454");
  script_version("$Revision: 11768 $");
  script_cve_id("CVE-2018-10900");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1454-1] network-manager-vpnc security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-05 16:07:38 +0200 (Fri, 05 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-07-31 00:00:00 +0200 (Tue, 31 Jul 2018)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00048.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"network-manager-vpnc on Debian Linux");
  script_tag(name:"insight", value:"NetworkManager is a system network service that manages your network devices
and connections, attempting to keep active network connectivity when
available. It manages ethernet, WiFi, mobile broadband (WWAN), and PPPoE
devices, and provides VPN integration with a variety of different VPN
services.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
0.9.10.0-1+deb8u1.

We recommend that you upgrade your network-manager-vpnc packages.");
  script_tag(name:"summary",  value:"Denis Andzakovic discovered that network-manager-vpnc, a plugin to
provide VPNC support for NetworkManager, is prone to a privilege
escalation vulnerability. A newline character can be used to inject a
Password helper parameter into the configuration data passed to vpnc,
allowing a local user with privileges to modify a system connection to
execute arbitrary commands as root.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"network-manager-vpnc", ver:"0.9.10.0-1+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"network-manager-vpnc-gnome", ver:"0.9.10.0-1+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

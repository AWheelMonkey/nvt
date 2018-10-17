###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4282.nasl 11184 2018-09-03 09:04:45Z cfischer $
#
# Auto-generated from advisory DSA 4282-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704282");
  script_version("$Revision: 11184 $");
  script_cve_id("CVE-2018-1318", "CVE-2018-8004", "CVE-2018-8005", "CVE-2018-8040");
  script_name("Debian Security Advisory DSA 4282-1 (trafficserver - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-03 11:04:45 +0200 (Mon, 03 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-31 00:00:00 +0200 (Fri, 31 Aug 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4282.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"trafficserver on Debian Linux");
  script_tag(name:"insight", value:"This package provides the Apache Traffic Server. A fast, scalable reverse
proxy server which may operate as forward proxy as well. Apache Traffic Server
supports:");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 7.0.0-6+deb9u2.

We recommend that you upgrade your trafficserver packages.

For the detailed security status of trafficserver please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/trafficserver");
  script_tag(name:"summary",  value:"Several vulnerabilities were discovered in Apache Traffic Server, a
reverse and forward proxy server, which could result in denial of
service, cache poisoning or information disclosure.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"trafficserver", ver:"7.0.0-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"trafficserver-dev", ver:"7.0.0-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"trafficserver-experimental-plugins", ver:"7.0.0-6+deb9u2", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

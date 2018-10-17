###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4211.nasl 10262 2018-06-20 02:57:24Z ckuersteiner $
#
# Auto-generated from advisory DSA 4211-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704211");
  script_version("$Revision: 10262 $");
  script_cve_id("CVE-2017-18266");
  script_name("Debian Security Advisory DSA 4211-1 (xdg-utils - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-20 04:57:24 +0200 (Wed, 20 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-05-25 00:00:00 +0200 (Fri, 25 May 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4211.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"xdg-utils on Debian Linux");
  script_tag(name:"insight", value:"xdg-utils contains utilities for integrating applications with the
desktop environment, regardless of which desktop environment is used.
They are part of freedesktop.org's Portland project.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.1.0~rc1+git20111210-7.4+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 1.1.1-1+deb9u1.

We recommend that you upgrade your xdg-utils packages.

For the detailed security status of xdg-utils please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/xdg-utils");
  script_tag(name:"summary",  value:"Gabriel Corona discovered that xdg-utils, a set of tools for desktop
environment integration, is vulnerable to argument injection attacks. If
the environment variable BROWSER in the victim host has a '%s' and the
victim opens a link crafted by an attacker with xdg-open, the malicious
party could manipulate the parameters used by the browser when opened.
This manipulation could set, for example, a proxy to which the network
traffic could be intercepted for that particular execution.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"xdg-utils", ver:"1.1.1-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"xdg-utils", ver:"1.1.0~rc1+git20111210-7.4+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

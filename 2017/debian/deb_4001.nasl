###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4001.nasl 7604 2017-11-01 06:48:12Z asteins $
#
# Auto-generated from advisory DSA 4001-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704001");
  script_version("$Revision: 7604 $");
  script_cve_id("CVE-2017-14339");
  script_name("Debian Security Advisory DSA 4001-1 (yadifa - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-11-01 07:48:12 +0100 (Wed, 01 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-10-19 00:00:00 +0200 (Thu, 19 Oct 2017)");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-4001.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"yadifa on Debian Linux");
  script_tag(name:"insight", value:"YADIFA is a lightweight authoritative Name Server with DNSSEC capabilities.
Developed by the passionate people behind the .eu top-level domain, YADIFA
has been built from scratch to face today's DNS challenges, with no
compromise on security, speed and stability, to offer a better and safer
Internet experience. YADIFA has a simple configuration syntax and can handle
more queries per second while maintaining one of the lowest memory footprints
in the industry. YADIFA also has one of the fastest zone file load times
ever recorded on a name server.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 2.2.3-1+deb9u1.

We recommend that you upgrade your yadifa packages.");
  script_tag(name:"summary",  value:"It was discovered that YADIFA, an authoritative DNS server, did not
sufficiently check its input. This allowed a remote attacker to cause
a denial-of-service by forcing the daemon to enter an infinite loop.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libyadifa-dev", ver:"2.2.3-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"yadifa", ver:"2.2.3-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

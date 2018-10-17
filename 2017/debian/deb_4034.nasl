###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4034.nasl 8018 2017-12-07 07:32:50Z teissa $
#
# Auto-generated from advisory DSA 4034-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704034");
  script_version("$Revision: 8018 $");
  script_cve_id("CVE-2017-8807");
  script_name("Debian Security Advisory DSA 4034-1 (varnish - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-12-07 08:32:50 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-11-15 00:00:00 +0100 (Wed, 15 Nov 2017)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4034.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"varnish on Debian Linux");
  script_tag(name:"insight", value:"Varnish Cache is a state of the art web accelerator written with
performance and flexibility in mind.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 5.0.0-7+deb9u2.

We recommend that you upgrade your varnish packages.");
  script_tag(name:"summary",  value:"'shamger' and Carlo Cannas discovered that a programming error in
Varnish, a state of the art, high-performance web accelerator, may
result in disclosure of memory contents or denial of service.

See https://varnish-cache.org/security/VSV00002.html 
for details.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libvarnishapi-dev", ver:"5.0.0-7+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libvarnishapi1", ver:"5.0.0-7+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"varnish", ver:"5.0.0-7+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"varnish-doc", ver:"5.0.0-7+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3931.nasl 7435 2017-10-13 13:45:29Z asteins $
#
# Auto-generated from advisory DSA 3931-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.703931");
  script_version("$Revision: 7435 $");
  script_cve_id("CVE-2017-11173");
  script_name("Debian Security Advisory DSA 3931-1 (ruby-rack-cors - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-10-13 15:45:29 +0200 (Fri, 13 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-08-10 00:00:00 +0200 (Thu, 10 Aug 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3931.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"ruby-rack-cors on Debian Linux");
  script_tag(name:"insight", value:"Middleware that will make Rack-based apps CORS compatible.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 0.4.0-1+deb9u1.

We recommend that you upgrade your ruby-rack-cors packages.");
  script_tag(name:"summary",  value:"Jens Mueller discovered that an incorrect regular expression in rack-cors
may lead to insufficient restriction of CORS requests.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ruby-rack-cors", ver:"0.4.0-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

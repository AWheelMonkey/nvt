###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4283.nasl 11228 2018-09-05 02:44:21Z ckuersteiner $
#
# Auto-generated from advisory DSA 4283-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704283");
  script_version("$Revision: 11228 $");
  script_cve_id("CVE-2018-1000539");
  script_name("Debian Security Advisory DSA 4283-1 (ruby-json-jwt - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 04:44:21 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-31 00:00:00 +0200 (Fri, 31 Aug 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4283.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"ruby-json-jwt on Debian Linux");
  script_tag(name:"insight", value:"JSON Web Token and its family (JSON Web Signature, JSON Web
Encryption and JSON Web Key) in Ruby");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1.6.2-1+deb9u1.

We recommend that you upgrade your ruby-json-jwt packages.

For the detailed security status of ruby-json-jwt please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/ruby-json-jwt");
  script_tag(name:"summary",  value:"It was discovered that ruby-json-jwt, a Ruby implementation of JSON web
tokens performed insufficient validation of GCM auth tags.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ruby-json-jwt", ver:"1.6.2-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

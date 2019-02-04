###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1585.nasl 12471 2018-11-21 14:52:40Z cfischer $
#
# Auto-generated from advisory DLA 1585-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891585");
  script_version("$Revision: 12471 $");
  script_cve_id("CVE-2018-16471");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1585-1] ruby-rack security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 15:52:40 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-21 00:00:00 +0100 (Wed, 21 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00022.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"ruby-rack on Debian Linux");
  script_tag(name:"insight", value:"Rack provides a minimal, modular and adaptable interface for
developing web applications in Ruby. By wrapping HTTP requests and
responses in the simplest way possible, it unifies and distills the
API for web servers, web frameworks, and software in between (the
so-called middleware) into a single method call.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in ruby-rack version
1.5.2-3+deb8u2.

We recommend that you upgrade your ruby-rack packages.");
  script_tag(name:"summary",  value:"It was discovered that there was an XSS vulnerability in the ruby-rack
web-server library.

A malicious request could impact the HTTP/HTTPS scheme being returned
to the underlying application.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ruby-rack", ver:"1.5.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

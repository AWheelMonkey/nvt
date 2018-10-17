###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1337.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1337-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891337");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2018-1000075", "CVE-2018-1000076", "CVE-2018-1000077", "CVE-2018-1000078");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1337-1] jruby security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-04-03 00:00:00 +0200 (Tue, 03 Apr 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/04/msg00001.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"jruby on Debian Linux");
  script_tag(name:"insight", value:"JRuby is a 100% pure-Java implementation of the Ruby programming language.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.5.6-5+deb7u1.

We recommend that you upgrade your jruby packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities were found in the rubygems package management
framework, embedded in JRuby, a pure-Java implementation of the Ruby
programming language.

CVE-2018-1000075

A negative size vulnerability in ruby gem package tar header that could
cause an infinite loop.

CVE-2018-1000076

Ruby gems package improperly verifies cryptographic signatures. A mis-signed
gem could be installed if the tarball contains multiple gem signatures.

CVE-2018-1000077

An improper input validation vulnerability in ruby gems specification
homepage attribute could allow malicious gem to set an invalid homepage
URL.

CVE-2018-1000078

Cross Site Scripting (XSS) vulnerability in gem server display of homepage
attribute");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"jruby", ver:"1.5.6-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1584.nasl 12832 2018-12-19 07:49:53Z asteins $
#
# Auto-generated from advisory DLA 1584-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891584");
  script_version("$Revision: 12832 $");
  script_cve_id("CVE-2014-10077");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1584-1] ruby-i18n security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-12-19 08:49:53 +0100 (Wed, 19 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-11-21 00:00:00 +0100 (Wed, 21 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00021.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"ruby-i18n on Debian Linux");
  script_tag(name:"insight", value:"Implementation of the Ruby on Rails I18n core API. This is the same I18n
library included in the Ruby on Rails framework, but provided outside of
that framework for those who wish to use it without pulling the entire
Ruby on Rails framework.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in ruby-i18n version
0.6.9-2+deb8u1.

We recommend that you upgrade your ruby-i18n packages.");
  script_tag(name:"summary",  value:"It was discovered that there was a remote denial-of-service vulnerability
in ruby-i18n, a I18n and localization solution for Ruby.

An application crash could be engineering a situation where `:some_key` is
present in the `keep_keys` structure but not present in the hash.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ruby-i18n", ver:"0.6.9-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

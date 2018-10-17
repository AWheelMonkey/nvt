###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_886.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 886-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.890886");
  script_version("$Revision: 10474 $");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 886-1] tzdata new upstream version)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-01-17 00:00:00 +0100 (Wed, 17 Jan 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/04/msg00005.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"tzdata on Debian Linux");
  script_tag(name:"insight", value:"This package contains data required for the implementation of
standard local time for many representative locations around the
globe. It is updated periodically to reflect changes made by
political bodies to time zone boundaries, UTC offsets, and
daylight-saving rules.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
2017b-0+deb7u1.

We recommend that you upgrade your tzdata packages.");
  script_tag(name:"summary",  value:"This update includes the changes in tzdata 2017b. Notable
changes are:
- Haiti resumed observance of DST in 2017.

  This NVT has been deprecated as it doesn't have any security relevance.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"tzdata", ver:"2017b-0+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tzdata-java", ver:"2017b-0+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

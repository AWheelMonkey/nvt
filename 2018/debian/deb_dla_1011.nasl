###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1011.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1011-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891011");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-1000367", "CVE-2017-1000368");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1011-1] sudo security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-02-05 00:00:00 +0100 (Mon, 05 Feb 2018)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/07/msg00004.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"sudo on Debian Linux");
  script_tag(name:"insight", value:"Sudo is a program designed to allow a sysadmin to give limited root
privileges to users and log root activity. The basic philosophy is to give
as few privileges as possible but still allow people to get their work done.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.8.5p2-1+nmu3+deb7u4.

We recommend that you upgrade your sudo packages.");
  script_tag(name:"summary",  value:"Todd Miller's sudo version 1.8.20p1 and earlier is vulnerable to an
input validation (embedded newlines) in the get_process_ttyname()
function resulting in information disclosure and command execution.

The previous announcement (DLA-970-1) was about a similar security
issue (CVE-2017-1000367) which wasn't completely fixed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"sudo", ver:"1.8.5p2-1+nmu3+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"sudo-ldap", ver:"1.8.5p2-1+nmu3+deb7u4", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

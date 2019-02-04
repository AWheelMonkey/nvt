###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1640.nasl 13279 2019-01-25 06:49:55Z cfischer $
#
# Auto-generated from advisory DLA 1640-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.891640");
  script_version("$Revision: 13279 $");
  script_cve_id("CVE-2019-3461");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1640-1] tmpreaper security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-25 07:49:55 +0100 (Fri, 25 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-25 00:00:00 +0100 (Fri, 25 Jan 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/01/msg00017.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"tmpreaper on Debian Linux");
  script_tag(name:"insight", value:"This package provides a program that can be used to clean out temporary-file
directories. It recursively searches the directory, refusing to chdir()
across symlinks, and removes files that haven't been accessed in a
user-specified amount of time. You can specify a set of files to protect
from deletion with a shell pattern. It will not remove files owned by the
process EUID that have the `w' bit clear, unless you ask it to, much like
`rm -f'. `tmpreaper' will not remove symlinks, sockets, fifos, or special
files unless given a command line option enabling it to.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
1.6.13+nmu1+deb8u1.

We recommend that you upgrade your tmpreaper packages.");
  script_tag(name:"summary", value:"It was discovered that tmpreaper, a program that cleans up files in
directories based on their age, is vulnerable to a race condition. This
vulnerability might be exploited by local attackers to perform privilege
escalation.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"tmpreaper", ver:"1.6.13+nmu1+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

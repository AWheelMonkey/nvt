###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4333.nasl 12222 2018-11-06 07:21:42Z cfischer $
#
# Auto-generated from advisory DSA 4333-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704333");
  script_version("$Revision: 12222 $");
  script_cve_id("CVE-2018-18820");
  script_name("Debian Security Advisory DSA 4333-1 (icecast2 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-06 08:21:42 +0100 (Tue, 06 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-04 00:00:00 +0100 (Sun, 04 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4333.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"icecast2 on Debian Linux");
  script_tag(name:"insight", value:"Icecast is a versatile multimedia streaming server which can create
(for instance) a private jukebox or 'Internet radio station'. It
supports Ogg streaming using the Vorbis and Theora codecs, as well as
other formats such as MP3, AAC, or NSV, and is compatible with most
media players.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 2.4.2-1+deb9u1.

We recommend that you upgrade your icecast2 packages.

For the detailed security status of icecast2 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/icecast2");
  script_tag(name:"summary",  value:"Nick Rolfe discovered multiple buffer overflows in the Icecast multimedia
streaming server which could result in the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icecast2", ver:"2.4.2-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

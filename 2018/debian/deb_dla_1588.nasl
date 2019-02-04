###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1588.nasl 13316 2019-01-28 07:41:51Z asteins $
#
# Auto-generated from advisory DLA 1588-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891588");
  script_version("$Revision: 13316 $");
  script_cve_id("CVE-2018-18820");
  script_name("Debian LTS Advisory ([SECURITY] [DLA-1588-1] icecast2 security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-28 08:41:51 +0100 (Mon, 28 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-26 00:00:00 +0100 (Mon, 26 Nov 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00033.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"icecast2 on Debian Linux");
  script_tag(name:"insight", value:"Icecast is a versatile multimedia streaming server which can create
(for instance) a private jukebox or 'Internet radio station'. It
supports Ogg streaming using the Vorbis and Theora codecs, as well as
other formats such as MP3, AAC, or NSV, and is compatible with most
media players.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
2.4.0-1.1+deb8u2.

We recommend that you upgrade your icecast2 packages.");
  script_tag(name:"summary",  value:"buffer overflow was discovered in the URL-authentication backend of
the icecast2, the popular open source streaming media server. If the
backend is enabled, then any malicious HTTP client can send a request
for specific resource including a crafted header which can overwrite
the server's stack contents, leading to denial of service and
potentially remote code execution.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icecast2", ver:"2.4.0-1.1+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

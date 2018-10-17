###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_917.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 917-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.890917");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2015-8270", "CVE-2015-8271", "CVE-2015-8272");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 917-1] rtmpdump security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-01-17 00:00:00 +0100 (Wed, 17 Jan 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/04/msg00036.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"rtmpdump on Debian Linux");
  script_tag(name:"insight", value:"A small dumper for media content streamed over the RTMP protocol (like BBC's
iPlayer high quality streams). Supplying an RTMP URL will result in a dumped
flv file, which can be played/transcoded with standard tools.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
2.4+20111222.git4e06e21-1+deb7u1.

We recommend that you upgrade your rtmpdump packages.");
  script_tag(name:"summary",  value:"Several vulnerabilities were found in rtmpdump and the librtmp
library.

CVE-2015-8270

A bug in AMF3ReadString in librtmp can cause a denial of service via
application crash to librtmp users that talk to a malicious server.

CVE-2015-8271

The AMF3_Decode function in librtmp doesn't properly validate its
input, which can lead to arbitrary code execution when talking
to a malicious attacker.

CVE-2015-8272

A bug in rtmpsrv can lead to a crash when talking to a malicious
client.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"librtmp-dev", ver:"2.4+20111222.git4e06e21-1+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librtmp0", ver:"2.4+20111222.git4e06e21-1+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"rtmpdump", ver:"2.4+20111222.git4e06e21-1+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

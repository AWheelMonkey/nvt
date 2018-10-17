###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1029.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1029-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891029");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2017-9831", "CVE-2017-9832");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1029-1] libmtp security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-02-08 00:00:00 +0100 (Thu, 08 Feb 2018)");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/07/msg00021.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"libmtp on Debian Linux");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.1.3-35-g0ece104-5+deb7u1.

We recommend that you upgrade your libmtp packages.");
  script_tag(name:"summary",  value:"libmtp, a library for communicating with MTP aware devices (like
cellular phones and audio players), was found to be vulnerable to
several integer overflow vulnerabilities, which allowed malicious
devices to cause denial of service crashes and maybe remote code
execution.

CVE-2017-9831

An integer overflow vulnerability in the
ptp_unpack_EOS_CustomFuncEx function of the ptp-pack.c file of
libmtp (version 1.1.12 and below) allows attackers to cause a
denial of service (out-of-bounds memory access) or maybe remote
code execution by inserting a mobile device into a personal
computer through a USB cable.

CVE-2017-9832

An integer overflow vulnerability in ptp-pack.c (ptp_unpack_OPL
function) of libmtp (version 1.1.12 and below) allows attackers to
cause a denial of service (out-of-bounds memory access) or maybe
remote code execution by inserting a mobile device into a personal
computer through a USB cable.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libmtp-common", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmtp-dbg", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmtp-dev", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmtp-doc", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmtp-runtime", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmtp9", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"mtp-tools", ver:"1.1.3-35-g0ece104-5+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

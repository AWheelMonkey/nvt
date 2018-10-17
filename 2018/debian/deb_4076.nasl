###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4076.nasl 8299 2018-01-05 11:11:22Z asteins $
#
# Auto-generated from advisory DSA 4076-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704076");
  script_version("$Revision: 8299 $");
  script_cve_id("CVE-2017-16671", "CVE-2017-16672", "CVE-2017-17090", "CVE-2017-17664");
  script_name("Debian Security Advisory DSA 4076-1 (asterisk - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-01-05 12:11:22 +0100 (Fri, 05 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-12-30 00:00:00 +0100 (Sat, 30 Dec 2017)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4076.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"asterisk on Debian Linux");
  script_tag(name:"insight", value:"Asterisk is an Open Source PBX and telephony toolkit. It is, in a
sense, middleware between Internet and telephony channels on the bottom,
and Internet and telephony applications at the top.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 1:11.13.1~dfsg-2+deb8u5.

For the stable distribution (stretch), these problems have been fixed in
version 1:13.14.1~dfsg-2+deb9u3.

We recommend that you upgrade your asterisk packages.

For the detailed security status of asterisk please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/asterisk");
  script_tag(name:"summary",  value:"Multiple vulnerabilities have been discovered in Asterisk, an open source
PBX and telephony toolkit, which may result in denial of service,
information disclosure and potentially the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"asterisk", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-config", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-dahdi", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-dbg", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-dev", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-doc", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-mobile", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-modules", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-mp3", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-mysql", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-ooh323", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-voicemail", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-voicemail-imapstorage", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-voicemail-odbcstorage", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-vpb", ver:"1:11.13.1~dfsg-2+deb8u5", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-config", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-dahdi", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-dev", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-doc", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-mobile", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-modules", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-mp3", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-mysql", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-ooh323", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-voicemail", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-voicemail-imapstorage", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-voicemail-odbcstorage", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"asterisk-vpb", ver:"1:13.14.1~dfsg-2+deb9u3", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

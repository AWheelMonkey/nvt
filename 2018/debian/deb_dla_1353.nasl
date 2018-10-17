###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1353.nasl 10474 2018-07-10 08:12:26Z cfischer $
#
# Auto-generated from advisory DLA 1353-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891353");
  script_version("$Revision: 10474 $");
  script_cve_id("CVE-2018-7322", "CVE-2018-7323", "CVE-2018-7324", "CVE-2018-7332", "CVE-2018-7334",
                "CVE-2018-7335", "CVE-2018-7336", "CVE-2018-7337", "CVE-2018-7417", "CVE-2018-7418",
                "CVE-2018-7419", "CVE-2018-7420");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1353-1] wireshark security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 10:12:26 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-04-19 00:00:00 +0200 (Thu, 19 Apr 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/04/msg00018.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"wireshark on Debian Linux");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.12.1+g01b65bf-4+deb8u6~deb7u10.

We recommend that you upgrade your wireshark packages.");
  script_tag(name:"insight", value:"Wireshark is a network 'sniffer' - a tool that captures
and analyzes packets off the wire. Wireshark can decode too many protocols to list here. ");
  script_tag(name:"summary",  value:"It was discovered that wireshark, a network protocol analyzer, contained
several vulnerabilities that could result in infinite loops in different
dissectors. Other issues are related to crash in dissectors that are caused by special crafted and malformed packets.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
# nb: libwireshark2, libwiretap2 and libwsutil2 having a lower version 1.8.2-5wheezy18, keep this in mind when overwriting this LSC
if ((res = isdpkgvuln(pkg:"libwireshark-data", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libwireshark-dev", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libwiretap-dev", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libwsutil-dev", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tshark", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wireshark", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wireshark-common", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wireshark-dbg", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wireshark-dev", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"wireshark-doc", ver:"1.12.1+g01b65bf-4+deb8u6~deb7u10", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

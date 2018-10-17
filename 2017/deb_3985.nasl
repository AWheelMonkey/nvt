###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_3985.nasl 7801 2017-11-17 07:10:11Z asteins $
#
# Auto-generated from advisory DSA 3985-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.703985");
  script_version("$Revision: 7801 $");
  script_cve_id("CVE-2017-5111", "CVE-2017-5112", "CVE-2017-5113", "CVE-2017-5114", "CVE-2017-5115", "CVE-2017-5116", "CVE-2017-5117", "CVE-2017-5118", "CVE-2017-5119", "CVE-2017-5120", "CVE-2017-5121", "CVE-2017-5122");
  script_name("Debian Security Advisory DSA 3985-1 (chromium-browser - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-11-17 08:10:11 +0100 (Fri, 17 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-09-28 00:00:00 +0200 (Thu, 28 Sep 2017)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://www.debian.org/security/2017/dsa-3985.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"chromium-browser on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 61.0.3163.100-1~deb9u1.

For the testing distribution (buster), these problems will be fixed soon.

For the unstable distribution (sid), these problems have been fixed in
version 61.0.3163.100-1.

We recommend that you upgrade your chromium-browser packages.");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in the chromium web browser.

CVE-2017-5111 
Luat Nguyen discovered a use-after-free issue in the pdfium library.

CVE-2017-5112 
Tobias Klein discovered a buffer overflow issue in the webgl
library.

CVE-2017-5113 
A buffer overflow issue was discovered in the skia library.

CVE-2017-5114 
Ke Liu discovered a memory issue in the pdfium library.

CVE-2017-5115 
Marco Giovannini discovered a type confusion issue in the v8
javascript library.

CVE-2017-5116 
Guang Gong discovered a type confusion issue in the v8 javascript
library.

CVE-2017-5117 
Tobias Klein discovered an uninitialized value in the skia library.

CVE-2017-5118 
WenXu Wu discovered a way to bypass the Content Security Policy.

CVE-2017-5119 
Another uninitialized value was discovered in the skia library.

CVE-2017-5120 
Xiaoyin Liu discovered a way downgrade HTTPS connections during
redirection.

CVE-2017-5121 
Jordan Rabet discovered an out-of-bounds memory access in the v8
javascript library.

CVE-2017-5122 
Choongwoo Han discovered an out-of-bounds memory access in the v8
javascript library.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"chromedriver", ver:"61.0.3163.100-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium", ver:"61.0.3163.100-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-driver", ver:"61.0.3163.100-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-l10n", ver:"61.0.3163.100-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-shell", ver:"61.0.3163.100-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"chromium-widevine", ver:"61.0.3163.100-1~deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

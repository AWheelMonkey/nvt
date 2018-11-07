###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4326.nasl 12160 2018-10-30 04:32:12Z ckuersteiner $
#
# Auto-generated from advisory DSA 4326-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704326");
  script_version("$Revision: 12160 $");
  script_cve_id("CVE-2018-3136", "CVE-2018-3139", "CVE-2018-3149", "CVE-2018-3169", "CVE-2018-3180",
                "CVE-2018-3183", "CVE-2018-3214");
  script_name("Debian Security Advisory DSA 4326-1 (openjdk-8 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-30 05:32:12 +0100 (Tue, 30 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-25 00:00:00 +0200 (Thu, 25 Oct 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4326.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"openjdk-8 on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 8u181-b13-2~deb9u1.

We recommend that you upgrade your openjdk-8 packages.

For the detailed security status of openjdk-8 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/openjdk-8");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in OpenJDK, an
implementation of the Oracle Java platform, resulting in denial of
service, sandbox bypass, incomplete TLS identity verification,
information disclosure or the execution of arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"openjdk-8-dbg", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-demo", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-doc", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-jdk", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-jdk-headless", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-jre", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-jre-headless", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-jre-zero", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-8-source", ver:"8u181-b13-2~deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

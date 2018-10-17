###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4166.nasl 9388 2018-04-06 13:14:58Z cfischer $
#
# Auto-generated from advisory DSA 4166-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704166");
  script_version("$Revision: 9388 $");
  script_cve_id("CVE-2018-2579", "CVE-2018-2588", "CVE-2018-2599", "CVE-2018-2602", "CVE-2018-2603",
                "CVE-2018-2618", "CVE-2018-2629", "CVE-2018-2633", "CVE-2018-2634", "CVE-2018-2637",
                "CVE-2018-2641", "CVE-2018-2663", "CVE-2018-2677", "CVE-2018-2678");
  script_name("Debian Security Advisory DSA 4166-1 (openjdk-7 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 15:14:58 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-04-04 00:00:00 +0200 (Wed, 04 Apr 2018)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4166.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"openjdk-7 on Debian Linux");
  script_tag(name:"insight", value:"OpenJDK is a development environment for building applications,
applets, and components using the Java programming language.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), these problems have been fixed
in version 7u171-2.6.13-1~deb8u1.

We recommend that you upgrade your openjdk-7 packages.

For the detailed security status of openjdk-7 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/openjdk-7");
  script_tag(name:"summary",  value:"Several vulnerabilities have been discovered in OpenJDK, an
implementation of the Oracle Java platform, resulting in denial of
service, sandbox bypass, execution of arbitrary code, incorrect
LDAP/GSS authentication, insecure use of cryptography or bypass of
deserialisation restrictions.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-dbg", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-demo", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-doc", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jdk", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"openjdk-7-source", ver:"7u171-2.6.13-1~deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4281.nasl 11933 2018-10-17 07:09:44Z asteins $
#
# Auto-generated from advisory DSA 4281-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704281");
  script_version("$Revision: 11933 $");
  script_cve_id("CVE-2018-1304", "CVE-2018-1305", "CVE-2018-1336", "CVE-2018-8034", "CVE-2018-8037");
  script_name("Debian Security Advisory DSA 4281-1 (tomcat8 - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 09:09:44 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-29 00:00:00 +0200 (Wed, 29 Aug 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4281.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"tomcat8 on Debian Linux");
  script_tag(name:"insight", value:"Apache Tomcat implements the Java Servlet and the JavaServer Pages (JSP)
specifications from Oracle, and provides a 'pure Java' HTTP web
server environment for Java code to run.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 8.5.14-1+deb9u3.

We recommend that you upgrade your tomcat8 packages.

For the detailed security status of tomcat8 please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/tomcat8");
  script_tag(name:"summary",  value:"Several issues were discovered in the Tomcat servlet and JSP
engine. They could lead to unauthorized access to protected resources,
denial-of-service, or information leak.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libservlet3.1-java", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libservlet3.1-java-doc", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtomcat8-embed-java", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtomcat8-java", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat8", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat8-admin", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat8-common", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat8-docs", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat8-examples", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat8-user", ver:"8.5.14-1+deb9u3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

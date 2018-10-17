###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1400.nasl 10476 2018-07-10 11:17:28Z cfischer $
#
# Auto-generated from advisory DLA 1400-2 using nvtgen 1.0
# Script version: 2.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891400");
  script_version("$Revision: 10476 $");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1400-2] tomcat7 regression update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-10 13:17:28 +0200 (Tue, 10 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-10 00:00:00 +0200 (Tue, 10 Jul 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/07/msg00001.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"tomcat7 on Debian Linux");
  script_tag(name:"insight", value:"Apache Tomcat implements the Java Servlet and the JavaServer Pages (JSP)
specifications from Sun Microsystems, and provides a 'pure Java' HTTP web
server environment for Java code to run.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in version
7.0.56-3+really7.0.88-2.

We recommend that you upgrade your tomcat7 packages.");
  script_tag(name:"summary",  value:"The security update of Tomcat 7 announced as DLA-1400-1 introduced a
regression for applications that make use of the Equinox OSGi
framework. The MANIFEST file of tomcat-jdbc.jar in libtomcat7-java
contains an invalid version number which was automatically derived
from the Debian package version. This caused an OSGi exception.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libservlet3.0-java", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libservlet3.0-java-doc", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtomcat7-java", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-admin", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-common", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-docs", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-examples", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-user", ver:"7.0.56-3+really7.0.88-2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

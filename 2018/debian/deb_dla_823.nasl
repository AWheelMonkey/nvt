###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_823.nasl 10219 2018-06-15 12:00:55Z cfischer $
#
# Auto-generated from advisory DLA 823-2 using nvtgen 1.0
# Script version:2.0
# #
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
  script_oid("1.3.6.1.4.1.25623.1.0.890823");
  script_version("$Revision: 10219 $");
  script_cve_id("CVE-2017-6056");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 823-2] tomcat7 regression update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 14:00:55 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-01-05 00:00:00 +0100 (Fri, 05 Jan 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/02/msg00022.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"tomcat7 on Debian Linux");
  script_tag(name:"insight", value:"Apache Tomcat implements the Java Servlet and the JavaServer Pages (JSP)
specifications from Sun Microsystems, and provides a 'pure Java' HTTP web
server environment for Java code to run.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
7.0.28-4+deb7u11.

We recommend that you upgrade your tomcat7 packages.");
  script_tag(name:"summary",  value:"The update for tomcat7 issued as DLA-823-1 caused that the server could
return HTTP 400 errors under certain circumstances. Updated packages are
now available to correct this issue. For reference, the original
advisory text follows.

It was discovered that a programming error in the processing of HTTPS
requests in the Apache Tomcat servlet and JSP engine may result in
denial of service via an infinite loop.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libservlet3.0-java", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libservlet3.0-java-doc", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libtomcat7-java", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-admin", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-common", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-docs", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-examples", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"tomcat7-user", ver:"7.0.28-4+deb7u11", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

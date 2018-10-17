###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa-201404-07.nasl 11671 2018-09-28 10:44:05Z cfischer $
#
# Gentoo Linux security check
#
# Authors:
# Eero Volotinen <eero.volotinen@solinor.com>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.121175");
  script_version("$Revision: 11671 $");
  script_tag(name:"creation_date", value:"2015-09-29 11:27:05 +0300 (Tue, 29 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_name("Gentoo Security Advisory GLSA 201404-07");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been found in OpenSSL:");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://security.gentoo.org/glsa/201404-07");
  script_cve_id("CVE-2014-0160", "CVE-2014-0076");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201404-07");
  script_copyright("Eero Volotinen");
  script_family("Gentoo Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 1.0.1g"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8y"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p1"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p2"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p3"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p4"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p5"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p6"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p7"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p8"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p9"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p10"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p11"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p12"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p13"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p14"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list("ge 0.9.8z_p15"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"dev-libs/openssl", unaffected: make_list(), vulnerable: make_list("lt 1.0.1g"))) != NULL) {
  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

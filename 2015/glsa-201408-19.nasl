###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa-201408-19.nasl 12128 2018-10-26 13:35:25Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.121263");
  script_version("$Revision: 12128 $");
  script_tag(name:"creation_date", value:"2015-09-29 11:27:50 +0300 (Tue, 29 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:35:25 +0200 (Fri, 26 Oct 2018) $");
  script_name("Gentoo Security Advisory GLSA 201408-19");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been discovered in OpenOffice and Libreoffice. Please review the CVE identifiers referenced below for details.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://security.gentoo.org/glsa/201408-19");
  script_cve_id("CVE-2006-4339", "CVE-2009-0200", "CVE-2009-0201", "CVE-2009-0217", "CVE-2009-2949", "CVE-2009-2950", "CVE-2009-3301", "CVE-2009-3302", "CVE-2010-0395", "CVE-2010-2935", "CVE-2010-2936", "CVE-2010-3450", "CVE-2010-3451", "CVE-2010-3452", "CVE-2010-3453", "CVE-2010-3454", "CVE-2010-3689", "CVE-2010-4253", "CVE-2010-4643", "CVE-2011-2713", "CVE-2012-0037", "CVE-2012-1149", "CVE-2012-2149", "CVE-2012-2334", "CVE-2012-2665", "CVE-2014-0247");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Gentoo Linux Local Security Checks GLSA 201408-19");
  script_copyright("Eero Volotinen");
  script_family("Gentoo Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"app-office/openoffice-bin", unaffected: make_list("ge 3.5.5.3"), vulnerable: make_list("lt 3.5.5.3"))) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"app-office/openoffice", unaffected: make_list(), vulnerable: make_list("lt 3.5.5.3"))) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"app-office/libreoffice", unaffected: make_list("ge 4.2.5.2"), vulnerable: make_list("lt 4.2.5.2"))) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"app-office/libreoffice-bin", unaffected: make_list("ge 4.2.5.2"), vulnerable: make_list("lt 4.2.5.2"))) != NULL) {
  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

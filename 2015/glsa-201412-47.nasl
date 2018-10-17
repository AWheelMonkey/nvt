###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa-201412-47.nasl 11671 2018-09-28 10:44:05Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.121333");
  script_version("$Revision: 11671 $");
  script_tag(name:"creation_date", value:"2015-09-29 11:28:24 +0300 (Tue, 29 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_name("Gentoo Security Advisory GLSA 201412-47");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been discovered in TORQUE Resource Manager. Please review the CVE identifiers referenced below for details.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://security.gentoo.org/glsa/201412-47");
  script_cve_id("CVE-2011-2193", "CVE-2011-2907", "CVE-2011-4925", "CVE-2013-4319", "CVE-2013-4495", "CVE-2014-0749");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201412-47");
  script_copyright("Eero Volotinen");
  script_family("Gentoo Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"sys-cluster/torque", unaffected: make_list("ge 4.1.7"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"sys-cluster/torque", unaffected: make_list("ge 2.5.13"), vulnerable: make_list() )) != NULL) {

  report += res;
}
if((res=ispkgvuln(pkg:"sys-cluster/torque", unaffected: make_list(), vulnerable: make_list("lt 4.1.7"))) != NULL) {
  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

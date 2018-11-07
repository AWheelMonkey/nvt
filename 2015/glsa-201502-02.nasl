###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa-201502-02.nasl 12128 2018-10-26 13:35:25Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.121341");
  script_version("$Revision: 12128 $");
  script_tag(name:"creation_date", value:"2015-09-29 11:28:27 +0300 (Tue, 29 Sep 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:35:25 +0200 (Fri, 26 Oct 2018) $");
  script_name("Gentoo Security Advisory GLSA 201502-02");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been discovered in Adobe Flash Player. Please review the CVE identifiers referenced below for details.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://security.gentoo.org/glsa/201502-02");
  script_cve_id("CVE-2015-0301", "CVE-2015-0302", "CVE-2015-0303", "CVE-2015-0304", "CVE-2015-0305", "CVE-2015-0306", "CVE-2015-0307", "CVE-2015-0308", "CVE-2015-0309", "CVE-2015-0310", "CVE-2015-0311", "CVE-2015-0314", "CVE-2015-0315", "CVE-2015-0316", "CVE-2015-0317", "CVE-2015-0318", "CVE-2015-0319", "CVE-2015-0320", "CVE-2015-0321", "CVE-2015-0322", "CVE-2015-0323", "CVE-2015-0324", "CVE-2015-0325", "CVE-2015-0326", "CVE-2015-0327", "CVE-2015-0328", "CVE-2015-0329", "CVE-2015-0330");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Gentoo Linux Local Security Checks GLSA 201502-02");
  script_copyright("Eero Volotinen");
  script_family("Gentoo Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"www-plugins/adobe-flash", unaffected: make_list("ge 11.2.202.442"), vulnerable: make_list("lt 11.2.202.442"))) != NULL) {
  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

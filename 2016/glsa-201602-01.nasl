###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa-201602-01.nasl 11671 2018-09-28 10:44:05Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.121440");
  script_version("$Revision: 11671 $");
  script_tag(name:"creation_date", value:"2016-02-05 14:00:43 +0200 (Fri, 05 Feb 2016)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_name("Gentoo Security Advisory GLSA 201602-01");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been discovered in QEMU. Please review the CVE identifiers referenced below for details.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://security.gentoo.org/glsa/201602-01");
  script_cve_id("CVE-2015-1779", "CVE-2015-3456", "CVE-2015-5225", "CVE-2015-5278", "CVE-2015-5279", "CVE-2015-5745", "CVE-2015-6815", "CVE-2015-6855", "CVE-2015-7295", "CVE-2015-7504", "CVE-2015-7512", "CVE-2015-7549", "CVE-2015-8345", "CVE-2015-8504", "CVE-2015-8556", "CVE-2015-8558", "CVE-2015-8567", "CVE-2015-8568", "CVE-2015-8666", "CVE-2015-8701", "CVE-2015-8743", "CVE-2015-8744", "CVE-2015-8745", "CVE-2016-1568");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"summary", value:"Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201602-01");
  script_copyright("Eero Volotinen");
  script_family("Gentoo Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"app-emulation/qemu", unaffected: make_list("ge 2.5.0-r1"), vulnerable: make_list("lt 2.5.0-r1"))) != NULL) {
  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

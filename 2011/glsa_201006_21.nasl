###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa_201006_21.nasl 11671 2018-09-28 10:44:05Z cfischer $
#
# Auto generated from Gentoo's XML based advisory
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.69024");
  script_version("$Revision: 11671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-03-09 05:54:11 +0100 (Wed, 09 Mar 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4893", "CVE-2010-2075");
  script_name("Gentoo Security Advisory GLSA 201006-21 (unrealircd)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Gentoo Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_tag(name:"insight", value:"Multiple vulnerabilities in UnrealIRCd might allow remote attackers to
    compromise the 'unrealircd' account, or cause a Denial of Service.");
  script_tag(name:"solution", value:"All UnrealIRCd users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=net-irc/unrealircd-3.2.8.1-r1'

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201006-21
http://bugs.gentoo.org/show_bug.cgi?id=260806
http://bugs.gentoo.org/show_bug.cgi?id=323691
http://www.unrealircd.com/txt/unrealsecadvisory.20090413.txt
http://www.unrealircd.com/txt/unrealsecadvisory.20100612.txt");
  script_tag(name:"summary", value:"The remote host is missing updates announced in
advisory GLSA 201006-21.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("pkg-lib-gentoo.inc");
include("revisions-lib.inc");

res = "";
report = "";
report = "";
if ((res = ispkgvuln(pkg:"net-irc/unrealircd", unaffected: make_list("ge 3.2.8.1-r1"), vulnerable: make_list("lt 3.2.8.1-r1"))) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

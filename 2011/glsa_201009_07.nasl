###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa_201009_07.nasl 11671 2018-09-28 10:44:05Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.69031");
  script_version("$Revision: 11671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-03-09 05:54:11 +0100 (Wed, 09 Mar 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2009-2414", "CVE-2009-2416");
  script_name("Gentoo Security Advisory GLSA 201009-07 (libxml2)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Gentoo Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_tag(name:"insight", value:"Multiple Denial of Services vulnerabilities were found in libxml2.");
  script_tag(name:"solution", value:"All libxml2 users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=dev-libs/libxml2-2.7.3-r2'

NOTE: This is a legacy GLSA. Updates for all affected architectures are
    available since August 30, 2009. It is likely that your system is
    already no longer affected by this issue.

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201009-07
http://bugs.gentoo.org/show_bug.cgi?id=280617");
  script_tag(name:"summary", value:"The remote host is missing updates announced in
advisory GLSA 201009-07.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("pkg-lib-gentoo.inc");
include("revisions-lib.inc");

res = "";
report = "";
report = "";
if ((res = ispkgvuln(pkg:"dev-libs/libxml2", unaffected: make_list("ge 2.7.3-r2"), vulnerable: make_list("lt 2.7.3-r2"))) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

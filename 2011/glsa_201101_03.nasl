###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa_201101_03.nasl 11671 2018-09-28 10:44:05Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.69039");
  script_version("$Revision: 11671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-03-09 05:54:11 +0100 (Wed, 09 Mar 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2010-4203");
  script_name("Gentoo Security Advisory GLSA 201101-03 (libvpx)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Gentoo Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_tag(name:"insight", value:"Timothy B. Terriberry discovered that libvpx contains an integer overflow
    vulnerability in the processing of video streams that may allow
    user-assisted execution of arbitrary code.");
  script_tag(name:"solution", value:"All libvpx users should upgrade to the latest stable version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=media-libs/libvpx-0.9.5'

Packages which depend on this library may need to be recompiled. Tools
    such as revdep-rebuild may assist in identifying some of these
    packages.

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201101-03
http://bugs.gentoo.org/show_bug.cgi?id=345559");
  script_tag(name:"summary", value:"The remote host is missing updates announced in
advisory GLSA 201101-03.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("pkg-lib-gentoo.inc");
include("revisions-lib.inc");

res = "";
report = "";
report = "";
if ((res = ispkgvuln(pkg:"media-libs/libvpx", unaffected: make_list("ge 0.9.5"), vulnerable: make_list("lt 0.9.5"))) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

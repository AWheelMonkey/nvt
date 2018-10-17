###############################################################################
# OpenVAS Vulnerability Test
# $Id: glsa_201012_01.nasl 11671 2018-09-28 10:44:05Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.69036");
  script_cve_id("CVE-2010-4574", "CVE-2010-4575", "CVE-2010-4576", "CVE-2010-4577", "CVE-2010-4578");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_version("$Revision: 11671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 12:44:05 +0200 (Fri, 28 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-03-09 05:54:11 +0100 (Wed, 09 Mar 2011)");
  script_name("Gentoo Security Advisory GLSA 201012-01 (chromium)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
  script_family("Gentoo Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been reported in Chromium, some of which may
    allow user-assisted execution of arbitrary code.");
  script_tag(name:"solution", value:"All Chromium users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=www-client/chromium-8.0.552.224'

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201012-01
http://bugs.gentoo.org/show_bug.cgi?id=325451
http://bugs.gentoo.org/show_bug.cgi?id=326717
http://bugs.gentoo.org/show_bug.cgi?id=330003
http://bugs.gentoo.org/show_bug.cgi?id=333559
http://bugs.gentoo.org/show_bug.cgi?id=335750
http://bugs.gentoo.org/show_bug.cgi?id=338204
http://bugs.gentoo.org/show_bug.cgi?id=341797
http://bugs.gentoo.org/show_bug.cgi?id=344201
http://bugs.gentoo.org/show_bug.cgi?id=347625
http://bugs.gentoo.org/show_bug.cgi?id=348651
http://googlechromereleases.blogspot.com/2010/06/stable-channel-update_24.html
http://googlechromereleases.blogspot.com/2010/07/stable-channel-update.html
http://googlechromereleases.blogspot.com/2010/07/stable-channel-update_26.html
http://googlechromereleases.blogspot.com/2010/08/stable-channel-update_19.html
http://googlechromereleases.blogspot.com/2010/09/stable-beta-channel-updates_14.html
http://googlechromereleases.blogspot.com/2010/09/stable-beta-channel-updates_17.html
http://googlechromereleases.blogspot.com/2010/10/stable-channel-update.html
http://googlechromereleases.blogspot.com/2010/11/stable-channel-update.html
http://googlechromereleases.blogspot.com/2010/12/stable-beta-channel-updates.html
http://googlechromereleases.blogspot.com/2010/12/stable-beta-channel-updates_13.html");
  script_tag(name:"summary", value:"The remote host is missing updates announced in
advisory GLSA 201012-01.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("pkg-lib-gentoo.inc");
include("revisions-lib.inc");

res = "";
report = "";
report = "";
if ((res = ispkgvuln(pkg:"www-client/chromium", unaffected: make_list("ge 8.0.552.224"), vulnerable: make_list("lt 8.0.552.224"))) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99);
}

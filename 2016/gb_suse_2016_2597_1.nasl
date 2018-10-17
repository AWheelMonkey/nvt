###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_2597_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for Chromium openSUSE-SU-2016:2597-1 (Chromium)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.851416");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-10-24 05:53:08 +0200 (Mon, 24 Oct 2016)");
  script_cve_id("CVE-2016-5181", "CVE-2016-5182", "CVE-2016-5183", "CVE-2016-5184", 
                "CVE-2016-5185", "CVE-2016-5186", "CVE-2016-5187", "CVE-2016-5188", 
                "CVE-2016-5189", "CVE-2016-5190", "CVE-2016-5191", "CVE-2016-5192", 
                "CVE-2016-5193");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Chromium openSUSE-SU-2016:2597-1 (Chromium)");
  script_tag(name: "summary", value: "Check the version of Chromium");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Chromium was updated to 54.0.2840.59 to fix security issues and bugs.

  The following security issues are fixed (bnc#1004465):

  - CVE-2016-5181: Universal XSS in Blink
  - CVE-2016-5182: Heap overflow in Blink
  - CVE-2016-5183: Use after free in PDFium
  - CVE-2016-5184: Use after free in PDFium
  - CVE-2016-5185: Use after free in Blink
  - CVE-2016-5187: URL spoofing
  - CVE-2016-5188: UI spoofing
  - CVE-2016-5192: Cross-origin bypass in Blink
  - CVE-2016-5189: URL spoofing
  - CVE-2016-5186: Out of bounds read in DevTools
  - CVE-2016-5191: Universal XSS in Bookmarks
  - CVE-2016-5190: Use after free in Internals
  - CVE-2016-5193: Scheme bypass

  The following bugs were fixed:

  -  bnc#1000019: display issues in full screen mode, add
  --ui-disable-partial-swap to the launcher

  The following packaging changes are included:

  - The desktop sub-packages are no obsolete
  - The package now uses the system variants of some bundled libraries
  - The hangouts extension is now built");
  script_tag(name: "affected", value: "Chromium on openSUSE Leap 42.1, openSUSE 13.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:2597_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo", rpm:"chromium-ffmpegsumo~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo-debuginfo", rpm:"chromium-ffmpegsumo-debuginfo~54.0.2840.59~131.2", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2013_1776_1.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# SuSE Update for chromium openSUSE-SU-2013:1776-1 (chromium)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850556");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-12-03 14:47:17 +0530 (Tue, 03 Dec 2013)");
  script_cve_id("CVE-2013-2925", "CVE-2013-2926", "CVE-2013-2927", "CVE-2013-2928",
                "CVE-2013-2931", "CVE-2013-6621", "CVE-2013-6622", "CVE-2013-6623",
                "CVE-2013-6624", "CVE-2013-6625", "CVE-2013-6626", "CVE-2013-6627",
                "CVE-2013-6628", "CVE-2013-6629", "CVE-2013-6630", "CVE-2013-6631",
                "CVE-2013-6632");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("SuSE Update for chromium openSUSE-SU-2013:1776-1 (chromium)");

  tag_insight = "
  Security and bugfix update to Chromium 31.0.1650.57

  - Update to Chromium 31.0.1650.57:
  - Security Fixes:
  * CVE-2013-6632: Multiple memory corruption issues.

  - Update to Chromium 31.0.1650.48 Stable Channel update:
  - Security fixes:
  * CVE-2013-6621: Use after free related to speech input
  elements..
  * CVE-2013-6622: Use after free related to media
  elements.
  * CVE-2013-6623: Out of bounds read in SVG.
  * CVE-2013-6624: Use after free related to id
  attribute strings.
  * CVE-2013-6625: Use after free in DOM ranges.
  * CVE-2013-6626: Address bar spoofing related to
  interstitial warnings.
  * CVE-2013-6627: Out of bounds read in HTTP parsing.
  * CVE-2013-6628: Issue with certificates not being
  checked during TLS renegotiation.
  * CVE-2013-2931: Various fixes from internal audits,
  fuzzing and other initiatives.
  * CVE-2013-6629: Read of uninitialized memory in
  libjpeg and libjpeg-turbo.
  * CVE-2013-6630: Read of uninitialized memory in
  libjpeg-turbo.
  * CVE-2013-6631: Use after free in libjingle.

  - Stable Channel update: fix build for 32bit systems

  - Update to Chromium 30.0.1599.101
  - Security Fixes:
  + CVE-2013-2925: Use after free in XHR
  + CVE-2013-2926: Use after free in editing
  + CVE-2013-2927: Use after free in forms.
  + CVE-2013-2928: Various fixes from internal audits,
  fuzzing and other initiatives.
  - Enable ARM build for Chromium.";

  tag_affected = "chromium on openSUSE 12.3";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "openSUSE-SU", value: "2013:1776_1");
  script_tag(name: "summary" , value: "Check for the Version of chromium");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE12.3")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-gnome", rpm:"chromium-desktop-gnome~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-kde", rpm:"chromium-desktop-kde~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo", rpm:"chromium-ffmpegsumo~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo-debuginfo", rpm:"chromium-ffmpegsumo-debuginfo~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-suid-helper", rpm:"chromium-suid-helper~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-suid-helper-debuginfo", rpm:"chromium-suid-helper-debuginfo~31.0.1650.57~1.17.1", rls:"openSUSE12.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

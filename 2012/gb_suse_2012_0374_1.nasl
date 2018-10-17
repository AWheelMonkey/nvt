###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2012_0374_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# SuSE Update for update openSUSE-SU-2012:0374-1 (update)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Changes in chromium:
  - Update to 19.0.1066
  * Fixed Chrome install/update resets Google search
  preferences  (Issue: 105390)
  * Don't trigger accelerated compositing on 3D CSS when
  using  swiftshader (Issue: 116401)
  * Fixed a GPU crash (Issue: 116096)
  * More fixes for Back button frequently hangs (Issue:
  93427)
  * Bastion now works (Issue: 116285)
  * Fixed Composited layer sorting irregularity with
  accelerated canvas (Issue: 102943)
  * Fixed Composited layer sorting irregularity with
  accelerated  canvas (Issue: 102943)
  * Fixed Google Feedback causes render process to use too
  much  memory (Issue: 114489)
  * Fixed after upgrade, some pages are rendered as blank
  (Issue: 109888)
  * Fixed Pasting text into a single-line text field
  shouldn't  keep literal newlines (Issue: 106551)
  - Security Fixes:
  * Critical CVE-2011-3047: Errant plug-in load and GPU
  process  memory corruption
  * Critical CVE-2011-3046: UXSS and bad history navigation.

  - Update to 19.0.1060
  * Fixed NTP signed in state is missing (Issue: 112676)
  * Fixed gmail seems to redraw itself (all white)
  occasionally  (Issue: 111263)
  * Focus &quot;OK&quot; button on Javascript dialogs (Issue: 111015)
  * Fixed Back button frequently hangs (Issue: 93427)
  * Increase the buffer size to fix muted playback rate
  (Issue: 108239)
  * Fixed Empty span with line-height renders with non-zero
  height (Issue: 109811)
  * Marked the Certum Trusted Network CA as an issuer of
  extended-validation (EV) certificates.
  * Fixed importing of bookmarks, history, etc. from
  Firefox 10+.
  * Fixed issues - 114001, 110785, 114168, 114598, 111663,
  113636,  112676
  * Fixed several crashes (Issues: 111376, 108688, 114391)
  * Fixed Firefox browser in Import Bookmarks and Settings
  drop-down (Issue: 114476)
  * Sync: Sessions aren't associating pre-existing tabs
  (Issue: 113319)
  * Fixed All &quot;Extensions&quot; make an entry under the &quot;NTP
  Apps&quot; page (Issue: 113672)
  - Security Fixes (bnc#750407):
  *  High CVE-2011-3031: Use-after-free in v8 element
  wrapper.
  *  High CVE-2011-3032: Use-after-free in SVG value
  handling.
  *  High CVE-2011-3033: Buffer overflow in the Skia
  drawing library.
  *  High CVE-2011-3034: Use-after-free in SVG document
  handling.
  *  High CVE-2011-3035: Use-after-free in SVG use handling.
  *  High CVE-2011-3036: Bad cast in line box handling.
  *  High CVE-2011-3037: Bad casts in anonymous block
  splitting.
  *  High CVE-2011-3038: Use-after-free in multi-column
  handling.
  *  High CVE-2011-3039: Use-after-free in quote handling.
  *  High CVE-2011-3040:  ... 

  Description truncated, for more information please check the Reference URL";

tag_affected = "update on openSUSE 12.1";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.850231");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-12-13 17:01:25 +0530 (Thu, 13 Dec 2012)");
  script_cve_id("CVE-2011-3031", "CVE-2011-3032", "CVE-2011-3033", "CVE-2011-3034",
                "CVE-2011-3035", "CVE-2011-3036", "CVE-2011-3037", "CVE-2011-3038",
                "CVE-2011-3039", "CVE-2011-3040", "CVE-2011-3041", "CVE-2011-3042",
                "CVE-2011-3043", "CVE-2011-3044", "CVE-2011-3046", "CVE-2011-3047");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "openSUSE-SU", value: "2012:0374_1");
  script_name("SuSE Update for update openSUSE-SU-2012:0374-1 (update)");

  script_tag(name: "summary" , value: "Check for the Version of update");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE12.1")
{

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-gnome", rpm:"chromium-desktop-gnome~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-kde", rpm:"chromium-desktop-kde~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-suid-helper", rpm:"chromium-suid-helper~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-suid-helper-debuginfo", rpm:"chromium-suid-helper-debuginfo~19.0.1066.0~1.11.2", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libv8-3", rpm:"libv8-3~3.9.13.0~1.15.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libv8-3-debuginfo", rpm:"libv8-3-debuginfo~3.9.13.0~1.15.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"v8-debugsource", rpm:"v8-debugsource~3.9.13.0~1.15.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"v8-devel", rpm:"v8-devel~3.9.13.0~1.15.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"v8-private-headers-devel", rpm:"v8-private-headers-devel~3.9.13.0~1.15.1", rls:"openSUSE12.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_0664_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for Chromium openSUSE-SU-2016:0664-1 (Chromium)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851225");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-07 05:33:49 +0100 (Mon, 07 Mar 2016)");
  script_cve_id("CVE-2015-8126", "CVE-2016-1630", "CVE-2016-1631", "CVE-2016-1632",
                "CVE-2016-1633", "CVE-2016-1634", "CVE-2016-1635", "CVE-2016-1636",
                "CVE-2016-1637", "CVE-2016-1638", "CVE-2016-1639", "CVE-2016-1640",
                "CVE-2016-1641", "CVE-2016-1642");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Chromium openSUSE-SU-2016:0664-1 (Chromium)");
  script_tag(name:"summary", value:"Check the version of Chromium");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Chromium was updated to 49.0.2623.75 to fix the following security issues:
  (boo#969333)

  - CVE-2016-1630: Same-origin bypass in Blink

  - CVE-2016-1631: Same-origin bypass in Pepper Plugin

  - CVE-2016-1632: Bad cast in Extensions

  - CVE-2016-1633: Use-after-free in Blink

  - CVE-2016-1634: Use-after-free in Blink

  - CVE-2016-1635: Use-after-free in Blink

  - CVE-2016-1636: SRI Validation Bypass

  - CVE-2015-8126: Out-of-bounds access in libpng

  - CVE-2016-1637: Information Leak in Skia

  - CVE-2016-1638: WebAPI Bypass

  - CVE-2016-1639: Use-after-free in WebRTC

  - CVE-2016-1640: Origin confusion in Extensions UI

  - CVE-2016-1641: Use-after-free in Favicon

  - CVE-2016-1642: Various fixes from internal audits, fuzzing and other
  initiatives

  - Multiple vulnerabilities in V8 fixed at the tip of the 4.9 branch
  (currently 4.9.385.26)");
  script_tag(name:"affected", value:"Chromium on openSUSE Leap 42.1");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2016:0664_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap42\.1");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-gnome", rpm:"chromium-desktop-gnome~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-kde", rpm:"chromium-desktop-kde~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo", rpm:"chromium-ffmpegsumo~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo-debuginfo", rpm:"chromium-ffmpegsumo-debuginfo~49.0.2623.75~27.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

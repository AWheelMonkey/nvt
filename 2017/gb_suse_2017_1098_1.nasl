###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2017_1098_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# SuSE Update for chromium openSUSE-SU-2017:1098-1 (chromium)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851539");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-04-25 06:33:47 +0200 (Tue, 25 Apr 2017)");
  script_cve_id("CVE-2017-5057", "CVE-2017-5058", "CVE-2017-5059", "CVE-2017-5060",
                "CVE-2017-5061", "CVE-2017-5062", "CVE-2017-5063", "CVE-2017-5064",
                "CVE-2017-5065", "CVE-2017-5066", "CVE-2017-5067", "CVE-2017-5069");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for chromium openSUSE-SU-2017:1098-1 (chromium)");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'chromium'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update to Chromium 58.0.3029.81 fixes the following security issues
  (bsc#1035103):

  - CVE-2017-5057: Type confusion in PDFium

  - CVE-2017-5058: Heap use after free in Print Preview

  - CVE-2017-5059: Type confusion in Blink

  - CVE-2017-5060: URL spoofing in Omnibox

  - CVE-2017-5061: URL spoofing in Omnibox

  - CVE-2017-5062: Use after free in Chrome Apps

  - CVE-2017-5063: Heap overflow in Skia

  - CVE-2017-5064: Use after free in Blink

  - CVE-2017-5065: Incorrect UI in Blink

  - CVE-2017-5066: Incorrect signature handing in Networking

  - CVE-2017-5067: URL spoofing in Omnibox

  - CVE-2017-5069: Cross-origin bypass in Blink");
  script_tag(name:"affected", value:"chromium on openSUSE Leap 42.2, openSUSE Leap 42.1");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2017:1098_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=(openSUSELeap42\.2|openSUSELeap42\.1)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "openSUSELeap42.2")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~58.0.3029.81~104.9.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~58.0.3029.81~104.9.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~58.0.3029.81~104.9.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~58.0.3029.81~104.9.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~58.0.3029.81~104.9.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~58.0.3029.81~111.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~58.0.3029.81~111.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~58.0.3029.81~111.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~58.0.3029.81~111.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~58.0.3029.81~111.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

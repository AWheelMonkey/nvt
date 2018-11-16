###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_2781_1.nasl 12283 2018-11-09 11:21:17Z cfischer $
#
# SuSE Update for webkit2gtk3 openSUSE-SU-2018:2781-1 (webkit2gtk3)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.852082");
  script_version("$Revision: 12283 $");
  script_cve_id("CVE-2018-12911", "CVE-2018-4261", "CVE-2018-4262", "CVE-2018-4263", "CVE-2018-4264", "CVE-2018-4265", "CVE-2018-4266", "CVE-2018-4267", "CVE-2018-4270", "CVE-2018-4271", "CVE-2018-4272", "CVE-2018-4273", "CVE-2018-4278", "CVE-2018-4284");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 12:21:17 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-10-26 06:42:25 +0200 (Fri, 26 Oct 2018)");
  script_name("SuSE Update for webkit2gtk3 openSUSE-SU-2018:2781-1 (webkit2gtk3)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2018:2781_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-09/msg00042.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'webkit2gtk3'
  package(s) announced via the openSUSE-SU-2018:2781_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for webkit2gtk3 to version 2.20.5 fixes the following issues:

  Security issue fixed:

  - CVE-2018-12911: Fix off-by-one in xdg_mime_get_simple_globs
  (bsc#1101999).

  - CVE-2018-4261, CVE-2018-4262, CVE-2018-4263, CVE-2018-4264,
  CVE-2018-4265, CVE-2018-4267, CVE-2018-4272, CVE-2018-4284: Processing
  maliciously crafted web content may lead to arbitrary code execution. A
  memory corruption issue was addressed with improved memory handling.

  - CVE-2018-4266: A malicious website may be able to cause a denial of
  service. A race condition was addressed with additional validation.

  - CVE-2018-4270, CVE-2018-4271, CVE-2018-4273: Processing maliciously
  crafted web content may lead to an unexpected application crash. A
  memory corruption issue was addressed with improved input validation.

  - CVE-2018-4278: A malicious website may exfiltrate audio data
  cross-origin. Sound fetched through audio elements may be exfiltrated
  cross-origin. This issue was addressed with improved audio taint
  tracking.

  Other bugs fixed:

  - Fix rendering artifacts in some web sites due to a bug introduced in
  2.20.4.

  - Fix a crash when leaving accelerated compositing mode.

  - Fix non-deterministic build failure due to missing
  JavaScriptCore/JSContextRef.h.

  This update was imported from the SUSE:SLE-15:Update update project.


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2018-1025=1");

  script_tag(name:"affected", value:"webkit2gtk3 on openSUSE Leap 15.0.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "openSUSELeap15.0")
{

  if ((res = isrpmvuln(pkg:"libjavascriptcoregtk-4_0-18", rpm:"libjavascriptcoregtk-4_0-18~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libjavascriptcoregtk-4_0-18-debuginfo", rpm:"libjavascriptcoregtk-4_0-18-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libwebkit2gtk-4_0-37", rpm:"libwebkit2gtk-4_0-37~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libwebkit2gtk-4_0-37-debuginfo", rpm:"libwebkit2gtk-4_0-37-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"typelib-1_0-JavaScriptCore-4_0", rpm:"typelib-1_0-JavaScriptCore-4_0~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"typelib-1_0-WebKit2-4_0", rpm:"typelib-1_0-WebKit2-4_0~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"typelib-1_0-WebKit2WebExtension-4_0", rpm:"typelib-1_0-WebKit2WebExtension-4_0~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit-jsc-4", rpm:"webkit-jsc-4~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit-jsc-4-debuginfo", rpm:"webkit-jsc-4-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit2gtk-4_0-injected-bundles", rpm:"webkit2gtk-4_0-injected-bundles~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit2gtk-4_0-injected-bundles-debuginfo", rpm:"webkit2gtk-4_0-injected-bundles-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit2gtk3-debugsource", rpm:"webkit2gtk3-debugsource~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit2gtk3-devel", rpm:"webkit2gtk3-devel~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit2gtk3-plugin-process-gtk2", rpm:"webkit2gtk3-plugin-process-gtk2~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"webkit2gtk3-plugin-process-gtk2-debuginfo", rpm:"webkit2gtk3-plugin-process-gtk2-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libjavascriptcoregtk-4_0-18-32bit", rpm:"libjavascriptcoregtk-4_0-18-32bit~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libjavascriptcoregtk-4_0-18-32bit-debuginfo", rpm:"libjavascriptcoregtk-4_0-18-32bit-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libwebkit2gtk-4_0-37-32bit", rpm:"libwebkit2gtk-4_0-37-32bit~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libwebkit2gtk-4_0-37-32bit-debuginfo", rpm:"libwebkit2gtk-4_0-37-32bit-debuginfo~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libwebkit2gtk3-lang", rpm:"libwebkit2gtk3-lang~2.20.5~lp150.2.6.1", rls:"openSUSELeap15.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

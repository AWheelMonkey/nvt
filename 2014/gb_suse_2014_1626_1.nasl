###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_1626_1.nasl 8044 2017-12-08 08:32:49Z santu $
#
# SuSE Update for chromium openSUSE-SU-2014:1626-1 (chromium)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850624");
  script_version("$Revision: 8044 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:32:49 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2014-12-13 05:53:58 +0100 (Sat, 13 Dec 2014)");
  script_cve_id("CVE-2014-0574", "CVE-2014-7899", "CVE-2014-7900", "CVE-2014-7901",
                "CVE-2014-7902", "CVE-2014-7903", "CVE-2014-7904", "CVE-2014-7905",
                "CVE-2014-7906", "CVE-2014-7907", "CVE-2014-7908", "CVE-2014-7909",
                "CVE-2014-7910");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("SuSE Update for chromium openSUSE-SU-2014:1626-1 (chromium)");
  script_tag(name: "summary", value: "Check the version of chromium");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
  detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  chromium was updated to version 39.0.2171.65 to fix 13 security issues.

  These security issues were fixed:
  - Use-after-free in pepper plugins (CVE-2014-7906).
  - Buffer overflow in OpenJPEG before r2911 in PDFium, as used in Google
  Chromebefore 39.0.2171.65, al... (CVE-2014-7903).
  - Uninitialized memory read in Skia (CVE-2014-7909).
  - Unspecified security issues (CVE-2014-7910).
  - Integer overflow in media (CVE-2014-7908).
  - Integer overflow in the opj_t2_read_packet_data function
  infxcodec/fx_libopenjpeg/libopenjpeg20/t2.... (CVE-2014-7901).
  - Use-after-free in blink (CVE-2014-7907).
  - Address bar spoofing (CVE-2014-7899).
  - Buffer overflow in Skia (CVE-2014-7904).
  - Use-after-free vulnerability in the CPDF_Parser (CVE-2014-7900).
  - Use-after-free vulnerability in PDFium allows DoS (CVE-2014-7902).
  - Flaw allowing navigation to intents that do not have the BROWSABLE
  category (CVE-2014-7905).
  - Double-free in Flash (CVE-2014-0574).");
  script_tag(name: "affected", value: "chromium on openSUSE 13.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "openSUSE-SU", value: "2014:1626_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"chromedriver", rpm:"chromedriver~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromedriver-debuginfo", rpm:"chromedriver-debuginfo~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium", rpm:"chromium~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debuginfo", rpm:"chromium-debuginfo~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-debugsource", rpm:"chromium-debugsource~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-gnome", rpm:"chromium-desktop-gnome~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-desktop-kde", rpm:"chromium-desktop-kde~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo", rpm:"chromium-ffmpegsumo~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"chromium-ffmpegsumo-debuginfo", rpm:"chromium-ffmpegsumo-debuginfo~39.0.2171.65~58.4", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

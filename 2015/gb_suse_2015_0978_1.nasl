###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0978_1.nasl 12284 2018-11-09 12:37:21Z cfischer $
#
# SuSE Update for MozillaFirefox SUSE-SU-2015:0978-1 (MozillaFirefox)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850816");
  script_version("$Revision: 12284 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-09 13:37:21 +0100 (Fri, 09 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-13 16:46:25 +0530 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2015-0797", "CVE-2015-2708", "CVE-2015-2709", "CVE-2015-2710",
                "CVE-2015-2713", "CVE-2015-2716");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for MozillaFirefox SUSE-SU-2015:0978-1 (MozillaFirefox)");
  script_tag(name:"summary", value:"Check the version of MozillaFirefox");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"This update to Firefox 31.7.0 ESR fixes the following issues:

  MFSA 2015-46 (CVE-2015-2708, CVE-2015-2709): Miscellaneous memory
  safety hazards (rv:38.0 / rv:31.7). Upstream references: bmo#1120655,
  bmo#1143299, bmo#1151139, bmo#1152177, bmo#1111251, bmo#1117977,
  bmo#1128064, bmo#1135066, bmo#1143194, bmo#1146101, bmo#1149526,
  bmo#1153688, bmo#1155474.

  MFSA 2015-47 (CVE-2015-0797): Buffer overflow parsing H.264 video
  with Linux Gstreamer. Upstream references: bmo#1080995.

  MFSA 2015-48 (CVE-2015-2710): Buffer overflow with SVG content and
  CSS. Upstream references: bmo#1149542.

  MFSA 2015-51 (CVE-2015-2713): Use-after-free during text processing
  with vertical text enabled. Upstream references: bmo#1153478.

  MFSA 2015-54 (CVE-2015-2716): Buffer overflow when parsing
  compressed XML. Upstream references: bmo#1140537.
  Everybody should update.");
  script_tag(name:"affected", value:"MozillaFirefox on SUSE Linux Enterprise Server 11 SP3");
  script_tag(name:"solution", value:"Please install the updated packages.");
  script_xref(name:"SUSE-SU", value:"2015:0978_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=SLES11\.0SP3");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);
res = "";

if(release == "SLES11.0SP3")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~31.7.0esr~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations", rpm:"MozillaFirefox-translations~31.7.0esr~0.8.1", rls:"SLES11.0SP3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

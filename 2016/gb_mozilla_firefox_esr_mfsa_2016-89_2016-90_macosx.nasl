###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mfsa_2016-89_2016-90_macosx.nasl 11969 2018-10-18 14:53:42Z asteins $
#
# Mozilla Firefox ESR Security Updates (mfsa_2016-89_2016-90)-MAC OS X
#
# Authors:
# kashinath T <tkashinath@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809807");
  script_version("$Revision: 11969 $");
  script_cve_id("CVE-2016-5296", "CVE-2016-5297", "CVE-2016-9064", "CVE-2016-9066",
                "CVE-2016-5291", "CVE-2016-9074", "CVE-2016-5290");
  script_bugtraq_id(94336, 94337, 94342, 94339);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 16:53:42 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-16 13:11:16 +0530 (Wed, 16 Nov 2016)");
  script_name("Mozilla Firefox ESR Security Updates (mfsa_2016-89_2016-90)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with
  Mozilla Firefox ESR and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exist due to,

  - Heap-buffer-overflow WRITE in rasterize_edges_1.

  - Incorrect argument length checking in JavaScript.

  - Add-ons update must verify IDs match between current and new versions.

  - Integer overflow leading to a buffer overflow in nsScriptLoadHandler.

  - Same-origin policy violation using local HTML file and saved shortcut file.

  - Insufficient timing side-channel resistance in divSpoiler.");

  script_tag(name:"impact", value:"Successful exploitation of this
  vulnerability will allow remote attackers to execute arbitrary code, to delete
  arbitrary files by leveraging certain local file execution, to obtain sensitive
  information, and to cause a denial of service.");

  script_tag(name:"affected", value:"Mozilla Firefox ESR version before
  45.5 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 45.5
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-90");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox-ESR/MacOSX/Version");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}

if(version_is_less(version:ffVer, test_version:"45.5"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"45.5");
  security_message(data:report);
  exit(0);
}

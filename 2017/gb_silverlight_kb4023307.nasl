###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_silverlight_kb4023307.nasl 12467 2018-11-21 14:04:59Z cfischer $
#
# Microsoft Silverlight Multiple Remote Code Execution Vulnerabilities (KB4023307)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:microsoft:silverlight";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810909");
  script_version("$Revision: 12467 $");
  script_cve_id("CVE-2017-0283", "CVE-2017-8527");
  script_bugtraq_id(63676);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 15:04:59 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 09:21:37 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Silverlight Multiple Remote Code Execution Vulnerabilities (KB4023307)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_silverlight_detect.nasl");
  script_mandatory_keys("Microsoft/Silverlight/Installed");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4023307");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft security update KB4023307.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - The Windows font library improperly handles specially crafted embedded fonts.

  - The way Windows Uniscribe handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation allow an attacker
  to take control of the affected system. An attacker could then install
  programs. View, change, or delete data or create new accounts with full user
  rights.");

  script_tag(name:"affected", value:"Microsoft Silverlight version 5 on Windows.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!msl_ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(msl_ver=~ "^5\.")
{
  if(version_is_less(version:msl_ver, test_version:"5.1.50907.0"))
  {
    report = 'Silverlight version: ' + msl_ver  + '\n' +
             'Vulnerable range:    5.0 - 5.1.50906.0';
    security_message(data:report);
    exit(0);
  }
}

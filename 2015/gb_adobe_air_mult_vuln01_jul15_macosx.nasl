###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_mult_vuln01_jul15_macosx.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Adobe Air Multiple Vulnerabilities-01 July15 (Mac OS X)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805912");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-5119", "CVE-2014-0578", "CVE-2015-3114", "CVE-2015-3115",
                "CVE-2015-3116", "CVE-2015-3117", "CVE-2015-3118", "CVE-2015-3119",
                "CVE-2015-3120", "CVE-2015-3121", "CVE-2015-3122", "CVE-2015-3123",
                "CVE-2015-3124", "CVE-2015-3125", "CVE-2015-3126", "CVE-2015-3127",
                "CVE-2015-3128", "CVE-2015-3129", "CVE-2015-3130", "CVE-2015-3131",
                "CVE-2015-3132", "CVE-2015-3133", "CVE-2015-3134", "CVE-2015-3135",
                "CVE-2015-3136", "CVE-2015-3137", "CVE-2015-4428", "CVE-2015-4429",
                "CVE-2015-4430", "CVE-2015-4431", "CVE-2015-4432", "CVE-2015-4433",
                "CVE-2015-5116", "CVE-2015-5117", "CVE-2015-5118");
  script_bugtraq_id(75568, 75594, 75593, 75591, 75590, 75595, 75596, 75592);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-07-09 11:41:16 +0530 (Thu, 09 Jul 2015)");
  script_name("Adobe Air Multiple Vulnerabilities-01 July15 (Mac OS X)");

  script_tag(name:"summary", value:"This host is installed with Adobe Air and
  is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - An use-after-free error in 'ByteArray' class.

  - Multiple heap based buffer overflow errors.

  - Multiple memory corruption errors.

  - Multiple null pointer dereference errors.

  - Multiple unspecified errors.

  - A type confusion error.

  - Multiple use-after-free vulnerabilities.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information, conduct denial
  of service attack and potentially execute arbitrary code in the context of the
  affected user.");

  script_tag(name:"affected", value:"Adobe Air versions before 18.0.0.180 on
  Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Air version 18.0.0.180
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb15-16.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Air/MacOSX/Version");
  script_xref(name:"URL", value:"http://get.adobe.com/air");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!airVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:airVer, test_version:"18.0.0.180"))
{
  report = 'Installed version: ' + airVer + '\n' +
           'Fixed version:     ' + "18.0.0.180" + '\n';
  security_message(data:report);
  exit(0);
}

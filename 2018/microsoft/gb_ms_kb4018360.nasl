###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4018360.nasl 10919 2018-08-10 17:56:20Z cfischer $
#
# Microsoft Office Web Apps 2010 Service Pack 2 RCE Vulnerability (KB4018360)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812594");
  script_version("$Revision: 10919 $");
  script_cve_id("CVE-2018-1028");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 19:56:20 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-04-11 10:43:18 +0530 (Wed, 11 Apr 2018)");
  script_name("Microsoft Office Web Apps 2010 Service Pack 2 RCE Vulnerability (KB4018360)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4018360");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists when Office graphics component
  improperly handles specially crafted embedded fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to take control of the affected system and execute the arabitarty code.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office Web Apps 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For details refer to reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4018360");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_office_web_apps_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/Web/Apps/Ver");

  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

infos = get_app_version_and_location( cpe:'cpe:/a:microsoft:office_web_apps', exit_no_version:TRUE );
webappVer = infos['version'];
path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

if(webappVer =~ "^(14\.)")
{
  dllVer = fetch_file_version(sysPath:path,
           file_name:"\14.0\WebServices\ConversionService\Bin\Converter\sword.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7197.4999"))
    {
      report = report_fixed_ver(file_checked: path + "\14.0\WebServices\ConversionService\Bin\Converter\sword.dll",
                            file_version:dllVer, vulnerable_range:"14.0 - 14.0.7197.4999");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_web_apps_ms16-029.nasl 9316 2018-04-05 07:06:02Z cfischer $
#
# Microsoft Office Web Apps Memory Corruption Vulnerability (3141806)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:microsoft:office_web_apps";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807516");
  script_version("$Revision: 9316 $");
  script_cve_id("CVE-2016-0134");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-05 09:06:02 +0200 (Thu, 05 Apr 2018) $");
  script_tag(name:"creation_date", value:"2016-03-09 09:58:26 +0530 (Wed, 09 Mar 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Web Apps Memory Corruption Vulnerability (3141806)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-029.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to the Office software
  fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a to execute
  arbitrary code in the context of the current user and to take control  of the
  affected system.

  Impact Level: Application");

  script_tag(name:"affected", value:"Microsoft Office Web Apps 2010 Service Pack 2 and prior,

  Microsoft Office Web Apps Server 2013 Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  https://technet.microsoft.com/library/security/MS16-029");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3114880");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3114821");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-029");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_office_web_apps_detect.nasl");
  script_mandatory_keys("MS/Office/Web/Apps/Ver");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
webappVer = infos['version'];
path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

## not covered for MS16-015: Description of the security update for SharePoint
## Server 2010 Office Web Apps: March 9, 2016 file version not available.
## Microsoft Office Web Apps 2013
if(webappVer =~ "^15\..*")
{
  path = path + "\PPTConversionService\bin\Converter\";

  dllVer = fetch_file_version(sysPath:path, file_name:"msoserver.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4805.0999"))
    {
      report = 'File checked:     ' +  path + "msoserver.dll" + '\n' +
               'File version:     ' +  dllVer  + '\n' +
               'Vulnerable range: ' +  "15.0 - 15.0.4805.0999" + '\n' ;

      security_message(data:report);
      exit(0);
    }
  }
}

exit(99);
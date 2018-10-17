###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sharepoint_server_ms16-088.nasl 11614 2018-09-26 07:39:28Z asteins $
#
# Microsoft SharePoint Server RCE Vulnerability (3170008)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:microsoft:sharepoint_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807865");
  script_version("$Revision: 11614 $");
  script_cve_id("CVE-2016-3282");
  script_bugtraq_id(91589);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 09:39:28 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-07-13 14:52:26 +0530 (Wed, 13 Jul 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft SharePoint Server RCE Vulnerability (3170008)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-088.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaw exists as office software fails to
  properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  context-dependent attacker to corrupt memory and potentially
  execute arbitrary code.");

  script_tag(name:"affected", value:"Microsoft SharePoint Server 2016

  Microsoft SharePoint Foundation 2010 Service Pack 1

  Microsoft SharePoint Foundation 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link,
  https://technet.microsoft.com/library/security/MS16-088");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114890");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115299");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3115294");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-088");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/SharePoint/Server/Ver");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
shareVer = infos['version'];

path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

## SharePoint Server 2010
if(shareVer =~ "^14\..*")
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    path = path + "\microsoft shared\Web Server Extensions\14\BIN";

    dllVer = fetch_file_version(sysPath:path, file_name:"Onetutil.dll");

    if(dllVer)
    {
      if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7171.4999"))
      {
        report = 'File checked:     ' +  path + "\Onetutil.dll"+ '\n' +
                 'File version:     ' +  dllVer  + '\n' +
                 'Vulnerable range: ' +  "14.0 - 14.0.7171.4999" + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}

## SharePoint Server 2013
if(shareVer =~ "^15\..*")
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    path = path + "\microsoft shared\Web Server Extensions\15\BIN";

    dllVer = fetch_file_version(sysPath:path, file_name:"Onetutil.dll");

    if(dllVer)
    {
      if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4841.0999"))
      {
        report = 'File checked:     ' +  path + "\Onetutil.dll"+ '\n' +
                 'File version:     ' +  dllVer  + '\n' +
                 'Vulnerable range: ' +  "15.0 - 15.0.4841.0999" + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}

## SharePoint Server 2016
if(shareVer =~ "^16\..*")
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    path = path + "\microsoft shared\Web Server Extensions\16\BIN";

    dllVer = fetch_file_version(sysPath:path, file_name:"Onetutil.dll");

    if(dllVer)
    {
      if(version_in_range(version:dllVer, test_version:"16.0", test_version2:"16.0.4405.0999"))
      {
        report = 'File checked:     ' +  path + "\Onetutil.dll"+ '\n' +
                 'File version:     ' +  dllVer  + '\n' +
                 'Vulnerable range: ' +  "16.0 - 16.0.4405.0999" + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}

exit(99);

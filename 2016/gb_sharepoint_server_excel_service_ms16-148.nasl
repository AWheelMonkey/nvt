###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sharepoint_server_excel_service_ms16-148.nasl 11614 2018-09-26 07:39:28Z asteins $
#
# MS SharePoint Server Excel Services Information Disclosure Vulnerability (3204068)
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
  script_oid("1.3.6.1.4.1.25623.1.0.809756");
  script_version("$Revision: 11614 $");
  script_cve_id("CVE-2016-7265");
  script_bugtraq_id(94721);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 09:39:28 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-12-14 12:47:22 +0530 (Wed, 14 Dec 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("MS SharePoint Server Excel Services Information Disclosure Vulnerability (3204068)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-148.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as Microsoft Office software
  reads out of bound memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information.");

  script_tag(name:"affected", value:"Microsoft SharePoint Server 2007 Service Pack 3 Excel Services.

  Microsoft SharePoint Server 2010 Excel Services.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  https://technet.microsoft.com/library/security/ms16-148");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3127892");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3128029");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/ms16-148");
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

## SharePoint Server 2007
if(shareVer =~ "^12\..*")
{
  path = path + "\12.0\Bin";

  dllVer = fetch_file_version(sysPath:path, file_name:"xlsrv.dll");
  if(dllVer)
  {
    ##https://support.microsoft.com/en-us/kb/3127892
    if(version_in_range(version:dllVer, test_version:"12.0", test_version2:"12.0.6762.4999"))
    {
      report = 'File checked:     ' + path + "\xlsrv.dll" + '\n' +
               'File version:     ' + dllVer  + '\n' +
               'Vulnerable range: ' + "12.0 - 12.0.6762.4999" + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}

## SharePoint Server 2010
if(shareVer =~ "^14\..*")
{
  path = path + "\14.0\Bin";

  dllVer = fetch_file_version(sysPath:path, file_name:"xlsrv.dll");
  if(dllVer)
  {
    ## https://support.microsoft.com/en-us/kb/3128029
    if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7177.4999"))
    {
      report = 'File checked:     ' + path + "\xlsrv.dll" + '\n' +
               'File version:     ' + dllVer  + '\n' +
               'Vulnerable range: ' + "14.0 - 14.0.7177.4999" + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}

exit(99);
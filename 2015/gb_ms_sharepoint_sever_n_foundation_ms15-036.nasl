###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_sharepoint_sever_n_foundation_ms15-036.nasl 11635 2018-09-27 06:07:37Z cfischer $
#
# MS SharePoint Server and Foundation Elevation of Privilege Vulnerability (3052044)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:microsoft:sharepoint_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805167");
  script_version("$Revision: 11635 $");
  script_cve_id("CVE-2015-1653");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-27 08:07:37 +0200 (Thu, 27 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-04-15 15:21:41 +0530 (Wed, 15 Apr 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("MS SharePoint Server and Foundation Elevation of Privilege Vulnerability (3052044)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-036.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"flaw exists because the program does
  not validate input before returning it to users.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  authenticated attackers to execute arbitrary HTML and script code.");

  script_tag(name:"affected", value:"Microsoft SharePoint Server 2013 Service Pack 1,

  Microsoft SharePoint Foundation 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the given link, https://technet.microsoft.com/library/security/MS15-036");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/2965219");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-036");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/SharePoint/Server_or_Foundation_or_Services/Installed");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:CPE ) )
  if( ! infos = get_app_version_and_location( cpe:'cpe:/a:microsoft:sharepoint_foundation', exit_no_version:TRUE ) ) exit( 0 );

shareVer = infos['version'];
if(!shareVer) exit(0);

path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

## SharePoint Server and Foundation 2013 only for (sts)
if(shareVer =~ "^15\..*")
{
  path = path + "15.0\Bin";

  dllVer = fetch_file_version(sysPath:path, file_name:"Microsoft.office.server.conversions.launcher.exe");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4569.999"))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
  }
}

exit(99);
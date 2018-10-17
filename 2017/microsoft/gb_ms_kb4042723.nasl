###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4042723.nasl 11782 2018-10-08 14:01:44Z cfischer $
#
# Windows Server 2008 Defense in Depth (KB4042723)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811950");
  script_version("$Revision: 11782 $");
  script_cve_id("CVE-2017-13080");
  script_tag(name:"cvss_base", value:"2.9");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-08 16:01:44 +0200 (Mon, 08 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-10 18:23:04 +0530 (Fri, 10 Nov 2017)");
  script_name("Windows Server 2008 Defense in Depth (KB4042723)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4042723");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Microsoft has released an update for
  Microsoft Windows Server 2008 that provides enhanced security as a
  defense-in-depth measure.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to compromise integrity, availability, and confidentiality of the
  system.");

  script_tag(name:"affected", value:"Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the referenced link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4042723");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl", "gb_wmi_access.nasl");
  script_mandatory_keys("WMI/access_successful", "SMB/WindowsVersion");

  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("misc_func.inc");
include("wmi_file.inc");

if( hotfix_check_sp( win2008:3, win2008x64:3 ) <= 0 ) {
  exit( 0 );
}

infos = kb_smb_wmi_connectinfo();
if( ! infos ) exit( 0 );

handle = wmi_connect( host:infos["host"], username:infos["username_wmi_smb"], password:infos["password"] );
if( ! handle ) exit( 0 );

# TODO: Limit to a possible known common path
fileList = wmi_file_fileversion( handle:handle, fileName:"nwifi", fileExtn:"sys", includeHeader:FALSE );
wmi_close( wmi_handle:handle );
if( ! fileList || ! is_array( fileList ) ) {
  exit( 0 );
}

# Don't pass NULL to version functions below
maxVer = "unknown";

foreach filePath( keys( fileList ) ) {

  vers = fileList[filePath];

  if( vers && version = eregmatch( string:vers, pattern:"^([0-9.]+)" ) ) {

    if( version_is_less( version:version[1], test_version:maxVer ) ) {
      continue;
    } else {
      foundMax = TRUE;
      maxVer = version[1];
      maxPath = filePath;
    }
  }
}

if( foundMax ) {
  if(version_is_less( version:maxVer, test_version:"6.0.6002.24202" ) ) {
    report = report_fixed_ver( file_checked:maxPath, file_version:maxVer, vulnerable_range:"Less than 6.0.6002.24202" );
    security_message( port:0, data:report );
    exit( 0 );
  }
}

exit( 99 );
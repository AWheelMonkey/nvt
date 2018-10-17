###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_microsoft_data_odata_dos_vuln_sep18_win.nasl 11782 2018-10-08 14:01:44Z cfischer $
#
# 'Microsoft.Data.OData' Denial of Service Vulnerability Sep18 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
##########################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814211");
  script_version("$Revision: 11782 $");
  script_cve_id("CVE-2018-8269");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-08 16:01:44 +0200 (Mon, 08 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-09-17 14:45:59 +0530 (Mon, 17 Sep 2018)");
  script_name("'Microsoft.Data.OData' Denial of Service Vulnerability Sep18 (Windows)");

  script_tag(name:"summary", value:"This host is installed with 'OData Library'
  and is prone to a denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on
  the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in how the OData
  web application handles web requests.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to cause a denial of service against an OData web application.");

  script_tag(name:"affected", value:"Microsoft.Data.OData library");

  script_tag(name:"solution", value:"Upgrade to Microsoft.Data.OData library to
  version 5.8.4 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod", value:"75");

  script_xref(name:"URL", value:"https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2018-8269");
  script_xref(name:"URL", value:"https://www.nuget.org/packages/Microsoft.Data.OData/5.8.4");
  script_xref(name:"URL", value:"https://odata.github.io/odata.net/v6/#ODL-5.8.4");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Windows");
  script_dependencies("smb_reg_service_pack.nasl", "gb_wmi_access.nasl");
  script_mandatory_keys("WMI/access_successful", "SMB/WindowsVersion");

  exit(0);
}

include("smb_nt.inc");
include("version_func.inc");
include("misc_func.inc");
include("wmi_file.inc");

infos = kb_smb_wmi_connectinfo();
if( ! infos ) exit( 0 );

handle = wmi_connect( host:infos["host"], username:infos["username_wmi_smb"], password:infos["password"] );
if( ! handle ) exit( 0 );

# TODO: Limit to a possible known common path
fileList = wmi_file_fileversion( handle:handle, fileName:"Microsoft.Data.OData", includeHeader:FALSE );
wmi_close( wmi_handle:handle );
if( ! fileList || ! is_array( fileList ) ) {
  exit( 0 );
}

report = "";

foreach filePath( keys( fileList ) ) {

  vers = fileList[filePath];

  if( vers && version = eregmatch( string:vers, pattern:"^([0-9.]+)" ) ) {

    if( version_is_less( version:version[1], test_version:"5.8.4" ) ) {
      VULN = TRUE;
      report += report_fixed_ver( file_version:version[1], file_checked:filePath, fixed_version:"5.8.4" ) + '\n';
    }
  }
}

if( VULN ) {
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );
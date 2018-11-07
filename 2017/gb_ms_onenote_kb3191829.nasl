###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_onenote_kb3191829.nasl 70989 2017-03-23 10:00:49Z$
#
# Microsoft OneNote DLL Loading RCE Vulnerability Vulnerability (KB3191829)
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

CPE = "cpe:/a:microsoft:onenote";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810855");
  script_version("$Revision: 11959 $");
  script_cve_id("CVE-2017-0197");
  script_bugtraq_id(97411);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 12:33:40 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 15:58:01 +0530 (Wed, 12 Apr 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft OneNote DLL Loading RCE Vulnerability Vulnerability (KB3191829)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft security updates KB3191829 ");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaws exist when Office improperly
  validates input before loading dynamic link library (DLL) files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to take control of the affected system.");

  script_tag(name:"affected", value:"Microsoft OneNote 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3191829");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_onenote_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/OneNote/Ver");
  exit(0);
}

include("smb_nt.inc");
include("secpod_smb_func.inc");
include("version_func.inc");
include("host_details.inc");

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );

notePath = infos['location'];
if( ! notePath || "Could not find the install location" >< notePath ) {
  exit( 0 );
}

noteVer = fetch_file_version(sysPath:notePath, file_name:"onenotesyncpc.dll");
if(noteVer && noteVer =~ "^(12\.)") {
  if(version_in_range(version:noteVer, test_version:"12.0", test_version2:"12.0.6765.4999")) {
     report = 'File checked:     ' + notePath + "\onenotesyncpc.dll"  + '\n' +
              'File version:     ' + noteVer  + '\n' +
              'Vulnerable range: ' + "12 - 12.0.6765.4999" + '\n' ;
     security_message(data:report);
     exit(0);
  }
}

exit( 99 );

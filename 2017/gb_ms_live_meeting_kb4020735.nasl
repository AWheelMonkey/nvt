###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_live_meeting_kb4020735.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Microsoft Live Meeting Console Remote Code Execution Vulnerability (KB4020735)
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

CPE = "cpe:/a:microsoft:office_live_meeting";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810946");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2017-0283");
  script_bugtraq_id(98920);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-15 17:04:17 +0530 (Thu, 15 Jun 2017)");
  script_name("Microsoft Live Meeting Console Remote Code Execution Vulnerability (KB4020735)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4020735.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due the way Windows
  Uniscribe handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to execute arbitrary code on the affected system and
  take control of the affected system.");

  script_tag(name:"affected", value:"Microsoft Live Meeting 2007 Console");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/4020735");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_live_meeting_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/OfficeLiveMeeting/Ver");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4020735");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("host_details.inc");
include("secpod_smb_func.inc");

appPath = get_app_location(cpe:CPE);
if(!appPath ||  "Couldn find the install location" >< appPath){
  exit(0);
}

dllVer = fetch_file_version(sysPath:appPath, file_name:"Ogl.dll");
if(!dllVer){
  exit(0);
}

if(version_is_less(version:dllVer, test_version:"12.0.6769.5000"))
{
  report = 'File checked:     ' +  appPath + "\Ogl.dll"+ '\n' +
           'File version:     ' +  dllVer  + '\n' +
           'Vulnerable range: Less than 12.0.6769.5000\n' ;
  security_message(data:report);
  exit(0);
}

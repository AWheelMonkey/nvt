###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3191898.nasl 11901 2018-10-15 08:47:18Z mmartin $
#
# Microsoft Outlook 2007 Service Pack 3 Multiple Vulnerabilities (KB3191898)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810795");
  script_version("$Revision: 11901 $");
  script_cve_id("CVE-2017-8507", "CVE-2017-8508");
  script_bugtraq_id(98827, 98828);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 10:47:18 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 13:22:44 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Outlook 2007 Service Pack 3 Multiple Vulnerabilities (KB3191898)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3191898");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - A remote code execution vulnerability exists in the way that Microsoft
    Outlook parses specially crafted email messages.

  - A security feature bypass vulnerability exists in Microsoft Office software
    when it improperly handles the parsing of file formats.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to take control of an affected system.");

  script_tag(name:"affected", value:"Microsoft Outlook 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3191898");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Outlook/Version");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

outlookVer = get_kb_item("SMB/Office/Outlook/Version");

if(!outlookVer || !(outlookVer =~ "^12\.")){
  exit(0);
}

## Office outlook
outlookFile = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                              "\App Paths\OUTLOOK.EXE", item:"Path");
if(!outlookFile){
  exit(0);
}

outlookVer = fetch_file_version(sysPath:outlookFile, file_name:"outlook.exe");
if(!outlookVer){
  exit(0);
}

if(version_in_range(version:outlookVer, test_version:"12.0", test_version2:"12.0.6770.4999"))
{
  report = 'File checked:     ' +  outlookFile + "outlook.exe" + '\n' +
           'File version:     ' +  outlookVer  + '\n' +
           'Vulnerable range:  12.0 - 12.0.6770.4999'+ '\n' ;
  security_message(data:report);
  exit(0);
}

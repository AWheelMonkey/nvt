###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3118389.nasl 11919 2018-10-16 09:49:19Z mmartin $
#
# Microsoft Office 2010 Service Pack 2 Remote Code Execution Vulnerability (KB3118389)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811153");
  script_version("$Revision: 11919 $");
  script_cve_id("CVE-2017-8509");
  script_bugtraq_id(98812);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 11:49:19 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 08:41:08 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Office 2010 Service Pack 2 Remote Code Execution Vulnerability (KB3118389)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3118389");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the remote code
  execution vulnerability exist in Microsoft Office software when the Office
  software fails to properly handle objects in memory. ");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3118389");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Office 2010
new_key = "SOFTWARE\Microsoft\Office\14.0\Common\InstallRoot";
if(!registry_key_exists(key:new_key)){
  exit(0);
}

offPath = registry_get_sz(key:new_key, item:"Path");
if(offPath)
{
  exeVer = fetch_file_version(sysPath:offPath, file_name:"offowc.dll");
  if(exeVer =~ "^14\.")
  {
    if (version_in_range(version:exeVer, test_version:"14.0", test_version2:"14.0.7182.4999"))
    {
      report = 'File checked:  offowc.dll' + '\n' +
               'File version:     ' + exeVer  + '\n' +
               'Vulnerable range: 14.0 - 14.0.7182.4999\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}
exit(0);

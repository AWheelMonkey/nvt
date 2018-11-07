###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3213649.nasl 11977 2018-10-19 07:28:56Z mmartin $
#
# Microsoft Office Graphics Component Remote Code Execution Vulnerability (KB3213649)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811329");
  script_version("$Revision: 11977 $");
  script_cve_id("CVE-2017-8696");
  script_bugtraq_id(100780);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 09:28:56 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-13 16:39:23 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft Office Graphics Component Remote Code Execution Vulnerability (KB3213649)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB3213649");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to the way Windows
  Uniscribe handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information and execute
  arbitrary code in the context of current user.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3213649");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## MS Office 2007
offVer = get_kb_item("MS/Office/Ver");
if(!offVer || !(offVer =~ "^(12\.)")){
  exit(0);
}

offPath = registry_get_sz(key:"SOFTWARE\Microsoft\Office\12.0\Common\InstallRoot",
                          item:"Path");
if(!offPath){
  exit(0);
}

msdllVer = fetch_file_version(sysPath:offPath, file_name:"Usp10.dll");
if(!msdllVer){
  exit(0);
}

if(version_is_less(version:msdllVer, test_version:"1.626.6002.24173"))
{
  report = 'File checked:     ' + offPath + "Usp10.dll" + '\n' +
           'File version:     ' + msdllVer  + '\n' +
           'Vulnerable range: ' + "Less than 1.626.6002.24173" + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

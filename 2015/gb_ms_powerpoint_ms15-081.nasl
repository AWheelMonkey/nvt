###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_powerpoint_ms15-081.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Microsoft Office PowerPoint Multiple Remote Code Execution Vulnerabilities (3080790)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805089");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-2423");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-08-12 16:01:10 +0530 (Wed, 12 Aug 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office PowerPoint Multiple Remote Code Execution Vulnerabilities (3080790)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-081.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaws are due to improper handling of files
  in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft PowerPoint 2007 Service Pack 3 and prior,
  Microsoft PowerPoint 2010 Service Pack 2 and prior,
  Microsoft PowerPoint 2013 Service Pack 1 and prior.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3055051");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3055033");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3055029");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS15-081");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/Ver", "SMB/Office/PowerPnt/Version");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms15-081");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

pptVer = get_kb_item("SMB/Office/PowerPnt/Version");
if(!pptVer){
  exit(0);
}

# Office Power Point for 2007/2010/2013
path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"ProgramFilesDir");
if(!path){
  exit(0);
}

foreach ver (make_list("\OFFICE12", "\OFFICE14", "\OFFICE15"))
{
  offPath = path + "\Microsoft Office" + ver ;
  dllVer = fetch_file_version(sysPath:offPath, file_name:"ppcore.dll");

  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"12.0", test_version2:"12.0.6727.4999") ||
       version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7155.4999") ||
       version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4745.4999"))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
  }
}

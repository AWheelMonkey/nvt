###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_ms15-080.nasl 12485 2018-11-22 11:39:45Z cfischer $
#
# Microsoft Office Font Drivers Remote Code Execution Vulnerability (3078662)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805083");
  script_version("$Revision: 12485 $");
  script_cve_id("CVE-2015-2431", "CVE-2015-2435", "CVE-2015-2455", "CVE-2015-2456",
                "CVE-2015-2463", "CVE-2015-2464");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-22 12:39:45 +0100 (Thu, 22 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-08-12 12:46:32 +0530 (Wed, 12 Aug 2015)");
  script_name("Microsoft Office Font Drivers Remote Code Execution Vulnerability (3078662)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-080.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to improper handling of
  TrueType fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to execute arbitrary code on the affected system.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3
  Microsoft Office 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3054846");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3054890");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-080");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

officeVer = get_kb_item("MS/Office/Ver");

## MS Office 2007/2010
if(!officeVer || officeVer !~ "^1[24]\."){
  exit(0);
}

path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion", item:"CommonFilesDir");
if(path)
{
  foreach ver (make_list("OFFICE12", "OFFICE14"))
  {
    offPath = path + "\Microsoft Shared\" + ver;
    dllVer = fetch_file_version(sysPath:offPath, file_name:"Ogl.dll");

    if(dllVer &&
       (version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7155.4999") ||
        version_in_range(version:dllVer, test_version:"12.0", test_version2:"12.0.6725.4999")))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
  }
}

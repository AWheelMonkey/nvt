###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_and_compat_pack_ms14-061.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Microsoft Office and Compatibility Pack Remote Code Execution Vulnerability (3000434)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804494");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-4117");
  script_bugtraq_id(70360);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-10-15 11:05:58 +0530 (Wed, 15 Oct 2014)");

  script_name("Microsoft Office and Compatibility Pack Remote Code Execution Vulnerability (3000434)");

  script_tag(name:"summary", value:"This host is missing a important security
  update according to Microsoft Bulletin MS14-061.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an unspecified error when
  handling Microsoft Word files and can be exploited to execute arbitrary code
  via a specially crafted file.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute the arbitrary code, cause memory corruption and
  compromise the system.");

  script_tag(name:"affected", value:"Microsoft Office 2007 Service Pack 3 and prior
  Microsoft Office 2010 Service Pack 1 and prior");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/60973");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/2883008");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/2883031");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS14-061");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordCnv/Version");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Wwlibcxm.dll file not found on office 2010, as of now its not considered.
wordcnvVer = get_kb_item("SMB/Office/WordCnv/Version");
if(wordcnvVer && wordcnvVer =~ "^12.*")
{
  # Office Word Converter
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                              item:"ProgramFilesDir");
  if(path)
  {
    sysVer = fetch_file_version(sysPath:path + "\Microsoft Office\Office12", file_name:"Wordcnv.dll");

    if(sysVer)
    {
      ## Wwlibcxm.dll file not found on office 2010, as of now its not considered.
      if(version_in_range(version:sysVer, test_version:"12.0", test_version2:"12.0.6705.4999"))
      {
        security_message( port: 0, data: "The target host was found to be vulnerable" );
        exit(0);
      }
    }
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_lync_ms16-039.nasl 11837 2018-10-11 09:17:05Z asteins $
#
# Microsoft Lync Remote Code Execution Vulnerability (3148522)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807802");
  script_version("$Revision: 11837 $");
  script_cve_id("CVE-2016-0145");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-11 11:17:05 +0200 (Thu, 11 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-13 12:27:48 +0530 (Wed, 13 Apr 2016)");
  script_name("Microsoft Lync Remote Code Execution Vulnerability (3148522)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-039.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to error in font library
  while handling specially crafted embedded fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to execute arbitrary code on the affected system.");

  script_tag(name:"affected", value:"Microsoft Lync 2010
  Microsoft Lync 2013");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3148522");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114944");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3144427");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-039");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl", "secpod_ms_lync_detect_win.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Lync/Installed");

  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(get_kb_item("MS/Lync/Ver"))
{
  lyncPath = get_kb_item("MS/Lync/path");

  ## For MS Lync Basic
  if(!lyncPath){
    lyncPath = get_kb_item("MS/Lync/Basic/path");
  }

  if(lyncPath)
  {
    foreach ver (make_list("", "OFFICE14", "OFFICE15"))
    {
      commVer = fetch_file_version(sysPath:lyncPath + ver, file_name:"Rtmpltfm.dll");
      if(commVer)
      {
        if(commVer =~ "^4"){
           Vulnerable_range  =  "4.0.7577.4497";
        }
        else if(commVer =~ "^5"){
          Vulnerable_range  =  "5.0 - 5.0.8687.148";
        }
        if(version_in_range(version:commVer, test_version:"5.0", test_version2:"5.0.8687.148") ||
           version_in_range(version:commVer, test_version:"4.0", test_version2:"4.0.7577.4497"))
        {
          report = 'File checked:     ' + lyncPath + ver + "\Rtmpltfm.dll" + '\n' +
                   'File version:     ' + commVer  + '\n' +
                   'Vulnerable range: ' + Vulnerable_range + '\n' ;
          security_message(data:report);
          exit(0);
        }
      }
    }
  }
}

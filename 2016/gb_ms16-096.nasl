###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-096.nasl 11969 2018-10-18 14:53:42Z asteins $
#
# Microsoft Edge Multiple Vulnerabilities (3177358)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.808785");
  script_version("$Revision: 11969 $");
  script_cve_id("CVE-2016-3289", "CVE-2016-3293", "CVE-2016-3296", "CVE-2016-3319",
                "CVE-2016-3322", "CVE-2016-3326", "CVE-2016-3327", "CVE-2016-3329");
  script_bugtraq_id(92285, 92305, 92283, 92293, 92282, 92287, 92284, 92286);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 16:53:42 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-08-10 09:07:18 +0530 (Wed, 10 Aug 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Edge Multiple Vulnerabilities (3177358)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-096.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - A remote code execution vulnerability exist in the way that the
    Chakra JavaScript engine renders when handling objects in memory.

  - Multiple information disclosure vulnerabilities exists when the
    Microsoft Edge improperly handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code in the context of the current user, and
  obtain information to further compromise the user's system.");

  script_tag(name:"affected", value:"Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  references.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3177358");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-096");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_microsoft_edge_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Edge/Installed");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

edgedllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\edgehtml.dll");
if(!edgedllVer){
  exit(0);
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:edgedllVer, test_version:"11.0.10240.17071"))
  {
    Vulnerable_range = "Less than 11.0.10240.17071";
    VULN = TRUE ;
  }

  else if(version_in_range(version:edgedllVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.544"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.544";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Edgehtml.dll" + '\n' +
           'File version:     ' + edgedllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-084.nasl 11969 2018-10-18 14:53:42Z asteins $
#
# Microsoft Internet Explorer Multiple Vulnerabilities (3169991)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:microsoft:ie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808195");
  script_version("$Revision: 11969 $");
  script_cve_id("CVE-2016-3204", "CVE-2016-3240", "CVE-2016-3241", "CVE-2016-3242",
                "CVE-2016-3243", "CVE-2016-3245", "CVE-2016-3248", "CVE-2016-3259",
                "CVE-2016-3260", "CVE-2016-3261", "CVE-2016-3264", "CVE-2016-3273",
                "CVE-2016-3274", "CVE-2016-3276", "CVE-2016-3277");
  script_bugtraq_id(91584, 91568, 91569, 91570, 91571, 91585, 91578, 91581, 91580,
                    91575, 91598, 91576, 91591, 91593, 91596);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 16:53:42 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-07-13 08:27:39 +0530 (Wed, 13 Jul 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Internet Explorer Multiple Vulnerabilities (3169991)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-084.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to

  - An improper access of objects in memory by Internet Explorer.

  - An error in the way JScript 9 and VBScript engines render when
    handling objects in memory in Internet Explorer.

  - An improper validation of JavaScript in Microsoft Browser XSS Filter.

  - An error in parsing of HTML in Internet explorer.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to bypass security and gain the same user rights as the current user,
  leads to information disclosure, and memory curruption, also allows to perform
  remote code execution.");

  script_tag(name:"affected", value:"Microsoft Internet Explorer version
  9.x/10.x/11.x");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  references.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3169991");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-084");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/IE/Version");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, winVistax64:3, win2008x64:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win2012:1,  win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

iePath = smb_get_systemroot();
if(!iePath ){
  exit(0);
}

iedllVer = fetch_file_version(sysPath:iePath, file_name:"system32\Mshtml.dll");
if(!iedllVer){
  exit(0);
}

if(hotfix_check_sp(winVista:3, win2008:3, winVistax64:3, win2008x64:3) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16799"))
  {
    Vulnerable_range = "9.0.8112.16000 - 9.0.8112.16799";
    VULN = TRUE ;
  }
  else if(version_in_range(version:iedllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20914"))
  {
    Vulnerable_range = "9.0.8112.20000 - 9.0.8112.20914";
    VULN = TRUE ;
  }
}

## Only LDR version available, irrespective of underlying system, patch updates file to LDR
## Tested on Win 2012
else if(hotfix_check_sp(win2012:1) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.21895"))
  {
    Vulnerable_range = "10.0.9200.16000 - 10.0.9200.21895";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"11.0.9600.00000", test_version2:"11.0.9600.18377"))
  {
     Vulnerable_range = "11.0.9600.00000 - 11.0.9600.18377";
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"11.0.9600.00000", test_version2:"11.0.9600.18376"))
  {
     Vulnerable_range = "11.0.9600.00000 - 11.0.9600.18376";
     VULN = TRUE ;
  }
}
else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.493"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.493";
    VULN = TRUE ;
  }

  else if(version_is_less(version:iedllVer, test_version:"11.0.10240.17022"))
  {
    Vulnerable_range = "Less than 11.0.10240.17022";
    VULN = TRUE ;
  }
}


if(VULN)
{
  report = 'File checked:     ' + iePath + "\system32\Mshtml.dll" + '\n' +
           'File version:     ' + iedllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

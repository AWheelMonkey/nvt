###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-145.nasl 12096 2018-10-25 12:26:02Z asteins $
#
# Microsoft Edge Multiple Vulnerabilities (3204062)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810237");
  script_version("$Revision: 12096 $");
  script_cve_id("CVE-2016-7181", "CVE-2016-7206", "CVE-2016-7279", "CVE-2016-7280",
                "CVE-2016-7281", "CVE-2016-7282", "CVE-2016-7286", "CVE-2016-7287",
                "CVE-2016-7288", "CVE-2016-7296", "CVE-2016-7297");
  script_bugtraq_id(94735, 94737, 94719, 94750, 94723, 94724, 94748, 94722, 94749,
                    94738, 94751);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-25 14:26:02 +0200 (Thu, 25 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-14 08:20:30 +0530 (Wed, 14 Dec 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Edge Multiple Vulnerabilities (3204062)");

  script_tag(name:"summary", value:"This host is missing an critical security
  update according to Microsoft Bulletin MS16-145.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws are due to,

  - The microsoft browsers fail to correctly apply same origin policy for
    scripts running inside Web Workers.

  - The multiple memory corruption vulnerabilities.

  - The microsoftb rowsers do not properly validate content under specific
    conditions.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to bypass security, access sensitive information, execute arbitrary code and
  take control of an affected system. An attacker could then install programs,
  view, change, or delete data, or create new accounts with full user rights.");

  script_tag(name:"affected", value:"Microsoft Windows Server 2016
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64
  Microsoft Windows 10 Version 1607 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3204062");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-145");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-145");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

if(!egdeVer = fetch_file_version(sysPath:sysPath, file_name:"System32\Edgehtml.dll")){
  exit(0);
}

if(hotfix_check_sp(win10:1, win10x64:1, win2016:1) > 0)
{
  if(version_is_less(version:egdeVer, test_version:"11.0.10240.17202"))
  {
    Vulnerable_range = "Less than 11.0.10240.17202";
    VULN = TRUE ;
  }
  else if(version_in_range(version:egdeVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.712"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.712";
    VULN = TRUE ;
  }
  else if(version_in_range(version:egdeVer, test_version:"11.0.14393.0", test_version2:"11.0.14393.575"))
  {
    Vulnerable_range = "11.0.14393.0 - 11.0.14393.575";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Edgehtml.dll" + '\n' +
           'File version:     ' + egdeVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

exit(0);

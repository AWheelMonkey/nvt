###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-082.nasl 11614 2018-09-26 07:39:28Z asteins $
#
# Microsoft Windows Search Component Denial of Service Vulnerability (3165270)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808163");
  script_version("$Revision: 11614 $");
  script_cve_id("CVE-2016-3230");
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-26 09:39:28 +0200 (Wed, 26 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-06-15 08:50:23 +0530 (Wed, 15 Jun 2016)");
  script_name("Microsoft Windows Search Component Denial of Service Vulnerability (3165270)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-082");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to the search component
  fails to properly handle certain objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker to
  potenially escalate permissions or perform additional privileged actions on the
  target machine.");

  script_tag(name:"affected", value:"Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 7 x32/x64 Edition Service Pack 1
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1.
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-082");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3161958");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS16-082");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2, win2012:1, win2012R2:1,
                   win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

sysVer = fetch_file_version(sysPath, file_name:"System32\Structuredquery.dll");
if(!sysVer){
  exit(0);
}

if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Presently GDR information is not available.
  if(version_is_less(version:sysVer, test_version:"7.0.7601.23451"))
  {
    Vulnerable_range = "Less than 7.0.7601.23451";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  ## Presently GDR information is not available.
  if(version_is_less(version:sysVer, test_version:"7.0.9200.21858"))
  {
    Vulnerable_range = "Less than 7.0.9200.21858";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"7.0.9600.18334"))
  {
    Vulnerable_range = "Less than 7.0.9600.18334";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"7.0.10240.16942"))
  {
    Vulnerable_range = "Less than 7.0.10240.16942";
    VULN = TRUE ;
  }
  else if(version_in_range(version:sysVer, test_version:"7.0.10586.000", test_version2:"7.0.10586.419"))
  {
    Vulnerable_range = "7.0.10586.0 - 7.0.10586.419";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Structuredquery.dll" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

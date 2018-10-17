###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-112.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Internet Explorer Multiple Vulnerabilities (3104517)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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

CPE = "cpe:/a:microsoft:ie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805773");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2015-2427", "CVE-2015-6064", "CVE-2015-6065", "CVE-2015-6066",
                "CVE-2015-6068", "CVE-2015-6069", "CVE-2015-6070", "CVE-2015-6071",
                "CVE-2015-6072", "CVE-2015-6073", "CVE-2015-6074", "CVE-2015-6075",
                "CVE-2015-6076", "CVE-2015-6077", "CVE-2015-6078", "CVE-2015-6079",
                "CVE-2015-6080", "CVE-2015-6081", "CVE-2015-6082", "CVE-2015-6084",
                "CVE-2015-6085", "CVE-2015-6086", "CVE-2015-6087", "CVE-2015-6088",
                "CVE-2015-6089");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-11-11 08:52:04 +0530 (Wed, 11 Nov 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Internet Explorer Multiple Vulnerabilities (3104517)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-112.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Multiple improper memory object handling errors.

  - An error in the way that the JScript and VBScript engines render when handling
  objects in memory in Internet Explorer");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to sensitive information, bypass security restrictions,
  corrupt memory and potentially execute arbitrary code in the context of the
  current user.");

  script_tag(name:"affected", value:"Microsoft Internet Explorer version
  7.x/8.x/9.x/10.x/11.x");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  link, https://technet.microsoft.com/en-us/library/security/MS15-112");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3104517");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS15-112");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win8:1, win8x64:1, win2012:1,  win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

ieVer = get_app_version(cpe:CPE);
if(!ieVer || !(ieVer =~ "^(7|8|9|10|11)")){
  exit(0);
}

sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer = fetch_file_version(sysPath:sysPath, file_name:"system32\Mshtml.dll");
if(!dllVer){
  exit(0);
}

if(dllVer =~ "^(7\.0\.6002\.1)"){
  Vulnerable_range = "7.0.6002.18000 - 7.0.6002.19519";
}
else if (dllVer =~ "^(7\.0\.6002\.2)"){
  Vulnerable_range = "7.0.6002.23000 - 7.0.6002.23829";
}
else if (dllVer =~ "^(8\.0\.6001\.1)"){
  Vulnerable_range = "8.0.6001.18000 - 8.0.6001.19697";
}
else if (dllVer =~ "^(8\.0\.6001\.2)"){
  Vulnerable_range = "8.0.6001.20000 - 8.0.6001.23757";
}
else if (dllVer =~ "^(9\.0\.8112\.1)"){
  Vulnerable_range = "9.0.8112.16000 - 9.0.8112.16716";
}
else if (dllVer =~ "^(9\.0\.8112\.2)"){
  Vulnerable_range = "9.0.8112.20000 - 9.0.8112.20831";
}
else if (dllVer =~ "^(8\.0\.7601\.1)"){
  Vulnerable_range = "8.0.7601.17000 - 8.0.7601.19037";
}
else if (dllVer =~ "^(8\.0\.7601\.2)"){
  Vulnerable_range = "8.0.7601.22000 - 8.0.7601.23243";
}
else if (dllVer =~ "^(10\.0\.9200\.1)"){
  Vulnerable_range = "10.0.9200.16000 - 10.0.9200.17555";
}

if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_in_range(version:dllVer, test_version:"7.0.6002.18000", test_version2:"7.0.6002.19519")||
     version_in_range(version:dllVer, test_version:"7.0.6002.23000", test_version2:"7.0.6002.23829")||
     version_in_range(version:dllVer, test_version:"8.0.6001.18000", test_version2:"8.0.6001.19697")||
     version_in_range(version:dllVer, test_version:"8.0.6001.20000", test_version2:"8.0.6001.23757")||
     version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16716")||
     version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20831")){
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_in_range(version:dllVer, test_version:"8.0.7601.17000", test_version2:"8.0.7601.19037")||
     version_in_range(version:dllVer, test_version:"8.0.7601.22000", test_version2:"8.0.7601.23243")||
     version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16716")||
     version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20831")||
     version_in_range(version:dllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.17555")){
    VULN = TRUE ;
  }
  else if(version_in_range(version:dllVer, test_version:"10.0.9200.21000", test_version2:"10.0.9200.21672"))
  {
    Vulnerable_range = "10.0.9200.21000 - 10.0.9200.21672";
    VULN = TRUE ;
  }
  else if(version_in_range(version:dllVer, test_version:"11.0.9600.00000", test_version2:"11.0.9600.18097"))
  {
     Vulnerable_range = "11.0.9600.00000 - 11.0.9600.18097";
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
  if(version_in_range(version:dllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.17555")){
    VULN = TRUE ;
  }
  else if(version_in_range(version:dllVer, test_version:"10.0.9200.20000", test_version2:"10.0.9200.21672"))
  {
    Vulnerable_range = "10.0.9200.20000 - 10.0.9200.21672";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"11.0.9600.18098"))
  {
    Vulnerable_range = "Less than 11.0.9600.18098";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:dllVer, test_version:"11.0.10240.16590"))
  {
    Vulnerable_range = "Less than 11.0.10240.16590";
    VULN = TRUE ;
  }

  else if(version_in_range(version:dllVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.2"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.2";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Mshtml.dll" + '\n' +
           'File version:     ' + dllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

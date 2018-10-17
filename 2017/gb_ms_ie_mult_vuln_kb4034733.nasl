###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_ie_mult_vuln_kb4034733.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Microsoft Internet Explorer Multiple Vulnerabilities (KB4034733)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:microsoft:ie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811561");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2017-8635", "CVE-2017-8636", "CVE-2017-8641", "CVE-2017-8651",
                "CVE-2017-8653", "CVE-2017-8669", "CVE-2017-0228");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 12:38:50 +0530 (Wed, 14 Jun 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Internet Explorer Multiple Vulnerabilities (KB4034733)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft security updates KB4034733.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - The way JavaScript engines render when handling objects in memory in
    Microsoft browsers.

  - The way that Microsoft browser JavaScript engines render content when handling
    objects in memory.

  - The way that JavaScript engines render when handling objects in memory in
    Microsoft browsers.

  - The way that Internet Explorer improperly accesses objects in memory.

  - The way that Microsoft browsers improperly access objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to execute arbitrary code in the context of the current user, could gain the
  same user rights as the current user. If the current user is logged on with
  administrative user rights, an attacker who successfully exploited the
  vulnerability could take control of an affected system. An attacker could
  then install programs; view, change, or delete data; or create new accounts
  with full user rights.");

  script_tag(name:"affected", value:"Microsoft Internet Explorer version 9.x,
  10.x and 11.x");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory below.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4034733");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win2008:3, win2008x64:3, win7:2, win7x64:2, win2008r2:2,
                   win2012:1,  win2012R2:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

ieVer = get_app_version(cpe:CPE);
if(!ieVer || !(ieVer =~ "^(9|10|11)")){
  exit(0);
}

iePath = smb_get_system32root();
if(!iePath ){
  exit(0);
}

iedllVer = fetch_file_version(sysPath:iePath, file_name:"Mshtml.dll");
if(!iedllVer){
  exit(0);
}

##Server 2008
if(hotfix_check_sp(win2008:3, win2008x64:3) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16928"))
  {
    Vulnerable_range = "9.0.8112.16000 - 9.0.8112.16928";
    VULN = TRUE ;
  }
  else if(version_in_range(version:iedllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.21039"))
  {
    Vulnerable_range = "9.0.8112.20000 - 9.0.8112.21039";
    VULN = TRUE ;
  }
}

# Win 2012
else if(hotfix_check_sp(win2012:1) > 0)
{
  if(version_is_less(version:iedllVer, test_version:"10.0.9200.22227"))
  {
    Vulnerable_range = "Less than 10.0.9200.22227";
    VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1, win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_in_range(version:iedllVer, test_version:"11.0", test_version2:"11.0.9600.18762"))
  {
     Vulnerable_range = "11.0 - 11.0.9600.18762";
     VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + iePath + "\Mshtml.dll" + '\n' +
           'File version:     ' + iedllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

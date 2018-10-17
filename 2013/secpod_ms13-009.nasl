###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-009.nasl 11876 2018-10-12 12:20:01Z cfischer $
#
# Microsoft Internet Explorer Multiple Vulnerabilities (2792100)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.903300");
  script_version("$Revision: 11876 $");
  script_cve_id("CVE-2013-0015", "CVE-2013-0018", "CVE-2013-0019", "CVE-2013-0020",
                "CVE-2013-0021", "CVE-2013-0022", "CVE-2013-0023", "CVE-2013-0024",
                "CVE-2013-0025", "CVE-2013-0026", "CVE-2013-0027", "CVE-2013-0028",
                "CVE-2013-0029");
  script_bugtraq_id(57822, 57823, 57824, 57825, 57826, 57827, 57828, 57829, 57830,
                    57831, 57832, 57833, 57834);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:20:01 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-02-13 08:14:01 +0530 (Wed, 13 Feb 2013)");
  script_name("Microsoft Internet Explorer Multiple Vulnerabilities (2792100)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/52122/");
  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1028117");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-au/security/bulletin/ms13-009");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/IE/Version");
  script_tag(name:"impact", value:"Successful exploitation will allow the attackers to gain information of
  another domain or Internet Explorer zone and execution of arbitrary code.");
  script_tag(name:"affected", value:"Microsoft Internet Explorer version 6.x/7.x/8.x/9.x");
  script_tag(name:"insight", value:"- An error when handling the encoding for Shift_JIS auto-selection can be
    exploited to gain access to information in another domain or Internet
    Explorer zone.

  - Multiple use-after-free error related to,

     SetCapture

     COmWindowProxy

     CMarkup

     vtable

     LsGetTrailInfo

     CDispNode

     pasteHTML

     SLayoutRun

     InsertElement

     CPasteCommand

     CObjectElement and

     CHTML.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
  install the hotfixes from the referenced advisory.");
  script_tag(name:"summary", value:"This host is missing a critical security update according to
  Microsoft Bulletin MS13-009.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms13-009");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(xp:4, win2003:3, winVista:3, win2008:3, win7:2) <= 0){
  exit(0);
}

ieVer = get_kb_item("MS/IE/Version");
if(!ieVer || !(ieVer =~ "^(6|7|8|9|10)")){
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

if(hotfix_check_sp(xp:4) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.0.2900.6332") ||
     version_in_range(version:dllVer, test_version:"7.0.6000.00000", test_version2:"7.0.6000.17121")||
     version_in_range(version:dllVer, test_version:"7.0.6000.20000", test_version2:"7.0.6000.21323")||
     version_in_range(version:dllVer, test_version:"8.0.6001.18000", test_version2:"8.0.6001.19399")||
     version_in_range(version:dllVer, test_version:"8.0.6001.20000", test_version2:"8.0.6001.23467")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win2003:3) > 0)
{
  if(version_is_less(version:dllVer, test_version:"6.0.3790.5102") ||
     version_in_range(version:dllVer, test_version:"7.0.6000.00000", test_version2:"7.0.6000.17121")||
     version_in_range(version:dllVer, test_version:"7.0.6000.21000", test_version2:"7.0.6000.21323")||
     version_in_range(version:dllVer, test_version:"8.0.6001.18000", test_version2:"8.0.6001.19399")||
     version_in_range(version:dllVer, test_version:"8.0.6001.20000", test_version2:"8.0.6001.23467")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_in_range(version:dllVer, test_version:"7.0.6002.18000", test_version2:"7.0.6002.18765")||
     version_in_range(version:dllVer, test_version:"7.0.6002.22000", test_version2:"7.0.6002.23014")||
     version_in_range(version:dllVer, test_version:"8.0.6001.18000", test_version2:"8.0.6001.19399")||
     version_in_range(version:dllVer, test_version:"8.0.6001.20000", test_version2:"8.0.6001.23467")||
     version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16463")||
     version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20572")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win7:2) > 0)
{
  if(version_in_range(version:dllVer, test_version:"8.0.7600.16000", test_version2:"8.0.7600.17208")||
     version_in_range(version:dllVer, test_version:"8.0.7600.20000", test_version2:"8.0.7600.21418")||
     version_in_range(version:dllVer, test_version:"8.0.7601.16000", test_version2:"8.0.7601.18034")||
     version_in_range(version:dllVer, test_version:"8.0.7601.21000", test_version2:"8.0.7601.22198")||
     version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16463")||
     version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20572")||
     version_in_range(version:dllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.16440")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}

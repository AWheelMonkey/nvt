###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_mult_vuln_kb4015221.nasl 11879 2018-10-12 12:48:49Z mmartin $
#
# Microsoft Windows Multiple Vulnerabilities (KB4015221)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810927");
  script_version("$Revision: 11879 $");
  script_cve_id("CVE-2017-0166", "CVE-2017-0167", "CVE-2017-0178", "CVE-2017-0179",
                "CVE-2017-0180", "CVE-2017-0181", "CVE-2017-0182", "CVE-2017-0183",
                "CVE-2017-0184", "CVE-2017-0185", "CVE-2017-0186", "CVE-2017-0188",
                "CVE-2017-0189", "CVE-2017-0191", "CVE-2017-0192", "CVE-2017-0202",
                "CVE-2017-0203", "CVE-2017-0208", "CVE-2017-0210", "CVE-2017-0211",
                "CVE-2013-6629", "CVE-2017-0058", "CVE-2017-0156", "CVE-2017-0158",
                "CVE-2017-0160", "CVE-2017-0162", "CVE-2017-0163", "CVE-2017-0165");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:48:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-13 10:40:01 +0530 (Thu, 13 Apr 2017)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4015221)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Security update KB4015221.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists,

  - Microsoft Windows OLE when it fails an integrity-level check.

  - Internet Explorer does not properly enforce cross-domain policies.

  - Chakra scripting engine does not properly handle objects in memory.

  - Microsoft Edge improperly accesses objects in memory.

  - Edge Content Security Policy (CSP) fails to properly validate certain
    specially crafted documents.

  - Adobe Type Manager Font Driver (ATMFD.dll)  when it fails to properly
    handle objects in memory.

  - Windows kernel-mode driver fails to properly handle objects in memory.

  - win32k component improperly provides kernel information.

  - Microsoft Hyper-V Network Switch on a host server fails to properly
    validate input from a privileged user on a guest operating system.

  - LDAP request buffer lengths are improperly calculated.

  - Microsoft .NET Framework fails to properly validate input before loading
    libraries.

  - ADFS incorrectly treats requests coming from Extranet clients as Intranet
    requests.

  - An error in the way that the Scripting Engine renders when handling objects
    in memory in Microsoft browsers.

  - Microsoft Graphics Component fails to properly handle objects in memory.

  - open-source libjpeg image-processing library fails to properly handle
    objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to obtain information to further compromise the user's system, execute
  arbitrary code in the context of the current user, gain the same user rights as
  the current user, could take control of an affected system and cause a host
  machine to crash.");

  script_tag(name:"affected", value:"Microsoft Windows 10 x32/x64.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-gb/help/4015221");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

edgeVer = fetch_file_version(sysPath:sysPath, file_name:"Edgehtml.dll");
if(!edgeVer){
  exit(0);
}

if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  if(version_is_less(version:edgeVer, test_version:"11.0.10240.17354"))
  {
    report = 'File checked:     ' + sysPath + "\Edgehtml.dll" + '\n' +
             'File version:     ' + edgeVer  + '\n' +
             'Vulnerable range: Less than 11.0.10240.17354\n' ;
    security_message(data:report);
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_visual_studio_kb4087371.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft Visual Studio 2015 Update 3 Information Disclosure Vulnerability (KB4087371)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813140");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-1037");
  script_bugtraq_id(103715);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-17 16:46:08 +0530 (Tue, 17 Apr 2018)");
  script_name("Microsoft Visual Studio 2015 Update 3 Information Disclosure Vulnerability (KB4087371)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4091346");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists when Visual Studio improperly
  discloses limited contents of uninitialized memory while compiling program
  database (PDB) files.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to gain access to potentially sensitive information.");

  script_tag(name:"affected", value:"Microsoft Visual Studio 2015 Update 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4087371");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_ms_visual_prdts_detect.nasl");
  script_mandatory_keys("Microsoft/VisualStudio/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

vsVer = get_kb_item("Microsoft/VisualStudio/Ver");
if(!vsVer || !(vsVer =~ "^(14\.)")){
  exit(0);
}

os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\VisualStudio\14.0");
}

else if("x64" >< os_arch){
 key_list = make_list("SOFTWARE\Microsoft\VisualStudio\14.0", "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\14.0");
}

foreach key (key_list)
{
  installPath = registry_get_sz(key:key, item:"InstallDir");
  if(!installPath){
    continue;
  }

  dllVer = fetch_file_version(sysPath:installPath, file_name:"mspdbsrv.exe");
  if(dllVer && (version_is_less(version:dllVer, test_version:"14.0.24235.0")))
  {
    report = report_fixed_ver(file_checked: installPath + "mspdbsrv.exe",
                              file_version:dllVer, vulnerable_range:"14.0 - 14.0.24234");
    security_message(data:report);
    exit(0);
  }
}
exit(0);

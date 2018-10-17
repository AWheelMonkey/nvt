###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4022727.nasl 11879 2018-10-12 12:48:49Z mmartin $
#
# Microsoft Windows Multiple Vulnerabilities (KB4022727)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811196");
  script_version("$Revision: 11879 $");
  script_cve_id("CVE-2017-0193", "CVE-2017-8473", "CVE-2017-8474", "CVE-2017-8527",
                "CVE-2017-0218", "CVE-2017-0219", "CVE-2017-0282", "CVE-2017-8475",
                "CVE-2017-8476", "CVE-2017-8529", "CVE-2017-8530", "CVE-2017-8531",
                "CVE-2017-0283", "CVE-2017-0284", "CVE-2017-8477", "CVE-2017-8478",
                "CVE-2017-8532", "CVE-2017-0285", "CVE-2017-8479", "CVE-2017-8480",
                "CVE-2017-8533", "CVE-2017-8543", "CVE-2017-0287", "CVE-2017-0288",
                "CVE-2017-8481", "CVE-2017-8482", "CVE-2017-8483", "CVE-2017-8544",
                "CVE-2017-8547", "CVE-2017-8548", "CVE-2017-8549", "CVE-2017-0289",
                "CVE-2017-0291", "CVE-2017-0292", "CVE-2017-8484", "CVE-2017-8485",
                "CVE-2017-0294", "CVE-2017-0296", "CVE-2017-8489", "CVE-2017-0297",
                "CVE-2017-0298", "CVE-2017-8490", "CVE-2017-8491", "CVE-2017-0299",
                "CVE-2017-0300", "CVE-2017-8460", "CVE-2017-8492", "CVE-2017-8493",
                "CVE-2017-8494", "CVE-2017-8462", "CVE-2017-8464", "CVE-2017-8470",
                "CVE-2017-8471", "CVE-2017-8522", "CVE-2017-8523", "CVE-2017-8524",
                "CVE-2017-8465", "CVE-2017-8466", "CVE-2017-8468", "CVE-2017-8517",
		        "CVE-2017-8554", "CVE-2017-8575", "CVE-2017-8518");
  script_bugtraq_id(98878, 98852, 98902, 98933, 98897, 98898, 98885, 98853, 98903,
                    98953, 98863, 98819, 98920, 98918, 98854, 98845, 98820, 98914,
                    98856, 98857, 98821, 98824, 98922, 98923, 98862, 98858, 98859,
                    98826, 98932, 98954, 98955, 98929, 98835, 98836, 98847, 98860,
                    98837, 98839, 98865, 98840, 98867, 98869, 98884, 98901, 98887,
                    98870, 98850, 98855, 98900, 98818, 98848, 98849, 98926, 98928,
                    98930, 98843, 98844, 98846, 98895);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:48:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-15 16:09:05 +0530 (Thu, 15 Jun 2017)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4022727)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft KB4022727");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaw exists due to,

  - Users cannot print enhanced metafiles (EMF) or documents containing bitmaps
    rendered out of bounds using the BitMapSection (DIBSection) function.

  - Displays turn off unexpectedly even when 'Turn off display' is set to 'Never' in
    Power Options.

  - certutil.exe can no longer generate an export file (.epf) when attempting to
    recover a key for a version 1 certificate.

  - MSI files will no longer install when Device Guard is enabled.

  - A thin client becomes unusable and unresponsive when Unified Write Filter
   (UWF) with DISK mode is enabled causing NTFS errors with ID: 55 & ID: 130
   to be logged in the Event Logs.

  - For more info refer to reference link.

  - Microsoft Edge improperly accesses objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to gain the same user rights as the current user. If the current user is logged
  on with administrative user rights, an attacker who successfully exploited the
  vulnerability could take control of an affected system. An attacker could then
  install programs; view, change, or delete data; or create new accounts with full
  user rights.");

  script_tag(name:"affected", value:"Windows 10 for 32bit/x64-based Systems");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4022727");
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

if(version_in_range(version:edgeVer, test_version:"11.0.10240.0", test_version2:"11.0.10240.17442"))
{
  report = 'File checked:     ' + sysPath + "\Edgehtml.dll" + '\n' +
           'File version:     ' + edgeVer  + '\n' +
           'Vulnerable range: 11.0.10240.0 - 11.0.10240.17442\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

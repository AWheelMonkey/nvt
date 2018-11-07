###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_monthly_rollup_kb4015551.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# Microsoft Windows Monthly Rollup (KB4015551)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810850");
  script_version("$Revision: 11982 $");
  script_cve_id("CVE-2013-6629", "CVE-2017-0042", "CVE-2017-0058", "CVE-2017-0158",
		"CVE-2017-0163", "CVE-2017-0166", "CVE-2017-0168", "CVE-2017-0169",
		"CVE-2017-0180", "CVE-2017-0182", "CVE-2017-0183", "CVE-2017-0184",
		"CVE-2017-0185", "CVE-2017-0186", "CVE-2017-0188", "CVE-2017-0191",
		"CVE-2017-0192", "CVE-2017-0199", "CVE-2017-0201", "CVE-2017-0210",
		"CVE-2017-0211");
  script_bugtraq_id(63676, 96098, 97462, 97455, 97465, 97446, 97418, 97459, 97444,
                    97427, 97428, 97435, 97437, 97438, 97475, 97466, 97452, 97498,
                    97454, 97512, 97514);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-12 12:43:38 +0530 (Wed, 12 Apr 2017)");
  script_name("Microsoft Windows Monthly Rollup (KB4015551)");

  script_tag(name:"summary", value:"This host is missing a monthly rollup according
  to Microsoft KB4015551.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"This security update includes improvements and
  also resolves security vulnerabilities in Internet Explorer, Scripting Engine,
  Hyper-V, Win32K, Adobe Type Manager Font Driver, Microsoft Outlook, Graphics
  component, Lightweight Directory Access Protocol and Windows OLE.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute code or elevate user privileges, take control of the affected system,
  and access information from one domain and inject it into another domain.");

  script_tag(name:"affected", value:"Microsoft Windows Server 2012.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4015551");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4015551/windows-server-2012-update-kb4015551");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2012:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

gdiVer = fetch_file_version(sysPath:sysPath, file_name:"Ole32.dll");
if(!gdiVer){
  exit(0);
}

if(hotfix_check_sp(win2012:1) > 0)
{
  if(version_is_less(version:gdiVer, test_version:"6.2.9200.22104"))
  {
    report = 'File checked:     ' + sysPath + "\Ole32.dll" + '\n' +
             'File version:     ' + gdiVer  + '\n' +
             'Vulnerable range: Less than 6.2.9200.22104\n' ;
    security_message(data:report);
    exit(0);
  }
}
exit(0);

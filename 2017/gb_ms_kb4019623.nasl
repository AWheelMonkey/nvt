###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4019623.nasl 11879 2018-10-12 12:48:49Z mmartin $
#
# Microsoft Windows Multiple Vulnerabilities (KB4019623)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.811209");
  script_version("$Revision: 11879 $");
  script_cve_id("CVE-2017-0267", "CVE-2017-0268", "CVE-2017-0269", "CVE-2017-0270",
                "CVE-2017-0271", "CVE-2017-0272", "CVE-2017-0273", "CVE-2017-0274",
                "CVE-2017-0275", "CVE-2017-0276", "CVE-2017-0277", "CVE-2017-0278",
                "CVE-2017-0279", "CVE-2017-0280");
  script_bugtraq_id(98259, 98261, 98263, 98264, 98265, 98260, 98274, 98266,
                    98267, 98268, 98270, 98271, 98272, 98273);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:48:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-19 11:10:25 +0530 (Mon, 19 Jun 2017)");
  script_name("Microsoft Windows Multiple Vulnerabilities (KB4019623)");

  script_tag(name:"summary", value:"This host is missing a critical/important
  security update according to Microsoft KB4019623");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to the error in
  the way Microsoft Server Message Block 1.0 (SMBv1) server handles certain
  requests.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause the affected system to stop responding until it is manually
  restarted. Also successful exploitation will allow attacker to get sensitive
  data and execute arbitraty code in context of current user.");

  script_tag(name:"affected", value:"Microsoft Windows 8 x86/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4019623");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4025687");

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

if(hotfix_check_sp(win8:1, win8x64:1) <= 0){
  exit(0);
}

sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

if(!asVer = fetch_file_version(sysPath:sysPath, file_name:"drivers\srv.sys")){
  exit(0);
}

if(version_is_less(version:asVer, test_version:"6.2.9200.22137"))
{
  report = 'File checked:     ' + sysPath + "\drivers\srv.sys" + '\n' +
           'File version:     ' + asVer  + '\n' +
           'Vulnerable range: ' + 'Less than 6.2.9200.22137' + '\n' ;
  security_message(data:report);
  exit(0);
}

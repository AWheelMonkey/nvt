###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011244.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# Microsoft SharePoint Enterprise Server 2016 Multiple Vulnerabilities (KB4011244)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812129");
  script_version("$Revision: 11983 $");
  script_cve_id("CVE-2017-11876");
  script_bugtraq_id(101754);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-15 00:51:31 +0530 (Wed, 15 Nov 2017)");
  script_name("Microsoft SharePoint Enterprise Server 2016 Multiple Vulnerabilities (KB4011244)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011244");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Microsoft Project Server does not properly manage user sessions.

  - Microsoft has released an update for Microsoft Office that provides enhanced
    security as a defense-in-depth measure.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to compromise system's availability, integrity, and confidentiality.");

  script_tag(name:"affected", value:"Microsoft SharePoint Enterprise Server 2016");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011244");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_mandatory_keys("MS/SharePoint/Server/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:'cpe:/a:microsoft:sharepoint_server', exit_no_version:TRUE ) ) exit(0);
shareVer = infos['version'];
path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

if(shareVer =~ "^16\..*")
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    path = path + "\microsoft shared\Web Server Extensions\16\BIN";

    shareVer = fetch_file_version(sysPath:path, file_name:"Onetutil.dll");

    if(shareVer && version_in_range(version:shareVer, test_version:"16.0", test_version2:"16.0.4615.0999"))
    {
      report = report_fixed_ver(file_checked:path + "\Onetutil.dll",
                                file_version:shareVer, vulnerable_range:"16.0 - 16.0.4615.0999");
      security_message(data:report);
      exit(0);
    }
  }
}

exit(99);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011264.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# Microsoft Office Word Viewer Defense in Depth Update (KB4011264)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812132");
  script_version("$Revision: 11983 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-15 08:04:08 +0530 (Wed, 15 Nov 2017)");
  script_name("Microsoft Office Word Viewer Defense in Depth Update (KB4011264)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011264");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Microsoft has released an update for Microsoft
  Office that provides enhanced security as a defense-in-depth measure.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to
  compromise availability, integrity, and confidentiality of the system.");

  script_tag(name:"affected", value:"Microsoft Office Word Viewer");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011264");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");

  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

wordviewVer = "";
offPath = "";
dllVer = "";
exeVer = "";

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
if(!wordviewVer){
  exit(0);
}

wordviewPath = get_kb_item("SMB/Office/WordView/Install/Path");
if(!wordviewPath){
  wordviewPath = "Unable to fetch the install path";
}

if(wordviewVer =~ "^(11\.)" && version_is_less(version:wordviewVer, test_version:"11.0.8445"))
{
  report = report_fixed_ver(file_checked:wordviewPath + "wordview.exe",
                            file_version:wordviewVer, vulnerable_range:"11.0 - 11.0.8444");
  security_message(data:report);
  exit(0);
}
exit(0);

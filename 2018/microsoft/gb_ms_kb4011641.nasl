###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011641.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Microsoft Office Word Viewer Memory Corruption Vulnerability (KB4011641)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812723");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-0797");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-01-10 19:53:05 +0530 (Wed, 10 Jan 2018)");
  script_name("Microsoft Office Word Viewer Memory Corruption Vulnerability (KB4011641)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011641");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to Office software fails to
  properly handle RTF files.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to run arbitrary code in the context of the current user. If the current user
  is logged on with administrative user rights, an attacker could take control
  of the affected system.");

  script_tag(name:"affected", value:"Microsoft Office Word Viewer");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011641");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(wordviewVer =~ "^(11\.)" && version_is_less(version:wordviewVer, test_version:"11.0.8446"))
{
  report = report_fixed_ver(file_checked:wordviewPath + "wordview.exe",
                            file_version:wordviewVer, vulnerable_range:"11.0 - 11.0.8445");
  security_message(data:report);
  exit(0);
}
exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011065.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft Excel Viewer 2007 Service Pack 3 Remote Code Execution Vulnerability (KB4011065)
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
  script_oid("1.3.6.1.4.1.25623.1.0.811750");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-8631");
  script_bugtraq_id(100751);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-13 10:54:13 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft Excel Viewer 2007 Service Pack 3 Remote Code Execution Vulnerability (KB4011065)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011065");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an arror in Microsoft
  Office software when it fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  who successfully exploited the vulnerability to use a specially crafted file to
  perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Excel Viewer 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4011065");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/XLView/Version");

  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");


excelviewVer = get_kb_item("SMB/Office/XLView/Version");
if(!excelviewVer){
  exit(0);
}
if(excelviewVer =~ "^(12\.)" && version_is_less(version:excelviewVer, test_version:"12.0.6776.5000"))
{
  report = 'File checked:     Xlview.exe' + '\n' +
           'File version:     ' + excelviewVer  + '\n' +
           'Vulnerable range: 12.0 - 12.0.6776.4999' +  '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

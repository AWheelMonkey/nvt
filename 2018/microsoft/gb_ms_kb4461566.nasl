###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4461566.nasl 12963 2019-01-08 07:50:52Z ckuersteiner $
#
# Microsoft Excel Viewer 2007 Service Pack 3 Information Disclosure Vulnerability (KB4461566)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.814529");
  script_version("$Revision: 12963 $");
  script_cve_id("CVE-2018-8627");
  script_bugtraq_id(106120);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-08 08:50:52 +0100 (Tue, 08 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-12 12:30:30 +0530 (Wed, 12 Dec 2018)");
  script_name("Microsoft Excel Viewer 2007 Service Pack 3 Information Disclosure Vulnerability (KB4461566)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4461566");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists when Microsoft Excel software
  reads out of bound memory due to an uninitialized variable, which could disclose
  the contents of memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker to
  view out of bound memory.");

  script_tag(name:"affected", value:"Microsoft Excel Viewer 2007 Service Pack 3");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the Reference link.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4461566");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(excelviewVer =~ "^12\." && version_is_less(version:excelviewVer, test_version:"12.0.6805.5000"))
{
  report = report_fixed_ver(file_checked:"Xlview.exe",
                            file_version:excelviewVer, vulnerable_range:"12.0 - 12.0.6805.4999");
  security_message(data:report);
  exit(0);
}
exit(99);

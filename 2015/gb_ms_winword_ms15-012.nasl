###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_winword_ms15-012.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Microsoft Office Word Remote Code Execution Vulnerabilities (3032328)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805044");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-0064", "CVE-2015-0065");
  script_bugtraq_id(72463, 72465);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-02-11 10:47:57 +0530 (Wed, 11 Feb 2015)");
  script_name("Microsoft Office Word Remote Code Execution Vulnerabilities (3032328)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-012.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Remote code execution vulnerabilities
  exists in Microsoft office that is caused when Word improperly handles objects
  in memory while parsing specially crafted Office files.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary code on the affected system.");

  script_tag(name:"affected", value:"Microsoft Word 2007 SP3 and prior
  Microsoft Word 2010 Service Pack 2 and prior");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/kb/3032328");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/2956099");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/2956066");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms15-012");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Word/Version");
  exit(0);
}


include("version_func.inc");

winwordVer = get_kb_item("SMB/Office/Word/Version");

## Microsoft Office Word 2007/2010
if(winwordVer && winwordVer =~ "^(12|14).*")
{
  if(version_in_range(version:winwordVer, test_version:"12.0", test_version2:"12.0.6715.4999") ||
     version_in_range(version:winwordVer, test_version:"14.0", test_version2:"14.0.7143.4999"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}


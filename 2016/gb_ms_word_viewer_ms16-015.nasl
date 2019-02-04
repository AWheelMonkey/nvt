###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_viewer_ms16-015.nasl 12455 2018-11-21 09:17:27Z cfischer $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3134226)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807303");
  script_version("$Revision: 12455 $");
  script_cve_id("CVE-2016-0022", "CVE-2016-0052", "CVE-2016-0053");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 10:17:27 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-02-10 10:39:00 +0530 (Wed, 10 Feb 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerabilities (3134226)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-015.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Flaws are due to improper handling of files
  in the memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user.");

  script_tag(name:"affected", value:"Microsoft Word Viewer 2007");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3134226");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3114773");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/library/security/MS16-015");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms16-015");
  exit(0);
}


include("version_func.inc");

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
if(wordviewVer)
{
  if(version_in_range(version:wordviewVer, test_version:"11.0", test_version2:"11.0.8423"))
  {
    report = 'File checked:     Wordview.exe ' + '\n' +
             'File version:     ' + wordviewVer  + '\n' +
             'Vulnerable range: 11.0 - 11.0.8423 \n' ;
    security_message(data:report);
    exit(0);
  }
}

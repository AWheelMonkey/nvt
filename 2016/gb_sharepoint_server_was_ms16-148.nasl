###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sharepoint_server_was_ms16-148.nasl 11969 2018-10-18 14:53:42Z asteins $
#
# Microsoft SharePoint Server WAS Multiple Information Disclosure Vulnerabilities (3204068)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:microsoft:sharepoint_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809757");
  script_version("$Revision: 11969 $");
  script_cve_id("CVE-2016-7268", "CVE-2016-7290", "CVE-2016-7291");
  script_bugtraq_id(94672, 94670, 94671);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 16:53:42 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-12-14 13:01:47 +0530 (Wed, 14 Dec 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft SharePoint Server WAS Multiple Information Disclosure Vulnerabilities (3204068)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-148.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist as Microsoft Office
  software reads out of bound memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain access to potentially sensitive information.");

  script_tag(name:"affected", value:"Word Automation Services on Microsoft SharePoint Server 2010 Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  references.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3128026");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/ms16-148");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/SharePoint/Server/Ver");
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if( ! infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE ) ) exit( 0 );
shareVer = infos['version'];
path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

## SharePoint Server 2010
if(shareVer =~ "^14\..*")
{
  dllVer = fetch_file_version(sysPath:path,
            file_name:"\14.0\WebServices\WordServer\Core\sword.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7177.4999"))
    {
      report = 'File checked:     ' +  path + "\14.0\WebServices\WordServer\Core\sword.dll" + '\n' +
               'File version:     ' +  dllVer  + '\n' +
               'Vulnerable range: ' +  "14.0 - 14.0.7177.4999" + '\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}

exit(99);

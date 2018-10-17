###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sharepoint_foundation_ms14-022.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Microsoft SharePoint Foundation Multiple Vulnerabilities (2952166)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
CPE = "cpe:/a:microsoft:sharepoint_foundation";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804581");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2014-0251", "CVE-2014-1754");
  script_bugtraq_id(67283, 67288);
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-05-14 13:09:48 +0530 (Wed, 14 May 2014)");
  script_name("Microsoft SharePoint Foundation Multiple Vulnerabilities (2952166)");


  script_tag(name:"summary", value:"This host is missing an critical security update according to Microsoft
Bulletin MS14-022.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaws is due to multiple unspecified components when handling page content.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute the arbitrary
code and compromise a vulnerable system.");
  script_tag(name:"affected", value:"Microsoft SharePoint Foundation 2010 Service Pack 2 and prior,
Microsoft SharePoint Foundation 2013 Service Pack 1 and prior.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
install the hotfixes from the referenced advisory.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/57834");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/ms14-022");
  script_category(ACT_GATHER_INFO);
  script_family("Windows : Microsoft Bulletins");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/SharePoint/Foundation/Ver");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms14-022");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

shareVer = get_app_version(cpe:CPE);
if(!shareVer){
  exit(0);
}

key = "SOFTWARE\Microsoft\Shared Tools\Web Server Extensions\";
if(!registry_key_exists(key:key)){
  exit(0);
}

## SharePoint Foundation 2010
if(shareVer =~ "^14\..*")
{
  path = registry_get_sz(key: key + "14.0", item:"Location");

  dllVer = fetch_file_version(sysPath:path, file_name:"BIN\Onetutil.dll");
  if(dllVer)
  {
    if(version_in_range(version:dllVer, test_version:"14.0", test_version2:"14.0.7123.4999"))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
  }
}


## SharePoint Foundation 2013
if(shareVer =~ "^15\..*")
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    path = path + "\microsoft shared\SERVER15\Server Setup Controller";

    dllVer2 = fetch_file_version(sysPath:path, file_name:"Wsssetup.dll");
    if(dllVer2)
    {
      if(version_in_range(version:dllVer2, test_version:"15.0", test_version2:"15.0.4615.999"))
      {
        security_message( port: 0, data: "The target host was found to be vulnerable" );
        exit(0);
      }
    }
  }
}

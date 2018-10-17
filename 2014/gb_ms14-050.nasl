###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms14-050.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Microsoft SharePoint Server and Foundation Privilege Escalation Vulnerability
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

CPE = "cpe:/a:microsoft:sharepoint_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804741");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2014-2816");
  script_bugtraq_id(69099);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-08-13 17:07:01 +0530 (Wed, 13 Aug 2014)");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Microsoft SharePoint Server and Foundation Privilege Escalation Vulnerability");


  script_tag(name:"summary", value:"This host is missing an important security update according to
Microsoft Bulletin MS14-050.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaw is triggered when handling custom actions in a specially crafted
application.");
  script_tag(name:"impact", value:"Successful exploitation could allow an attacker to gain elevated privileges.");
  script_tag(name:"affected", value:"Microsoft SharePoint Server 2013,
Microsoft SharePoint Foundation 2013.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and
install the hotfixes from the referenced advisory.");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://support.microsoft.com/kb/2880994");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS14-050");
  script_category(ACT_GATHER_INFO);
  script_family("Windows : Microsoft Bulletins");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/SharePoint/Server_or_Foundation_or_Services/Installed");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms14-050");
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

shareVer = get_app_version(cpe:CPE);
if(!shareVer)
{
  CPE = "cpe:/a:microsoft:sharepoint_foundation";
  shareVer = get_app_version(cpe:CPE);
  if(!shareVer){
    exit(0);
  }
}

## SharePoint Server and Foundation 2013
if(shareVer =~ "^15\..*")
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    path = path + "\microsoft shared\SERVER15\Server Setup Controller";

    dllVer = fetch_file_version(sysPath:path, file_name:"Wsssetup.dll");
    if(dllVer)
    {
      if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4641.999"))
      {
        security_message( port: 0, data: "The target host was found to be vulnerable" );
        exit(0);
      }
    }
  }
}

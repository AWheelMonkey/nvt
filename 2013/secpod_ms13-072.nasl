###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-072.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Microsoft Office Remote Code Execution Vulnerabilities (2845537)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.903401");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-3160", "CVE-2013-3847", "CVE-2013-3848", "CVE-2013-3849",
                "CVE-2013-3850", "CVE-2013-3851", "CVE-2013-3852", "CVE-2013-3853",
                "CVE-2013-3854", "CVE-2013-3855", "CVE-2013-3856", "CVE-2013-3857",
                "CVE-2013-3858");
  script_bugtraq_id(62162, 62165, 62168, 62169, 62170, 62171, 62216, 62217, 62220,
                    62222, 62223, 62224, 62226);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-11 16:10:36 +0530 (Wed, 11 Sep 2013)");
  script_name("Microsoft Office Remote Code Execution Vulnerabilities (2845537)");


  script_tag(name:"summary", value:"This host is missing an important security update according to
Microsoft Bulletin MS13-072.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and install
  the hotfixes from the referenced advisory.");
  script_tag(name:"insight", value:"Multiple flaws are due to error exists when processing XML data and some
unspecified errors.");
  script_tag(name:"affected", value:"Microsoft Office 2003 Service Pack 3 and prior
Microsoft Office 2007 Service Pack 3 and prior");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute the arbitrary
code, cause memory corruption and compromise the system.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/54737");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2817474");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2760411");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2767913");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms13-072");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_ms_office_detection_900025.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("MS/Office/Ver", "MS/Office/InstallPath");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-072");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## MS Office 2003, 2007
if(!(get_kb_item("MS/Office/Ver") =~ "^(11|12).*")){
  exit(0);
}

InsPath = get_kb_item("MS/Office/InstallPath");
if(InsPath && "Could not find the install Location" >!< InsPath)
{
  foreach offsubver (make_list("Office11", "Office12"))
  {
    exeVer = fetch_file_version(sysPath:InsPath + offsubver, file_name:"mso.dll");
    if(exeVer)
    {
      if(version_in_range(version:exeVer, test_version:"11.0", test_version2:"11.0.8404") ||
         version_in_range(version:exeVer, test_version:"12.0", test_version2:"12.0.6683.4999"))
      {
        security_message( port: 0, data: "The target host was found to be vulnerable" );
        exit(0);
      }
    }
  }
}

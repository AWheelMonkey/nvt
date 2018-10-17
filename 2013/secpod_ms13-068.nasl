###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms13-068.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Microsoft Outlook Remote Code Execution Vulnerability (2756473)
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
  script_oid("1.3.6.1.4.1.25623.1.0.903400");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-3870");
  script_bugtraq_id(62188);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-11 15:21:46 +0530 (Wed, 11 Sep 2013)");
  script_name("Microsoft Outlook Remote Code Execution Vulnerability (2756473)");


  script_tag(name:"summary", value:"This host is missing a critical security update according to
Microsoft Bulletin MS13-068.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download and install
  the hotfixes from the referenced advisory.");
  script_tag(name:"insight", value:"The flaw is due to a double-free error within the 'CSMime::SMIMEINFOToOptions()'
function when handling nested signed S/MIME email messages.");
  script_tag(name:"affected", value:"Microsoft Outlook 2007 Service Pack 3 and prior
Microsoft Outlook 2010 Service Pack 2 and prior");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute the arbitrary
code and compromise a user system.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/54729");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2825999");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2794707");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms13-068");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/Outlook/Version");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms13-068");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");

outlookVer = get_kb_item("SMB/Office/Outlook/Version");
if(outlookVer && outlookVer =~ "^(12|14)\..*")
{
  if(version_in_range(version:outlookVer, test_version:"12.0", test_version2:"12.0.6680.4999") ||
     version_in_range(version:outlookVer, test_version:"14.0", test_version2:"14.0.7105.4999"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_prdts_mult_vuln_oct09_win.nasl 12629 2018-12-03 15:19:43Z cfischer $
#
# Adobe Reader/Acrobat Multiple Vulnerabilities - Oct09 (Windows)
#
# Authors:
# Nikta MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (C) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800957");
  script_version("$Revision: 12629 $");
  script_cve_id("CVE-2009-2979", "CVE-2009-2980", "CVE-2009-2981", "CVE-2009-2982",
                "CVE-2009-2983", "CVE-2009-2984", "CVE-2009-2985", "CVE-2009-2986",
                "CVE-2009-2987", "CVE-2009-2988", "CVE-2009-2989", "CVE-2009-2990",
                "CVE-2009-2991", "CVE-2009-2992", "CVE-2009-2993", "CVE-2009-2994",
                "CVE-2009-2995", "CVE-2009-2996", "CVE-2009-2997", "CVE-2009-2998",
                "CVE-2009-3458", "CVE-2009-3459", "CVE-2009-3460", "CVE-2009-3431");
  script_bugtraq_id(36686, 36687, 36688, 36691, 36667, 36690, 36680, 36682, 36693,
                    36665, 36669, 36689, 36694, 36681, 36671, 36678, 36677, 36600,
                    36638, 35148);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-12-03 16:19:43 +0100 (Mon, 03 Dec 2018) $");
  script_tag(name:"creation_date", value:"2009-10-22 15:34:45 +0200 (Thu, 22 Oct 2009)");
  script_name("Adobe Reader/Acrobat Multiple Vulnerabilities - Oct09 (Windows)");

  script_tag(name:"summary", value:"This host has Adobe Reader/Acrobat installed which is/are prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"For more information about the vulnerabilities, refer to the links mentioned
below.");
  script_tag(name:"impact", value:"Successful exploitation allows remote attackers to execute arbitrary code,
write arbitrary files or folders to the filesystem, escalate local privileges,
or cause a denial of service on an affected system by tricking the user to
open a malicious PDF document.");
  script_tag(name:"affected", value:"Adobe Reader and Acrobat version 7.x before 7.1.4, 8.x before 8.1.7 and 9.x
before 9.2 on Windows.");
  script_tag(name:"solution", value:"Upgrade to Adobe Acrobat and Reader versions 9.2, 8.1.7, or 7.1.4 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/36983");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/53691");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/2851");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/2898");
  script_xref(name:"URL", value:"http://securitytracker.com/alerts/2009/Oct/1023007.html");
  script_xref(name:"URL", value:"http://www.adobe.com/support/security/bulletins/apsb09-15.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Air_or_Flash_or_Reader_or_Acrobat/Win/Installed");
  script_xref(name:"URL", value:"http://www.adobe.com/downloads/");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = "cpe:/a:adobe:acrobat_reader";
if(readerVer = get_app_version(cpe:CPE, nofork:TRUE))
{
  if(readerVer =~ "^(7|8|9)")
  {
    if(version_in_range(version:readerVer, test_version:"7.0", test_version2:"7.1.3")||
       version_in_range(version:readerVer, test_version:"8.0", test_version2:"8.1.6")||
       version_in_range(version:readerVer, test_version:"9.0", test_version2:"9.1.3"))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
  }
}

CPE = "cpe:/a:adobe:acrobat";
if(acrobatVer = get_app_version(cpe:CPE))
{
  if(version_in_range(version:acrobatVer, test_version:"7.0", test_version2:"7.1.3")||
     version_in_range(version:acrobatVer, test_version:"8.0", test_version2:"8.1.6")||
     version_in_range(version:acrobatVer, test_version:"9.0", test_version2:"9.1.3")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

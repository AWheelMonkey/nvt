###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_silverlight_ms15-080_macosx.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Microsoft Silverlight Remote Code Execution Vulnerability (3078662) (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:microsoft:silverlight";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806014");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-2435", "CVE-2015-2455", "CVE-2015-2456", "CVE-2015-2463",
                "CVE-2015-2464");
  script_bugtraq_id(76238, 76216, 76241, 76239, 76240);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-08-13 11:13:34 +0530 (Thu, 13 Aug 2015)");
  script_name("Microsoft Silverlight Remote Code Execution Vulnerability (3078662) (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-080.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to improper memory
  operations performed by the affected software while handling content with
  crafted TrueType fonts.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to execute arbitrary code in the context of the vulnerable application. Failed
  exploit attempts will result in a denial-of-service condition.");

  script_tag(name:"affected", value:"Microsoft Silverlight version 5 on Mac OS X.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and install the hotfixes from the referenced advisory.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/kb/3080333");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS15-080");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_ms_silverlight_detect_macosx.nasl");
  script_mandatory_keys("MS/Silverlight/MacOSX/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!msl_ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(msl_ver=~ "^5\.")
{
  if(version_in_range(version:msl_ver, test_version:"5.0", test_version2:"5.1.40727"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_unspecified_vuln03_aug14_win.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Oracle VM VirtualBox Unspecified Vulnerability-03 Aug2014 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804696");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-4228");
  script_bugtraq_id(68601);
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-08-04 10:51:06 +0530 (Mon, 04 Aug 2014)");
  script_name("Oracle VM VirtualBox Unspecified Vulnerability-03 Aug2014 (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_mandatory_keys("Oracle/VirtualBox/Win/Ver");

  script_xref(name:"URL", value:"http://secunia.com/advisories/59510");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujul2014-1972956.html");

  script_tag(name:"summary", value:"This host is installed with Oracle VM VirtualBox and is prone to unspecified
  vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to unspecified error related to the Graphics driver (WDDM)
  for Windows guests.");

  script_tag(name:"impact", value:"Successful exploitation will allow local users to affect confidentiality,
  integrity, and availability via unknown vectors.");
  script_tag(name:"affected", value:"Oracle VM VirtualBox before versions 4.1.34, 4.2.26, and 4.3.12");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!virtualVer = get_app_version(cpe:CPE)){
  CPE="cpe:/a:sun:virtualbox";
  if(!virtualVer = get_app_version(cpe:CPE)){
    exit(0);
  }
}

if(virtualVer =~ "^4\.[1-3]"){
  if(version_in_range(version:virtualVer, test_version:"4.1.0", test_version2:"4.1.33")||
     version_in_range(version:virtualVer, test_version:"4.2.0", test_version2:"4.2.25")||
     version_in_range(version:virtualVer, test_version:"4.3.0", test_version2:"4.3.11")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

exit(99);
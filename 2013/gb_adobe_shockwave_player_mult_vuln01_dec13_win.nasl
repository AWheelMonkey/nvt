###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_shockwave_player_mult_vuln01_dec13_win.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Adobe Shockwave Player Multiple Vulnerabilities-01 Dec13 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:shockwave_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804172");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-5334", "CVE-2013-5333");
  script_bugtraq_id(64197, 64200);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-12-18 18:10:27 +0530 (Wed, 18 Dec 2013)");
  script_name("Adobe Shockwave Player Multiple Vulnerabilities-01 Dec13 (Windows)");


  script_tag(name:"summary", value:"This host is installed with Adobe Shockwave Player and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to version 12.0.7.148 or later.");
  script_tag(name:"insight", value:"Flaws are due to multiple unspecified errors.");
  script_tag(name:"affected", value:"Adobe Shockwave Player before 12.0.7.148 on Windows.");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code, cause
memory corruption and compromise a user's system.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/55952");
  script_xref(name:"URL", value:"http://helpx.adobe.com/security/products/shockwave/apsb13-29.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_shockwave_player_detect.nasl");
  script_mandatory_keys("Adobe/ShockwavePlayer/Ver");
  script_xref(name:"URL", value:"http://get.adobe.com/shockwave");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:playerVer, test_version:"12.0.7.148"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_air_code_exec_vuln_jun13_win.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Adobe Air Remote Code Execution Vulnerability -June13 (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:adobe_air";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803664");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-3343");
  script_bugtraq_id(60478);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-06-18 15:20:47 +0530 (Tue, 18 Jun 2013)");
  script_name("Adobe Air Remote Code Execution Vulnerability -June13 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/53751");
  script_xref(name:"URL", value:"http://www.adobe.com/support/security/bulletins/apsb13-16.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("Adobe/Air/Win/Installed");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute arbitrary
  code on the target system or cause a denial of service (memory corruption)
  via unspecified vectors.");
  script_tag(name:"affected", value:"Adobe Air 3.7.0.1860 and earlier on Windows");
  script_tag(name:"insight", value:"Unspecified flaw due to improper sanitization of user-supplied input.");
  script_tag(name:"solution", value:"Update to Adobe Air version 3.7.0.2090 or later.");
  script_tag(name:"summary", value:"This host is installed with Adobe Air and is prone to remote code
  execution vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://get.adobe.com/air");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if( version_is_less_equal( version:vers, test_version:"3.7.0.1860" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.7.0.2090", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );
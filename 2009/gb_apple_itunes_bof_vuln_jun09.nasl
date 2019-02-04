###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_itunes_bof_vuln_jun09.nasl 12670 2018-12-05 14:14:20Z cfischer $
#
# Apple iTunes 'itms:' URI Stack Buffer Overflow Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apple:itunes";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800804");
  script_version("$Revision: 12670 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-05 15:14:20 +0100 (Wed, 05 Dec 2018) $");
  script_tag(name:"creation_date", value:"2009-06-04 07:18:37 +0200 (Thu, 04 Jun 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0950");
  script_bugtraq_id(35157);
  script_name("Apple iTunes 'itms:' URI Stack Buffer Overflow Vulnerability");
  script_xref(name:"URL", value:"http://support.apple.com/kb/HT3592");
  script_xref(name:"URL", value:"http://www.securitytracker.com/alerts/2009/Jun/1022313.html");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_apple_itunes_detection_win_900123.nasl");
  script_mandatory_keys("iTunes/Win/Installed");

  script_tag(name:"impact", value:"Successful attacks will lead to buffer overflow or denial of service to
  legitimate users.");

  script_tag(name:"affected", value:"Apple iTunes version prior to 8.2 on Windows.");

  script_tag(name:"insight", value:"Error occurs when application fails to perform adequate boundary checks
  before copying user-supplied data to an insufficiently-sized buffer while
  processing a specially crafted 'itms:' URL.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"solution", value:"Upgrade to Apple iTunes Version 8.2.");

  script_tag(name:"summary", value:"This host has Apple iTunes installed, which is prone to stack
  based Buffer Overflow vulnerability.");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if( version_is_less( version:vers, test_version:"8.2.0.23" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"8.2.0.23", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );
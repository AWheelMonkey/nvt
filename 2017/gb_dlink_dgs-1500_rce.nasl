###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dlink_dgs-1500_rce.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# D-Link DGS-1500 Ax RCE Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107253");
  script_version("$Revision: 11874 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-11-09 14:03:54 +0700 (Thu, 09 Nov 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2017-15909");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("D-Link DGS-1500 Ax RCE Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_dgs_1500_detect.nasl");
  script_mandatory_keys("dgs/1500/detected");

  script_tag(name:"summary", value:"D-Link DGS-1500 Ax devices before 2.51B021 is vulnerable to remote code execution.");

  script_tag(name:"vuldetect", value:"Checks the version.");

  script_tag(name:"insight", value:"The vulnerability is due to hardcoded password in D-Link DGS-1500 Ax devices before 2.51B021.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to obtain shell access.");

  script_tag(name:"affected", value:"D-Link DGS-1500 Ax devices before 2.51B021");

  script_tag(name:"solution", value:"Update the firmware to version 2.51B021 or higher.");

  script_xref(name:"URL", value:"ftp://ftp2.dlink.com/PRODUCTS/DGS-1500-20/REVA/DGS-1500_REVA_FIRMWARE_PATCH_NOTES_2.51.021_EN.pdf");
  script_xref(name:"URL", value:"ftp://ftp2.dlink.com/PRODUCTS/DGS-1500-28/REVA/DGS-1500_REVA_FIRMWARE_PATCH_NOTES_2.51.021_EN.pdf");
  script_xref(name:"URL", value:"ftp://ftp2.dlink.com/PRODUCTS/DGS-1500-28P/REVA/DGS-1500_REVA_FIRMWARE_PATCH_NOTES_2.51.021_EN.pdf");
  script_xref(name:"URL", value:"ftp://ftp2.dlink.com/PRODUCTS/DGS-1500-52/REVA/DGS-1500_REVA_FIRMWARE_PATCH_NOTES_2.51.021_EN.pdf");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

cpe_list = make_list( "cpe:/o:d-link:dgs-1500-20_firmware", "cpe:/o:d-link:dgs-1500-28_firmware", "cpe:/o:d-link:dgs-1500-28p_firmware", "cpe:/o:d-link:dgs-1500-52_firmware");

if( ! infos = get_all_app_port_from_list( cpe_list:cpe_list ) ) exit( 0 );

cpe = infos['cpe'];
port = infos['port'];

if( ! firmware = get_app_version( cpe:cpe, port:port ) ) exit( 0 );

if (version_is_less(version: firmware, test_version: "2.51B021")) {
  report = report_fixed_ver(installed_version: firmware, fixed_version: "2.51B021");
  security_message(port: 0, data: report);
  exit(0);
}

exit(0);

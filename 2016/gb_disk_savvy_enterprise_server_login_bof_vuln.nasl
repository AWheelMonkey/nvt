##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_disk_savvy_enterprise_server_login_bof_vuln.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# Disk Savvy Enterprise Server Buffer Overflow Vulnerability
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:disksavvy:disksavvy_enterprise";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809486");
  script_version("$Revision: 11523 $");
  script_cve_id("CVE-2017-6187");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-12-02 17:06:55 +0530 (Fri, 02 Dec 2016)");
  script_name("Disk Savvy Enterprise Server Buffer Overflow Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_disk_savvy_enterprise_server_detect.nasl");
  script_mandatory_keys("DiskSavvy/Enterprise/Server/installed");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"http://www.disksavvy.com");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/41436/");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/41146/");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40854/");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40834/");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40459/");

  script_tag(name:"summary", value:"The host is running Disk Savvy Enterprise
  Server and is prone to buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect nvt and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an error when processing
  web requests and can be exploited to cause a buffer overflow via an overly long
  string passed to 'Login' request.");

  script_tag(name:"impact", value:"Successful exploitation may allow remote
  attackers to cause the application to crash, creating a denial-of-service
  condition.");

  script_tag(name:"affected", value:"Disk Savvy Enterprise version 9.4.18 and prior.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"9.4.18" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"None Available");
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );

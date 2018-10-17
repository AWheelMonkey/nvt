###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_coldfusion_mult_vuln03_may.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Adobe ColdFusion Multiple Vulnerabilities-03 May-2014
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
CPE = "cpe:/a:adobe:coldfusion";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804445");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-0625", "CVE-2013-0629");
  script_bugtraq_id(57164, 57165);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-05-06 16:22:22 +0530 (Tue, 06 May 2014)");
  script_name("Adobe ColdFusion Multiple Vulnerabilities-03 May-2014");


  script_tag(name:"summary", value:"This host is running Adobe ColdFusion and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple flaws are due to,

  - The CFIDE/componentutils/cfcexplorer.cfc script not properly sanitizing
  user input, specifically directory traversal attacks supplied via the
  'path' parameter when 'method' is set to:'getcfcinhtml' and 'name' is
   set to 'CFIDE.adminapi.administrator'.

  - The 'ScheduledURL' variable allows specifying an arbitrary resource to save
  to system as specified by the 'publish_file' variable and then schedule this
  task to be executed at a set time. ");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to disclose the contents of
arbitrary files on the system and execute arbitrary code.");
  script_tag(name:"affected", value:"Adobe ColdFusion 9.0, 9.0.1, 9.0.2, and 10");
  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/24946");
  script_xref(name:"URL", value:"http://www.adobe.com/support/security/bulletins/apsb13-03.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_coldfusion_detect.nasl");
  script_mandatory_keys("coldfusion/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!smgPort = get_app_port(cpe:CPE)){
  exit(0);
}

smgVer = get_app_version(cpe:CPE, port:smgPort);
if(!smgVer || "unknown" >< smgVer){
  exit(0);
}

if(version_is_equal(version:smgVer, test_version:"9.0.0.251028") ||
   version_is_equal(version:smgVer, test_version:"9.0.1.274733") ||
   version_is_equal(version:smgVer, test_version:"9.0.2.282541") ||
   version_is_equal(version:smgVer, test_version:"10.0.0.282462"))
{
  security_message(port:smgPort);
  exit(0);
}

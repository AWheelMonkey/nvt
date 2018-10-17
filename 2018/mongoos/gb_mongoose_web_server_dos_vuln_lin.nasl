###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mongoose_web_server_dos_vuln_lin.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# Mongoose Web Server 'mg_handle_cgi' Function Denial of Service Vulnerability (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:cesanta:mongoose";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813632");
  script_version("$Revision: 10965 $");
  script_cve_id("CVE-2018-10945");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-09 14:45:19 +0530 (Mon, 09 Jul 2018)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Mongoose Web Server 'mg_handle_cgi' Function Denial of Service Vulnerability (Linux)");

  script_tag(name:"summary", value:"The host is installed with Mongoose Web Server
  Server and is prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to heap-based buffer over-read
  error in 'mg_handle_cgi' function in 'mongoose.c' script.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to
  cause a denial of service.

  Impact Level: Application");

  script_tag(name:"affected", value:"Mongoose version 6.11");

  script_tag(name:"solution", value:"No known solution is available as of 09th July, 2018.
  Information regarding this issue will be updated once solution details are available.");

  script_tag(name:"solution_type", value:"NoneAvailable");
  script_xref(name:"URL", value:"http://blog.hac425.top/2018/05/16/CVE-2018-10945-mongoose.html");
  script_xref(name:"URL", value:"https://cesanta.com");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("gb_mongoose_web_server_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("Cesanta/Mongoose/installed", "Host/runs_unixoide");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!mongoPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location( cpe:CPE, port:mongoPort, exit_no_version:TRUE);
mongoVer = infos['version'];
mongoPath = infos['location'];

if(mongoVer == "6.11")
{
  report = report_fixed_ver(installed_version:mongoVer, fixed_version:"NoneAvailable", install_path:mongoPath);
  security_message(data:report, port:mongoPort);
  exit(0);
}

exit(0);

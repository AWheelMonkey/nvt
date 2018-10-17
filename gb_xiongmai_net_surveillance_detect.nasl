###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xiongmai_net_surveillance_detect.nasl 11799 2018-10-09 18:44:23Z tpassfeld $
#
# Xiongmai Net Surveillance Remote Detection
#
# Authors:
# Thorsten Passfeld <thorsten.passfeld@greenbone.net>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.114038");
  script_version("$Revision: 11799 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-09 20:44:23 +0200 (Tue, 09 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-09 19:01:40 +0200 (Tue, 09 Oct 2018)");
  script_name("Xiongmai Net Surveillance Remote Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detects the installation of Xiongmai
  Net Surveillance.

  This script sends HTTP GET request and try to ensure the presence of
  Xiongmai Net Surveillance.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);


url1 = "/Login.htm";
res1 = http_get_cache(port: port, item: url1);
url2 = "/English.js";
res2 = http_get_cache(port: port, item: url2);

if("Hash.Cookie('NetSuveillanceWebCookie'" >< res1 && "$('passWordInput').setText(Translate.pswd);" >< res1
  && 'title:"Digital Video Recorder"' >< res2 && 'MFt:"MainStream"' >< res2) {

  #Login required for version detection.
  version = "unknown";

  set_kb_item(name: "xiongmai/net_surveillance/detected", value: TRUE);
  set_kb_item(name: "xiongmai/net_surveillance/" + port + "/detected", value: TRUE);

  cpe = "cpe:/a:xiongmai:net_surveillance:";

  conclUrl = report_vuln_url(port: port, url: url1, url_only: TRUE);

  register_and_report_cpe(app: "Xiongmai Net Surveillance",
                          ver: version,
                          base: cpe,
                          expr: "^([0-9.a-z]+)",
                          insloc: "/",
                          regPort: port,
                          conclUrl: conclUrl,
                          extra: "Login required for version detection.");
}

exit(0);

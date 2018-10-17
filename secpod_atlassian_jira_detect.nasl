###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_atlassian_jira_detect.nasl 10888 2018-08-10 12:08:02Z cfischer $
#
# Atlassian JIRA Detection
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902046");
  script_version("$Revision: 10888 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 14:08:02 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-04-30 15:20:35 +0200 (Fri, 30 Apr 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Atlassian JIRA Detection");

  script_tag(name:"summary", value:"Detection of Atlassian JIRA

The script sends a connection request to the server and attempts to detect the presence of Atlassian JIRA
and to extract its version");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"https://www.atlassian.com/software/jira");


  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 8080);

foreach dir (make_list_unique("/jira", cgi_dirs(port: port))) {

  install = dir;
  if (dir == "/") dir = "";

  rcvRes = http_get_cache(port: port, item: dir + "/login.jsp");

  if("Atlassian JIRA" >< rcvRes && "/secure/Dashboard.jspa" >< rcvRes)
  {
    version = "unknown";
    vers = eregmatch(pattern: '<meta name="ajs-version-number" content="([0-9.]+)">', string:rcvRes);
    if (!isnull(vers[1]))
      version = vers[1];

    set_kb_item(name: "atlassian_jira/installed", value: TRUE);
    if (version != "unknown")
      set_kb_item(name: "atlassian_jira/version", value: version);

    cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:atlassian:jira:");
    if (!cpe)
      cpe = "cpe:/a:atlassian:jira";

    register_product(cpe: cpe, location: install, port: port);

    log_message(data: build_detection_report(app: "Atlassian JIRA", version: version, install: install,
                                             cpe: cpe, concluded: vers[0]),
                port: port);

    exit(0);
  }
}

exit(0);

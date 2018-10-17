###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_mult_vuln_may09.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Wordpress Multiple Vulnerabilities
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800704");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-05-11 08:41:11 +0200 (Mon, 11 May 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-6767", "CVE-2008-6762");
  script_name("Wordpress Multiple Vulnerabilities");
  script_xref(name:"URL", value:"http://archives.neohapsis.com/archives/bugtraq/2008-12/0226.html");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("wordpress/installed");
  script_tag(name:"impact", value:"Attackers can exploit this issue to causes denial of service or to redirect
  the URL to any malicious website and conduct phishing attacks.");
  script_tag(name:"affected", value:"Wordpress version 2.6.x");
  script_tag(name:"insight", value:"Multiple flaws are due to lack of sanitization in user supplied data which
  can be exploited through 'wp-admin/upgrade.php' via a direct request and
  'wp-admin/upgrade.php' via a URL in the backto parameter.");
  script_tag(name:"solution", value:"Upgrade your wordpress to the latest version 2.7.1
  http://wordpress.org");
  script_tag(name:"summary", value:"This host has Wordpress installed and is prone to Multiple
  Vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("http_func.inc");
include("host_details.inc");

wordpressPort = get_app_port(cpe:CPE);
if(!wordpressPort){
  exit(0);
}

if(!version = get_app_version(cpe:CPE, port:wordpressPort))exit(0);

if(version_in_range(version:version, test_version:"2.6", test_version2:"2.6.3")){
  security_message(port:wordpressPort);
}

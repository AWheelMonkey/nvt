###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_mailup_mult_vuln.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Wordpress MailUp Plugin Multiple Vulnerabilities
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803448");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-2640");
  script_bugtraq_id(58467);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-03-26 13:22:02 +0530 (Tue, 26 Mar 2013)");
  script_name("Wordpress MailUp Plugin Multiple Vulnerabilities");
  script_xref(name:"URL", value:"http://secunia.com/advisories/51917");
  script_xref(name:"URL", value:"http://plugins.trac.wordpress.org/changeset?new=682420");
  script_xref(name:"URL", value:"http://wordpress.org/extend/plugins/wp-mailup/changelog");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute arbitrary HTML
  or web script via unspecified vectors in a user's browser session in context
  of an affected site and disclose sensitive information.");
  script_tag(name:"affected", value:"Wordpress MailUp Plugin version 1.3.1 and prior");
  script_tag(name:"insight", value:"Not properly restrict access to unspecified Ajax functions in
  ajax.functions.php");
  script_tag(name:"solution", value:"Upgrade Wordpress MailUp Plugin 1.3.2 or later.");
  script_tag(name:"summary", value:"This host is installed with Wordpress MailUp Plugin and is prone
  to multiple vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

CPE = 'cpe:/a:wordpress:wordpress';

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + "/wp-content/plugins/wp-mailup/ajax.functions.php?formData=save";

if(http_vuln_check(port:port, url:url,
        pattern:"<b>Fatal error</b>: .*ajax.functions.php"))
{
  security_message(port);
  exit(0);
}

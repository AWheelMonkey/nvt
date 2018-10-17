###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_inventory_mult_vuln.nasl 5323 2017-02-17 08:49:23Z teissa $
#
# PHP Inventory Multiple Vulnerabilities
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800983");
  script_version("$Revision: 5323 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-17 09:49:23 +0100 (Fri, 17 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-01-22 16:43:14 +0100 (Fri, 22 Jan 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4595", "CVE-2009-4596", "CVE-2009-4597");
  script_name("PHP Inventory Multiple Vulnerabilities");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://secunia.com/advisories/37672");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/54666");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/54667");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/10370");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to include arbitrary
  HTML or web scripts in the scope of the browser and allows to obtain and manipulate sensitive information.

  Impact Level: Application.");
  script_tag(name:"affected", value:"PHP Inventory version 1.2 and prior.");
  script_tag(name:"insight", value:"The Multiple flaws due to,
  - Input passed via the 'user_id' parameter to 'index.php' and via the 'sup_id'
    parameter is not properly sanitised before being used in an SQL query.
  - Input passed via the 'user' and 'pass' form field to 'index.php' is not
    properly sanitised before being used in an SQL query.");
  script_tag(name:"solution", value:"Update to PHP Inventory version 1.3.2 or later.
  For updates refer to http://www.phpwares.com/content/php-inventory");
  script_tag(name:"summary", value:"This host is running PHP inventory and is prone to multiple
  vulnerabilities.

  This NVT has been replaced by NVT PHP Inventory 'user' and 'pass' Parameters
  SQL Injection Vulnerability (OID: 1.3.6.1.4.1.25623.1.0.802534).");

  script_tag(name:"qod_type", value:"remote_app");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);
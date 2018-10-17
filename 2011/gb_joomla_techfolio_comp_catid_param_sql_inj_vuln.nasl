##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_techfolio_comp_catid_param_sql_inj_vuln.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Joomla! Techfolio Component 'catid' Parameter SQL Injection Vulnerability
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

CPE = "cpe:/a:joomla:joomla";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802267");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-11-04 12:12:12 +0530 (Fri, 04 Nov 2011)");
  script_bugtraq_id(50422);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_name("Joomla! Techfolio Component 'catid' Parameter SQL Injection Vulnerability");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/71029");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/18042/");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/files/106353/joomlatechfolio-sql.txt");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("joomla/installed");

  script_tag(name:"impact", value:"Successful exploitation will let attackers to cause SQL Injection attack and
gain sensitive information.");

  script_tag(name:"affected", value:"Joomla! Techfolio Component Version 1.0");

  script_tag(name:"insight", value:"The flaw is caused by improper validation of user-supplied input via the
'catid' parameter to index.php (when 'option' is set to 'com_techfolio' and 'view' is set to 'techfoliodetail'),
which allows attacker to manipulate SQL queries by injecting arbitrary SQL code.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the
disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a
newer release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"This host is running Joomla! Techfolio component and is prone to
SQL injection vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe:CPE))
  exit(0);

if (!dir = get_app_location(cpe:CPE, port:port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + "/index.php?option=com_techfolio&view=techfoliodetail&catid=1'";

if (http_vuln_check(port:port, url:url, check_header: TRUE, pattern:"Invalid argument supplied for foreach\(\)",
                    extra_check:">Warning<")) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);

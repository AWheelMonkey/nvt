###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elitecms_xss_n_sql_inj_vuln.nasl 11103 2018-08-24 10:37:26Z mmartin $
#
# Elite Graphix ElitCMS Cross Site Scripting and SQL Injection Vulnerabilities
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

CPE = "cpe:/a:elitecms:elitecms";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804029");
  script_version("$Revision: 11103 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-24 12:37:26 +0200 (Fri, 24 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-10-21 19:27:04 +0530 (Mon, 21 Oct 2013)");

  script_name("Elite Graphix ElitCMS Cross Site Scripting and SQL Injection Vulnerabilities");

  script_tag(name:"summary", value:"This host is running Elite Graphix ElitCMS and is prone to xss and sql
injection vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send a HTTP GET request and check whether it is able to execute sql query
or not.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"insight", value:"Multiple flaws are due to improper sanitation of user-supplied input passed
via 'page' and 'subpage' parameters to index.php script.");

  script_tag(name:"affected", value:"Elite Graphix ElitCMS version 1.01, Other versions may also be affected.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute arbitrary HTML
and script code, inject or manipulate SQL queries in the back-end database allowing for the manipulation or
disclosure of arbitrary data.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_app");

  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/123672");
  script_xref(name:"URL", value:"http://www.vulnerability-lab.com/get_content.php?id=1117");
  script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/elite-graphix-elitcms-101-pro-cross-site-scripting-sql-injection");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("eliteCMS_detect.nasl");
  script_mandatory_keys("elitecms/installed");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
 exit(0);

if (dir == "/")
  dir = "";

url = dir + "/index.php?page=-1'SQL-Injection-Test";

if (http_vuln_check(port: port, url: url, check_header: TRUE,
                    pattern: "Database Query failed !.*SQL-Injection-Test")) {
  report = report_vuln_url(port: port, url: url);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_joomla_sql_injection_cve_2015_8769.nasl 11323 2018-09-11 10:20:18Z ckuersteiner $
#
# Joomla Core SQL Injection Vulnerability Jan16
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807032");
  script_version("$Revision: 11323 $");
  script_cve_id("CVE-2015-8769");
  script_bugtraq_id(79679);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-11 12:20:18 +0200 (Tue, 11 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-01-19 15:04:54 +0530 (Tue, 19 Jan 2016)");

  script_name("Joomla Core SQL Injection Vulnerability Jan16");

  script_tag(name:"summary", value:"This host is running Joomla and is prone
  to SQL Injection vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to inadequate filtering of request data.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allow
  remote attacker to execute arbitrary SQL commands via unspecified vectors.");

  script_tag(name:"affected", value:"Joomla core versions 3.0.0 through 3.4.6");

  script_tag(name:"solution", value:"Upgrade to Joomla version 3.4.7 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"https://developer.joomla.org/security-centre/640-20151207-core-sql-injection.html");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_mandatory_keys("joomla/installed");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!jPort = get_app_port(cpe:CPE))
  exit(0);

if(!jVer = get_app_version(cpe:CPE, port:jPort))
  exit(0);

if(version_in_range(version:jVer, test_version:"3.0.0", test_version2:"3.4.6")) {
  report = report_fixed_ver(installed_version: jVer, fixed_version: "3.4.7");
  security_message(data:report, port:jPort);
  exit(0);
}

exit(0);

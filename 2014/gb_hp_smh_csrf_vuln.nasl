###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hp_smh_csrf_vuln.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# HP System Management Homepage Cross-Site Request Forgery Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
CPE = "cpe:/a:hp:system_management_homepage";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804416");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2013-6188");
  script_bugtraq_id(66128);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-19 13:49:55 +0530 (Wed, 19 Mar 2014)");
  script_name("HP System Management Homepage Cross-Site Request Forgery Vulnerability");


  script_tag(name:"summary", value:"This host is running HP System Management Homepage (SMH) and is prone to
cross-site request forgery vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The application allows users to perform certain actions via HTTP requests
without performing proper validity checks to verify the requests.");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to perform certain unspecified
actions when a logged-in user visits a specially crafted web page.");
  script_tag(name:"affected", value:"HP System Management Homepage (SMH) version 7.1 through 7.2.2");
  script_tag(name:"solution", value:"Upgrade to HP System Management Homepage (SMH) 7.3 or later,
http://h18013.www1.hp.com/products/servers/management/agents/index.html");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/57365");
  script_xref(name:"URL", value:"http://seclists.org/bugtraq/2014/Mar/61");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_hp_smh_detect.nasl");
  script_mandatory_keys("HP/SMH/installed");
  script_require_ports("Services/www", 2381);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!smhPort = get_app_port(cpe:CPE)) exit(0);

if(!smhVer = get_app_version(cpe:CPE, port:smhPort)) exit(0);

if(version_in_range(version:smhVer, test_version:"7.1", test_version2:"7.2.2"))
{
  security_message(smhPort);
  exit(0);
}

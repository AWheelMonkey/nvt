###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_mult_vuln01_mar14.nasl 35578 2014-03-25 12:48:53Z Mar$
#
# Apache Tomcat Multiple Vulnerabilities - 01 - Mar14
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804519");
  script_version("$Revision: 11974 $");
  script_cve_id("CVE-2013-4286");
  script_bugtraq_id(65773);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 08:22:46 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-03-25 12:48:53 +0530 (Tue, 25 Mar 2014)");
  script_name("Apache Tomcat Multiple Vulnerabilities - 01 - Mar14");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_mandatory_keys("ApacheTomcat/installed");
  script_require_ports("Services/www", 8080);

  script_xref(name:"URL", value:"http://seclists.org/bugtraq/2014/Feb/134");
  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/125394");

  script_tag(name:"summary", value:"This host is running Apache Tomcat and is prone to multiple vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaws are due to the HTTP connector or AJP connector which do not properly
  handle certain inconsistent HTTP request headers.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to conduct session
  fixation attacks and manipulate certain data.");
  script_tag(name:"affected", value:"Apache Tomcat version before 6.0.39, 7.x before 7.0.47, and 8.x before
  8.0.0-RC3");
  script_tag(name:"solution", value:"Upgrade to version 6.0.39 or 7.0.47 or 8.0.0-RC3 or later.");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://tomcat.apache.org");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.37") ||
    version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.0.42" ) ||
    version_in_range( version:vers, test_version:"8.0.0", test_version2:"8.0.0.RC1" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"6.0.39/7.0.47/8.0.0-RC3" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
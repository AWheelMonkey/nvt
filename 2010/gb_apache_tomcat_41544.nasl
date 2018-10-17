###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_41544.nasl 4346 2016-10-25 12:54:45Z cfi $
#
# Apache Tomcat 'Transfer-Encoding' Information Disclosure and Denial Of Service Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100712");
  script_version("$Revision: 4346 $");
  script_tag(name:"last_modification", value:"$Date: 2016-10-25 14:54:45 +0200 (Tue, 25 Oct 2016) $");
  script_tag(name:"creation_date", value:"2010-07-13 12:45:31 +0200 (Tue, 13 Jul 2010)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_bugtraq_id(41544);
  script_cve_id("CVE-2010-2227");
  script_name("Apache Tomcat 'Transfer-Encoding' Information Disclosure and Denial Of Service Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Web Servers");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/41544");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-5.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/512272");

  script_tag(name:"solution", value:"The vendor released updates. Please see the references for more
  information.");

  script_tag(name:"summary", value:"Apache Tomcat is prone to multiple remote vulnerabilities including
  information-disclosure and denial-of-service issues.");

  script_tag(name:"impact", value:"Remote attackers can exploit these issues to cause denial-of-service
  conditions or gain access to potentially sensitive information;
  information obtained may lead to further attacks.");

  script_tag(name:"affected", value:"Tomcat 5.5.0 to 5.5.29 Tomcat 6.0.0 to 6.0.27 Tomcat 7.0.0

  Tomcat 3.x, 4.x, and 5.0.x may also be affected.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"5.5.0", test_version2:"5.5.29" ) ||
    version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.27" ) ||
    version_is_equal( version:vers, test_version:"7.0.0" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.5.30/6.0.28/7.0.1" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );

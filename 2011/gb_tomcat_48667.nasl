###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_48667.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Apache Tomcat 'sendfile' Request Attributes Information Disclosure Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.103248");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-09-09 13:52:42 +0200 (Fri, 09 Sep 2011)");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(48667);
  script_cve_id("CVE-2011-2526");
  script_name("Apache Tomcat 'sendfile' Request Attributes Information Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("gb_apache_tomcat_detect.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/48667");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-5.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/");
  script_xref(name:"URL", value:"http://www.ibm.com/support/docview.wss?uid=swg21507512");
  script_xref(name:"URL", value:"http://support.avaya.com/css/P8/documents/100147767");

  script_tag(name:"impact", value:"Remote attackers can exploit this issue to obtain sensitive
  information that will aid in further attacks. Attackers may also crash the JVM.");
  script_tag(name:"affected", value:"Tomcat 5.5.0 through 5.5.33, Tomcat 6.0.0 through 6.0.32, Tomcat 7.0.0
  through 7.0.18");
  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");
  script_tag(name:"summary", value:"Apache Tomcat is prone to a remote information-disclosure
  vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.0.18" ) ||
    version_in_range( version:vers, test_version:"6.0.0", test_version2:"6.0.32" ) ||
    version_in_range( version:vers, test_version:"5.5.0", test_version2:"5.5.33" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.5.34/6.0.33/7.0.19" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
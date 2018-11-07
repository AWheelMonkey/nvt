###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_tomcat_49143.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Apache Commons Daemon 'jsvc' Information Disclosure Vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.103202");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-08-17 15:40:19 +0200 (Wed, 17 Aug 2011)");
  script_bugtraq_id(49143);
  script_cve_id("CVE-2011-2729");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Apache Commons Daemon 'jsvc' Information Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("ApacheTomcat/installed", "Host/runs_unixoide"); #  This issue affects applications running on Linux operating systems only.

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/49143");
  script_xref(name:"URL", value:"http://mail-archives.apache.org/mod_mbox/tomcat-announce/201108.mbox/%3C4E45221D.1020306@apache.org%3E");
  script_xref(name:"URL", value:"http://commons.apache.org/daemon/");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-5.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html");
  script_xref(name:"URL", value:"http://tomcat.apache.org/");
  script_xref(name:"URL", value:"http://commons.apache.org/daemon/jsvc.html");

  script_tag(name:"impact", value:"Remote attackers can exploit this issue to gain access to files and
  directories owned by the superuser, through applications using the
  affected library. This allows attackers to obtain sensitive
  information that may aid in further attacks.");
  script_tag(name:"affected", value:"Versions prior to Commons Daemon 1.0.7 are vulnerable.

  The following Apache Tomcat versions which use the affected library
  are vulnerable:

  Tomcat 7.0.0 through 7.0.19, Tomcat 6.0.30 through 6.0.32, Tomcat 5.5.32
  through 5.5.33

  Note: This issue affects applications running on Linux operating systems only.");
  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");
  script_tag(name:"summary", value:"Apache Commons Daemon is prone to a remote information-disclosure
  vulnerability that affects the 'jsvc' library.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"7.0.0", test_version2:"7.0.19" ) ||
    version_in_range( version:vers, test_version:"6.0.30", test_version2:"6.0.32" ) ||
    version_in_range( version:vers, test_version:"5.5.32", test_version2:"5.5.33" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.5.34/6.0.33/7.0.20" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
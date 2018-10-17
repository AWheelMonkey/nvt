###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_mq_information_disclosure.nasl 8065 2017-12-09 20:53:54Z teissa $
#
# IBM WebSphere MQ 9.0.1 And 9.0.2 Information Disclosure
#
# Authors:
# Jan Philipp Schulte <jan.schulte@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, https://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

if( description )
{
  script_oid("1.3.6.1.4.1.25623.1.0.113067");
  script_version("$Revision: 8065 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-09 21:53:54 +0100 (Sat, 09 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-08 14:38:39 +0100 (Fri, 08 Dec 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");

  script_tag(name:"qod_type", value:"registry");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2017-1337");
  script_bugtraq_id(99493);

  script_name("IBM WebSphere MQ 9.0.1 And 9.0.2 Information Disclosure");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_ibm_websphere_mq_detect.nasl");
  script_mandatory_keys("IBM/Websphere/MQ/Win/Ver");

  script_tag(name:"summary", value:"IBM WebSphere MQ 9.0.1 and 9.0.2 Java/JMS application can incorrectly transmit user credentials in plain text.");
  script_tag(name:"vuldetect", value:"The script checks if a vulnerable version is present on the target host.");
  script_tag(name:"affected", value:"IBM WebSphere MQ 8.0.0.0 through 8.0.0.6, 9.0.0.0 through 9.0.0.1 and 9.0.1 through 9.0.2");
  script_tag(name:"solution", value:"Update IBM WebSphere MQ to 8.0.0.7 or 9.0.0.2 or 9.0.3 respectively.");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg22003853");
  script_xref(name:"URL", value:"https://exchange.xforce.ibmcloud.com/vulnerabilities/126245");

  exit( 0 );
}

CPE = "cpe:/a:ibm:websphere_mq";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! version = get_app_version( cpe: CPE ) ) exit( 0 );

if( version_in_range( version: version, test_version: "8.0.0.0", test_version2: "8.0.0.6" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "8.0.0.7" );
  security_message( data: report, port: 0 );
  exit( 0 );
}

if( version_in_range( version: version, test_version: "9.0.0.0", test_version2: "9.0.0.1" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "9.0.0.2" );
  security_message( data: report, port: 0 );
  exit( 0 );
}

if( version_in_range( version: version, test_version: "9.0.1", test_version2: "9.0.2" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "9.0.3" );
  security_message( data: report, port: 0 );
  exit( 0 );
}

exit( 99 );

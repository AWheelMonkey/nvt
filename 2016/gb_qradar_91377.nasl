###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_qradar_91377.nasl 11903 2018-10-15 10:26:16Z asteins $
#
# IBM QRadar Multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:ibm:qradar_security_information_and_event_manager";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105803");
  script_bugtraq_id(91377, 91373, 91372);
  script_cve_id("CVE-2016-2868", "CVE-2016-2968", "CVE-2016-2872");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
  script_version("$Revision: 11903 $");

  script_name("IBM QRadar Multiple Vulnerabilities");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21985774");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21985773");

  script_tag(name:"impact", value:"An attacker can exploit this issue to gain access to sensitive information that may lead to further attacks.");
  script_tag(name:"vuldetect", value:"Check the version");
  script_tag(name:"insight", value:"IBM QRadar could allow a remote attacker with administrator privileges to obtain sensitive information, caused by an error when processing XML external entities. By sending specially-crafted XML data, an attacker could exploit this vulnerability to obtain sensitive information.");
  script_tag(name:"solution", value:"Update to 7.2.7 or newer");
  script_tag(name:"summary", value:"IBM QRadar is prone to an information-disclosure vulnerability.");
  script_tag(name:"affected", value:"QRadar 7.2.x before 7.2.7 ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-15 12:26:16 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-07-07 17:08:10 +0200 (Thu, 07 Jul 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_qradar_version.nasl");
  script_mandatory_keys("qradar/version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

if( version_in_range( version:version, test_version:'7.2', test_version2:'7.2.6' ) )
{
  report = report_fixed_ver( installed_version:version, fixed_version:'7.2.7' );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


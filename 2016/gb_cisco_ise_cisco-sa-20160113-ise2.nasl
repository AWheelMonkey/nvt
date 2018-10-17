###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_ise_cisco-sa-20160113-ise2.nasl 11772 2018-10-08 07:20:02Z asteins $
#
# Cisco Identity Services Engine Unauthorized Access Vulnerability
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

CPE = "cpe:/a:cisco:identity_services_engine";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105524");
  script_cve_id("CVE-2015-6317");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:C/A:N");
  script_version("$Revision: 11772 $");

  script_name("Cisco Identity Services Engine Unauthorized Access Vulnerability ");

  script_xref(name:"URL", value:"http://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160113-ise2");

  script_tag(name:"impact", value:"An attacker could exploit this vulnerability by authenticating at a low-privileged account and then accessing the web resources directly. An exploit could allow the attacker to access web pages that are reserved for higher-privileged administrative users.");
  script_tag(name:"vuldetect", value:"Check the version");
  script_tag(name:"insight", value:"The vulnerability occurs because specific types of web resources are not correctly filtered for administrative users with different privileges.");
  script_tag(name:"solution", value:"Cisco has released software updates that address these vulnerabilities.");
  script_tag(name:"summary", value:"Cisco Identity Services Engine versions prior to 2.0 contain a vulnerability that could allow a low-privileged authenticated, remote attacker to access specific web resources that are designed to be accessed only by higher-privileged administrative users.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-08 09:20:02 +0200 (Mon, 08 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-01-20 12:43:15 +0100 (Wed, 20 Jan 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_ise_version.nasl");
  script_mandatory_keys("cisco_ise/version", "cisco_ise/patch");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );
if( ! patch = get_kb_item( "cisco_ise/patch" ) ) exit( 0 );

# version is for example 1.1.4.218. But for this check we need only 1.1.4
v = split(version, sep:".", keep:FALSE );
version = v[0] + '.' + v[1] + '.' + v[2];

if( version_is_less( version:version, test_version:"2.0" ) )
{
  fix = '2.0';
  if( version == "1.4.0" )
  {
    if( int( patch ) < 5 )
      fix = '1.4 Patch 5';
    else
      exit( 99 );
  }
}

if( fix )
{
  report = 'Installed version: ' + version + '\n';
  if( int( patch ) > 0 ) report +=  'Installed patch:   ' + patch + '\n';
  report +=  'Fixed version:     ' + fix;

  security_message( port:0, data:report);
  exit( 0 );
}

exit( 99 );


###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_panos_pan_sa-2016_0025.nasl 11922 2018-10-16 10:24:25Z asteins $
#
# Palo Alto PAN-OS Kernel Vulnerabilities (PAN-SA-2016-0025)
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

CPE = 'cpe:/o:paloaltonetworks:pan-os';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140016");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_version("$Revision: 11922 $");
  script_cve_id("CVE-2015-5364", "CVE-2015-5366");
  script_name("Palo Alto PAN-OS Kernel Vulnerabilities (PAN-SA-2016-0025)");

  script_xref(name:"URL", value:"https://securityadvisories.paloaltonetworks.com/Home/Detail/58");

  script_tag(name:"summary", value:"The kernel in use by the Management Plane of PAN-OS is vulnerable to CVE-2015-5364 and CVE-2015-5366.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Update to PAN-OS 5.0.20 and later, PAN-OS 5.1.13 and later, PAN-OS 6.0.15 and later, PAN-OS 7.0.11 and later, PAN-OS 7.1.5 and later");

  script_tag(name:"affected", value:"PAN-OS 5.0.19 and earlier, PAN-OS 5.1.12 and earlier, PAN-OS 6.0.14 and earlier, PAN-OS 6.1.X, PAN-OS 7.0.10 and prior, PAN-OS 7.1.4 and earlier");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:24:25 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-10-25 14:26:55 +0200 (Tue, 25 Oct 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("Palo Alto PAN-OS Local Security Checks");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_palo_alto_panOS_version.nasl");
  script_mandatory_keys("palo_alto_pan_os/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

model = get_kb_item( "palo_alto_pan_os/model" );

if( version =~ "^5\.0" )
  fix = '5.0.20';
else if( version =~ "^5\.1" )
  fix = '5.1.13';
else if( version =~ "^6\.0" )
  fix = '6.0.15';
else if( version =~ "^7\.0" )
  fix = '7.0.11';
else if( version =~ "^7\.1" )
  fix = '7.1.5';

if( ! fix ) exit( 0 );

if( version_is_less( version:version, test_version:fix ) )
{
  report = 'Installed version: ' + version + '\n' +
           'Fixed version:     ' + fix;

  if( model )
    report += '\nModel:             ' + model;

  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


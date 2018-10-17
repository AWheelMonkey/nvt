###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_panos_pan_sa-2017_0005.nasl 11900 2018-10-15 07:44:31Z mmartin $
#
# Palo Alto PAN-OS Detail Information Disclosure in the Management Web Interface
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.140177");
  script_cve_id("CVE-2017-5583");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_version("$Revision: 11900 $");

  script_name("Palo Alto PAN-OS Detail Information Disclosure in the Management Web Interface");

  script_xref(name:"URL", value:"https://securityadvisories.paloaltonetworks.com/Home/Detail/75");

  script_tag(name:"summary", value:"PAN-OS contains a post-authentication vulnerability that may allow for Information Disclosure. Successful exploitation allows an attacker to download arbitrary files from a folder.");

  script_tag(name:"vuldetect", value:"Check the version.");
  script_tag(name:"solution", value:"Update to PAN-OS 6.1.16 and later, PAN-OS 7.0.13 and later, PAN-OS 7.1.8 and later ");

  script_tag(name:"affected", value:"PAN-OS 6.1.15 and earlier, PAN-OS 7.0.12 and earlier, PAN-OS 7.1.7 and earlier ");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"last_modification", value:"$Date: 2018-10-15 09:44:31 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-22 16:10:55 +0100 (Wed, 22 Feb 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("Palo Alto PAN-OS Local Security Checks");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_palo_alto_panOS_version.nasl");
  script_mandatory_keys("palo_alto_pan_os/version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! version = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

model = get_kb_item( "palo_alto_pan_os/model" );

if( version =~ "6\.1" )
  fix = '6.1.16';
else if( version =~ "7\.0" )
  fix = '7.0.13';
else if( version =~ "7\.1" )
  fix = '7.1.8';

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

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_puppet_enterprise_mult_vuln.nasl 8990 2018-03-01 07:43:09Z cfischer $
#
# Puppet Enterprise < 2016.4.4 / 2017 < 2017.2.1 Multiple Vulnerabilities
#
# Authors:
# Jan Philipp Schulte <jan.schulte@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.113100");
  script_version("$Revision: 8990 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-01 08:43:09 +0100 (Thu, 01 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-02-02 11:11:11 +0100 (Fri, 02 Feb 2018)");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2017-2297", "CVE-2017-2293");

  script_name("Puppet Enterprise < 2016.4.4 / 2017 < 2017.2.1 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_puppet_enterprise_detect.nasl");
  script_mandatory_keys("puppet_enterprise/installed");

  script_tag(name:"summary", value:"Versions of Puppet Enterprise prior to 2016.4.5 or 2017.2.1 are prone to multiple vulnerabilities.

  This NVT has duplicated the existing NVT 'Puppet Enterprise < 2016.4.5 / < 2017.2.1 Multiple Vulnerabilities' (OID: 1.3.6.1.4.1.25623.1.0.106929).");
  script_tag(name:"vuldetect", value:"The script checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The affected versions shipped with an MCollective configuration that allowed the package plugin to install or remove arbitrary packages on all managed agents.

  The affected versions did not correctly authenticate users before returning labeled RBAC access tokens");
  script_tag(name:"affected", value:"Puppet Enterprise through 2016.4.4 or 2017.2.0");
  script_tag(name:"solution", value:"Update to version 2016.4.5 or 2017.2.1 respectively.");

  script_xref(name:"URL", value:"https://puppet.com/security/cve/cve-2017-2293");
  script_xref(name:"URL", value:"https://puppet.com/security/cve/cve-2017-2297");

  script_tag(name:"deprecated", value:TRUE);

  exit( 0 );
}

exit(66);

CPE = "cpe:/a:puppet:enterprise";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! version = get_app_version( port: port, cpe: CPE ) ) exit( 0 );

if( version_is_less( version: version, test_version: "2016.4.5" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2016.4.5" );
  security_message( data: report, port: port );
  exit( 0 );
}

if( version_in_range( version: version, test_version: "2017.0.0", test_version2: "2017.2.0" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2017.2.1" );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );

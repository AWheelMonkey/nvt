###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_exponent_cms_file_upload_vuln.nasl 9758 2018-05-08 12:29:26Z asteins $
#
# Exponent CMS 2.3 Multiple File Upload Vulnerabilities
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
  script_oid("1.3.6.1.4.1.25623.1.0.113126");
  script_version("$Revision: 9758 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-08 14:29:26 +0200 (Tue, 08 May 2018) $");
  script_tag(name:"creation_date", value:"2018-03-08 13:28:30 +0100 (Thu, 08 Mar 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2016-7443", "CVE-2016-7095");
  script_bugtraq_id(94121);

  script_name("Exponent CMS 2.3 Multiple File Upload Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_exponet_cms_detect.nasl");
  script_mandatory_keys("ExponentCMS/installed");

  script_tag(name:"summary", value:"Exponent CMS 2.3 is prone to multiple vulnerabilities due to oversights in the file upload functionality.");
  script_tag(name:"vuldetect", value:"The script checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Two vulnerabilities exist:

  Exponent CMS is vulnerable to an attacker uploading a malicious script file using redirection to place
  the script in an unprotected folder, one allowing script execution.

  Exponent CMS allows remote attackers to have unspecified impact via vectors related to uploading files to wrong location.");
  script_tag(name:"affected", value:"Exponent CMS 2.3.0 through 2.3.9");
  script_tag(name:"solution", value:"Update to Exponent CMS 2.4.0");

  script_xref(name:"URL", value:"https://github.com/exponentcms/exponent-cms/releases/tag/v2.4.0");

  exit( 0 );
}

CPE = "cpe:/a:exponentcms:exponent_cms";

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) ) exit( 0 );
if( ! version = get_app_version( cpe: CPE, port: port ) ) exit( 0 );

if( version_in_range( version: version, test_version: "2.3.0", test_version2: "2.3.9" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2.4.0" );
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );

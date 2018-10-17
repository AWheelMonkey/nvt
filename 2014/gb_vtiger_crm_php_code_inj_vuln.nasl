###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vtiger_crm_php_code_inj_vuln.nasl 11584 2018-09-25 07:02:39Z cfischer $
#
# vTiger CRM PHP Code Injection Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:vtiger:vtiger_crm";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103973");
  script_bugtraq_id(61558);
  script_cve_id("CVE-2013-3214");
  script_tag(name:"cvss_base", value:"4.9");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:N");
  script_version("$Revision: 11584 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-25 09:02:39 +0200 (Tue, 25 Sep 2018) $");
  script_tag(name:"creation_date", value:"2014-01-30 12:15:25 +0700 (Thu, 30 Jan 2014)");

  script_name("vTiger CRM PHP Code Injection Vulnerability");

  script_xref(name:"URL", value:"https://www.vtiger.com/blogs/?p=1467");
  script_xref(name:"URL", value:"http://karmainsecurity.com/KIS-2013-07");

  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_vtiger_crm_detect.nasl");
  script_mandatory_keys("vtiger/installed");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"vTiger CRM PHP Code Injection Vulnerability");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"Apply the patch from the link below or upgrade to version
  6.0 or later.");

  script_tag(name:"insight", value:"The installed vTiger CRM is prone to a PHP code injection
  vulnerability. The AddEmailAttachment SOAP method in /soap/vtigerolservice.php
  fails to properly validate input passed through the 'filedata' and 'filename'
  parameters which are used to write an 'email attachement' in the storage directory.");

  script_tag(name:"affected", value:"vTiger CRM version 5.0.0 to 5.4.0.");

  script_tag(name:"impact", value:"A remote attacker can write (or overwrite) files with any content,
  resulting in execution of arbitrary PHP code.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port(cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if (version_in_range( version:vers, test_version:"5.0.0", test_version2:"5.4.0" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"6.0" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
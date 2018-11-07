###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_was_mult_vuln_mar11_02.nasl 12006 2018-10-22 07:42:16Z mmartin $
#
# IBM WebSphere Application Server (WAS) Multiple Vulnerabilities 02 - March 2011
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801863");
  script_version("$Revision: 12006 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-22 09:42:16 +0200 (Mon, 22 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-03-22 08:43:18 +0100 (Tue, 22 Mar 2011)");
  script_cve_id("CVE-2011-1317", "CVE-2011-1321", "CVE-2011-1322");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_name("IBM WebSphere Application Server (WAS) Multiple Vulnerabilities 02 - March 2011");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg27014463");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name:"impact", value:"Successful exploitation will let attackers to gain privileges or cause a
  denial of service.");
  script_tag(name:"affected", value:"IBM WebSphere Application Server versions 6.1.0.x before 6.1.0.37 and
  7.x before 7.0.0.15");
  script_tag(name:"insight", value:"- Memory leak in 'com.ibm.ws.jsp.runtime.WASJSPStrBufferImpl' in the JavaServer
    Pages (JSP) component allows remote attackers to cause a denial of service
    by sending many JSP requests that trigger large responses.

  - The AuthCache purge implementation in the Security component does not purge
    a user from the PlatformCredential cache, which allows remote authenticated
    users to gain privileges by leveraging a group membership specified in an
    old RACF Object.

  - The SOAP with Attachments API for Java (SAAJ) implementation in the Web
    Services component allows remote attackers to cause a denial of service
    via encrypted SOAP messages.");
  script_tag(name:"solution", value:"Upgrade to IBM WebSphere Application Server version 6.1.0.37 or 7.0.0.15.");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg24028875");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"The host is running IBM WebSphere Application Server and is prone to multiple
  vulnerabilities.");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("host_details.inc");

CPE = 'cpe:/a:ibm:websphere_application_server';

if( ! vers = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

if(version_in_range(version: vers, test_version: "6.1", test_version2: "6.1.0.36") ||
   version_in_range(version: vers, test_version: "7.0", test_version2: "7.0.0.14")) {
  report = report_fixed_ver( installed_version:vers, fixed_version:'6.1.0.37/7.0.0.15' );
  security_message(port:0, data:report);
}

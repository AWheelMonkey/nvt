###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zikula_49491.nasl 12152 2018-10-29 13:35:30Z asteins $
#
# Zikula Application Framework 'themename' Parameter Cross Site Scripting Vulnerability
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103251");
  script_version("$Revision: 12152 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 14:35:30 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-09-12 14:00:02 +0200 (Mon, 12 Sep 2011)");
  script_bugtraq_id(49491);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2011-3979");
  script_name("Zikula Application Framework 'themename' Parameter Cross Site Scripting Vulnerability");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/49491");
  script_xref(name:"URL", value:"http://zikula.org/");
  script_xref(name:"URL", value:"https://www.htbridge.ch/advisory/xss_in_zikula.html");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("secpod_zikula_detect.nasl");
  script_mandatory_keys("zikula/installed");
  script_require_ports("Services/www", 80);
  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Zikula Application Framework is prone to a cross-site scripting
vulnerability because it fails to sufficiently sanitize user-
supplied data.");

  script_tag(name:"impact", value:"An attacker may leverage this issue to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected
site. This may allow the attacker to steal cookie-based authentication
credentials and to launch other attacks.");

  script_tag(name:"affected", value:"Zikula Application Framework 1.3.0 is vulnerable. Other versions may
also be affected.");
  exit(0);
}

CPE = "cpe:/a:zikula:zikula_application_framework";

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe:CPE)) exit(0);
if(!vers = get_app_version(cpe:CPE, port:port)) exit(0);

if(version_is_equal(version:vers, test_version:"1.3.0")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"See references");
  security_message(port:port, data:report);
  exit(0);
}

exit(99);

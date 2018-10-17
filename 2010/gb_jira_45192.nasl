###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jira_45192.nasl 7573 2017-10-26 09:18:50Z cfischer $
#
# Atlassian JIRA Multiple Cross Site Scripting Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

CPE = 'cpe:/a:atlassian:jira';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100936");
 script_version("$Revision: 7573 $");
 script_tag(name: "last_modification", value: "$Date: 2017-10-26 11:18:50 +0200 (Thu, 26 Oct 2017) $");
 script_tag(name: "creation_date", value: "2010-12-06 15:55:47 +0100 (Mon, 06 Dec 2010)");
 script_tag(name: "cvss_base", value: "4.3");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:M/Au:N/C:N/I:P/A:N");

 script_bugtraq_id(45192);

 script_tag(name:"qod_type", value:"remote_banner");

 script_tag(name: "solution_type", value: "VendorFix");

 script_name("Atlassian JIRA Multiple Cross Site Scripting Vulnerabilities");

 script_category(ACT_GATHER_INFO);

 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_family("Web application abuses");
 script_dependencies("secpod_atlassian_jira_detect.nasl");
 script_mandatory_keys("atlassian_jira/installed");

 script_tag(name: "summary", value: "Atlassian JIRA is prone to multiple cross-site scripting vulnerabilities.");

 script_tag(name: "vuldetect", value: "Checks the version.");

 script_tag(name: "insight", value: "Atlassian JIRA is prone to multiple cross-site scripting
vulnerabilities because it fails to properly sanitize user-supplied input.");

 script_tag(name: "impact", value: "An attacker may leverage these issues to execute arbitrary HTML and
script code in the browser of an unsuspecting user in the context of the affected site. This may let the
attacker steal cookie-based authentication credentials and launch other attacks.");

 script_tag(name: "affected", value: "Versions prior to Atlassian JIRA 4.2.1");

 script_tag(name: "solution", value: "Updates are available. Please see the references for more information.");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/45192");
 script_xref(name : "URL" , value : "http://confluence.atlassian.com/display/JIRA/JIRA+Security+Advisory+2010-12-06#JIRASecurityAdvisory2010-12-06-xssfix");


 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if("#" >< version) {
  jver = split(version, sep: "#",keep: FALSE);
  if(!isnull(jver[0]))
    version = jver[0];
}  

if (version_is_less(version: version, test_version: "4.2.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.2.1");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

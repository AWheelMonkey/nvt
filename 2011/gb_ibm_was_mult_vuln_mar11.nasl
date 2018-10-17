###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_was_mult_vuln_mar11.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# IBM WebSphere Application Server (WAS) Multiple Vulnerabilities - March 2011
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

tag_impact = "Successful exploitation will let attackers to execute arbitrary script code,
  steal cookie-based authentication credentials, obtain sensitive information,
  and perform unauthorized actions.
  Impact Level: Application";
tag_affected = "IBM WebSphere Application Server versions prior to 7.0.0.15.";
tag_insight = "- An error in the installer that creates a temporary directory for logs with
    insecure permissions.
  - An input validation error in the IVT application, which could allow cross
    site scripting attacks.
  - An error related to trace requests handling in the plug-in component.
  - The Security component when a J2EE 1.4 application is used, determines the
    security role mapping on the basis of the ibm-application-bnd.xml file
    instead of the intended ibm-application-bnd.xmi file allows remote
    authenticated users to gain privileges.
  - The Service Integration Bus (SIB) messaging engine allows remote attackers
    to cause a denial of service by performing close operations via network
    connections to a queue manager.
  - Memory leak in the messaging engine allows remote attackers to cause a
    denial of service via network connections associated with a NULL return
    value from a synchronous JMS receive call.
  - The Session Initiation Protocol (SIP) Proxy in the HTTP Transport component
    allows remote attackers to cause a denial of service by sending many UDP
    messages.
  - Memory leak in org.apache.jasper.runtime.JspWriterImpl.response in the
    JavaServer Pages (JSP) component allows remote attackers to cause a denial
    of service by accessing a JSP page of an application that is repeatedly
    stopped and restarted.";
tag_solution = "Upgrade to IBM WebSphere Application Server version 7.0.0.15 or later,
  http://www-01.ibm.com/support/docview.wss?uid=swg24028875";
tag_summary = "The host is running IBM WebSphere Application Server and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801861");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-03-22 08:43:18 +0100 (Tue, 22 Mar 2011)");
  script_cve_id("CVE-2011-1307", "CVE-2011-1308", "CVE-2011-1309",
                "CVE-2011-1311", "CVE-2011-1314", "CVE-2011-1315",
                "CVE-2011-1316", "CVE-2011-1318");
  script_bugtraq_id(46736);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("IBM WebSphere Application Server (WAS) Multiple Vulnerabilities - March 2011");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2011/0564");
  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg27014463");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("host_details.inc");

CPE = 'cpe:/a:ibm:websphere_application_server';

if( ! vers = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

## Check for IBM WebSphere Application Server versions prior to 7.0.0.15
if(version_is_less(version: vers, test_version: "7.0.0.15")){
  report = report_fixed_ver( installed_version:vers, fixed_version:'7.0.0.15' );
  security_message(port:0, data:report);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_sql_ledger_mult_vuln.nasl 10881 2018-08-10 10:27:02Z mmartin $
#
# SQL-Ledger Multiple Vulnerabilities
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow attacker to conduct cross-site request
  forgery attacks and by malicious users to conduct script insertion and SQL
  injection attacks, or bypass certain security restrictions.
  Impact Level: Application";
tag_affected = "SQL-Ledger version 2.8.24 and prior";
tag_insight = "- The application allows users to perform certain actions via HTTP requests
    without performing any validity checks to verify the request. This can be
    exploited to perform actions with the privileges of a target user, who is
    tricked into visiting a malicious website.
  - Input passed via customer names, vendor names, the DCN description field
    in 'Accounts Receivables', and the description field in 'Accounts Payable',
    is not properly sanitised before being used. This can be exploited to
    insert arbitrary HTML and script code, which is executed in a user's browser
    session in context of an affected site when the malicious data is viewed.
  - Input passed via the 'id' parameter when searching for vendors is not
    properly sanitised before being used in SQL queries. This can be exploited
    to manipulate SQL queries by injecting arbitrary SQL code.
  - Input passed via the 'countrycode' field in 'Preferences' is not properly
    sanitised before used to include files. This can be exploited to include
    arbitrary '.pl' files from the local system via directory traversal attacks.";
tag_solution = "Upgrade to SQL-Ledger version 2.8.30 or later.
  For updates refer to http://www.sql-ledger.org/";
tag_summary = "This host is running SQL-Ledger and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902010");
  script_version("$Revision: 10881 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 12:27:02 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-12-31 08:44:14 +0100 (Thu, 31 Dec 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-3580", "CVE-2009-3581", "CVE-2009-3582",
                "CVE-2009-3583", "CVE-2009-3584", "CVE-2009-4402");
  script_bugtraq_id(37431);
  script_name("SQL-Ledger Multiple Vulnerabilities");


  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_sql_ledger_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name : "summary" , value : tag_summary);
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37877");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/54964");
  script_xref(name : "URL" , value : "http://archives.neohapsis.com/archives/fulldisclosure/2009-12/0415.html");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

ledgerPort = get_http_port(default:80);
if(!ledgerPort){
  exit(0);
}

ledgerVer = get_kb_item("www/"+ ledgerPort + "/SQL-Ledger");
if(!ledgerVer){
  exit(0);
}

ledgerVer = eregmatch(pattern:"^(.+) under (/.*)$", string:ledgerVer);
if(ledgerVer[1] != NULL)
{
  # Check for SQL-Ledger version 2.8.24 and prior
  if(version_is_less_equal(version:ledgerVer[1], test_version:"2.8.24")){
    security_message(ledgerPort);
  }
}

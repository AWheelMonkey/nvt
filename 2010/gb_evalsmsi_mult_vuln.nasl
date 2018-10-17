###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_evalsmsi_mult_vuln.nasl 8447 2018-01-17 16:12:19Z teissa $
#
# evalSMSI multiple vulnerabilities
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to view, edit and delete
  the backend database via SQL Injection or inject arbitrary web script or HTML
  via cross-site scripting attack.
  Impact Level: Application";
tag_affected = "evalSMSI version prior to 2.2.00 on all platforms.";
tag_insight = "The multiple flaws are due to:
  - Input passed to the 'query' parameter in ajax.php (when 'question' action
    is set), 'return' parameter in ajax.php and while writing comments to
    assess.php page (when 'continue_assess' action is set) is not properly
    sanitised before being used in SQL queries.
  - The passwords are stored in plaintext in the database, which allows
    attackers with database access to gain privileges.";
tag_solution = "Upgrade to evalSMSI version 2.2.00 or later,
  For updates refer to http://sourceforge.net/projects/evalsmsi/files/";
tag_summary = "This host is running evalSMSI and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800166");
  script_version("$Revision: 8447 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-17 17:12:19 +0100 (Wed, 17 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-02-17 08:26:50 +0100 (Wed, 17 Feb 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(38116);
  script_cve_id("CVE-2010-0614", "CVE-2010-0615", "CVE-2010-0616", "CVE-2010-0617");
  script_name("evalSMSI multiple vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/38478");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/56154");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/56157");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/56152");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/1002-exploits/corelan-10-008-evalmsi.txt");
  script_xref(name : "URL" , value : "http://www.corelan.be:8800/index.php/forum/security-advisories/corelan-10-008-evalmsi-2-1-03-multiple-vulnerabilities/");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_evalsmsi_detect.nasl");
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

## Get the port where evalSMSI application is running
evalSMSIPort = get_http_port(default:80);
if(!evalSMSIPort){
  exit(0);
}

## Get Version from KB
evalSMSIVer = get_kb_item("www/" + evalSMSIPort + "/evalSMSI");
if(isnull(evalSMSIVer)){
  exit(0);
}

evalSMSIVer = eregmatch(pattern:"^(.+) under (/.*)$", string:evalSMSIVer);

if(evalSMSIVer[1] != NULL)
{
  ## Check for version less then 2.0.00
  if(version_is_less(version:evalSMSIVer[1], test_version:"2.0.00")){
    security_message(evalSMSIPort);
  }
}

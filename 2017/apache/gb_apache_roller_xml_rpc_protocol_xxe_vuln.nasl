###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_roller_xml_rpc_protocol_xxe_vuln.nasl 8027 2017-12-07 09:50:33Z santu $
#
# Apache Roller 'XML-RPC' Protocol XXE Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:apache:roller";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812233");
  script_version("$Revision: 8027 $");
  script_cve_id("CVE-2014-0030");
  script_bugtraq_id(101230);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-12-07 10:50:33 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-01 11:21:50 +0530 (Fri, 01 Dec 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache Roller 'XML-RPC' Protocol XXE Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with Apache Roller
  and is prone to xml external entity vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to XML-RPC protocol support 
  in Apache Roller.");

  script_tag(name: "impact" , value:"Successful exploitation will allow a
  remote attacker to conduct XML External Entity (XXE) attacks via unspecified 
  vectors. This vulnerability exists even if XML-RPC is disabled via the Roller 
  Admin Console.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apache Roller 4.0.0 and 4.0.1, 5.0, 5.0.1 
  and 5.0.2, The unsupported Roller 3.1 release is also affected.");

  script_tag(name: "solution" , value:"Upgrade to Apache Roller 5.0.3 or later.
  For updates refer to https://roller.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://liftsecurity.io/advisories/Apache_Roller_XML-RPC_susceptible_to_XXE");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_apache_roller_detect.nasl");
  script_mandatory_keys("ApacheRoller/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

rollerVer = "";
rollerpath = "";
report = "";

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE);
rollerVer = infos['version'];
rollerpath = infos['location'];

affected = make_list('5.0.2', '5.0.1', '5.0', '4.0.1', '4.0.0', '3.1');
foreach version (affected)
{
  if( rollerVer == version)
  {
    report = report_fixed_ver(installed_version:rollerVer, fixed_version:"5.0.3", install_path:rollerpath);
    security_message(data:report);
    exit(0);
  }
}
exit(0);

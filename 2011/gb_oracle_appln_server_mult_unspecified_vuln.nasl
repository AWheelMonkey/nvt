###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_appln_server_mult_unspecified_vuln.nasl 7052 2017-09-04 11:50:51Z teissa $
#
# Oracle Application Server Multiple Unspecified Vulnerabilities
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.802532");
  script_version("$Revision: 7052 $");
  script_cve_id("CVE-2006-0284");
  script_bugtraq_id(16287);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-04 13:50:51 +0200 (Mon, 04 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-12-07 13:11:01 +0530 (Wed, 07 Dec 2011)");
  script_name("Oracle Application Server Multiple Unspecified Vulnerabilities");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_require_ports("Services/www", 7777);
  script_dependencies("http_version.nasl", "gb_get_http_banner.nasl");
  script_mandatory_keys("Oracle-Application-Server/banner");

  script_tag(name:"impact", value:"An unspecified impact and attack vectors.

  Impact Level: Application");
  script_tag(name:"affected", value:"Oracle application server versions 9.0.4.2 and 10.1.2.0.2");
  script_tag(name:"insight", value:"The flaws are due to unspecified errors in the oracle forms
  components.");
  script_tag(name:"solution", value:"Apply patches from below link,
  http://www.oracle.com/technetwork/topics/security/cpujan2006-082403.html");
  script_tag(name:"summary", value:"This host is running Oracle application server and is prone to
  multiple unspecified vulnerabilities.");

  script_xref(name:"URL", value:"http://secunia.com/advisories/18493");
  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/545804");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1015499");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/24321");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value: "VendorFix");

  exit(0);
}


include("http_func.inc");
include("version_func.inc");

## Get the port
appPort = get_http_port(default:7777);

## Get the banner
banner = get_http_banner(port:appPort);

## Confirm the server
if(!banner && "Oracle-Application-Server" >!< banner){
  exit(0);
}

## Grep for version
appVer = eregmatch(pattern:"Oracle-Application-Server-[0-9a-zA-Z]+?/([0-9.]+)",
                                           string:banner);
if(appVer[1] == NULL){
  exit(0);
}

## Check the affected versions
if(version_in_range(version:appVer[1], test_version:"9.0", test_version2:"9.0.4.1") ||
   version_in_range(version:appVer[1], test_version:"10.1.2.0", test_version2:"10.1.2.0.1"))
{
  security_message(port:appPort);
  exit(0);
}

report = string("***** \n" +
                " NOTE : Ignore this warning, if the mentioned patch" +
                " is already applied.\n" +
                " ***** \n");

if(version_is_equal(version:appVer[1], test_version:"9.0.4.2") ||
   version_is_equal(version:appVer[1], test_version:"10.1.2.0.2")){
  security_message(data:report, port:appPort);
  exit(0);
}

exit(99);

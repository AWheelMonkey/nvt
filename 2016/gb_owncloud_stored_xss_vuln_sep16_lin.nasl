###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_owncloud_stored_xss_vuln_sep16_lin.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# ownCloud Stored XSS Vulnerability Sep16 (Linux)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:owncloud:owncloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809291");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2015-5953");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-09-23 15:00:37 +0530 (Fri, 23 Sep 2016)");
  script_name("ownCloud Stored XSS Vulnerability Sep16 (Linux)");

  script_tag(name: "summary" , value:"The host is installed with ownCloud and
  is prone to stored xss Vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to activity application
  does not sanitising all user provided input correctly.");

  script_tag(name: "impact" , value:"Successful exploitation will allows 
  remote authenticated users to inject arbitrary web script or HTML.

  Impact Level: Application");

  script_tag(name: "affected" , value:"ownCloud Server before 7.0.5 and 8.0.x
  before 8.0.4 on Linux.");

  script_tag(name: "solution" , value:"Upgrade to ownCloud Server 7.0.5 or
  8.0.4 later.
  For updates refer to http://owncloud.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "https://owncloud.org/security/advisory/?id=oc-sa-2015-010");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_owncloud_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("owncloud/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ownPort = "";
ownVer = "";

## Get the port
if(!ownPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!ownVer = get_app_version(cpe:CPE, port:ownPort)){
  exit(0);
}

if(ownVer =~ "^(8|7)")
{
  ## Grep for vulnerable version
  if(version_is_less(version:ownVer, test_version:"7.0.5"))
  {
    fix = "7.0.5";
    VULN = TRUE;
  }

  else if(version_in_range(version:ownVer, test_version:"8.0.0", test_version2:"8.0.3"))
  {
    fix = "8.0.4";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:ownVer, fixed_version:fix);
    security_message(data:report, port:ownPort);
    exit(0);
  }
}

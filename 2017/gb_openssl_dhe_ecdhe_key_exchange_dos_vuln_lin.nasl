###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_dhe_ecdhe_key_exchange_dos_vuln_lin.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# OpenSSL Bad (EC)DHE Parameters DoS Vulnerability (Linux)
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810545");
  script_version("$Revision: 7543 $");
  script_cve_id("CVE-2017-3730");
  script_bugtraq_id(95812);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-02-09 18:50:03 +0530 (Thu, 09 Feb 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Bad (EC)DHE Parameters DoS Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to a NULL pointer
  dereference error while DHE or ECDHE key exchange.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause a denial-of-service condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"OpenSSL 1.1.0 before 1.1.0d on Linux");

  script_tag(name:"solution", value:"Upgrade to OpenSSL version 1.1.0d or 
  later. For updates refer to https://www.openssl.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://www.openssl.org/news/secadv/20170126.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sslVer = "";

## Get Port
if(!sslPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!sslVer = get_app_version(cpe:CPE, port:sslPort)){
  exit(0);
}

## Checking for Vulnerable version
if(sslVer =~ "^(1\.1\.0)")
{
  if(version_is_less(version:sslVer, test_version:"1.1.0d"))
  {
    report = report_fixed_ver(installed_version:sslVer, fixed_version:"1.1.0d");
    security_message(data:report, port:sslPort);
    exit(0);
  }
}

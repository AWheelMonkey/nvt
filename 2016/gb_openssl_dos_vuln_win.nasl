###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_dos_vuln_win.nasl 7545 2017-10-24 11:45:30Z cfischer $
#
# OpenSSL Denial Of Service Vulnerability (Windows)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806817");
  script_version("$Revision: 7545 $");
  script_cve_id("CVE-2015-3196");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:45:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2016-01-11 17:41:42 +0530 (Mon, 11 Jan 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("OpenSSL Denial Of Service Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to 
  -A race condition flaw, leading to a double free error due to improper handling
  of pre-shared key (PSK) identify hints.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause denial of service via a crafted ServerKeyExchange message.

  Impact Level: Application");

  script_tag(name:"affected", value:"OpenSSL versions 1.0.0 before
  1.0.0t, 1.0.1 before 1.0.1p, and 1.0.2 before 1.0.2d on Windows");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 1.0.0t or
  1.0.1p or 1.0.2d or later. For updates refer https://www.openssl.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://openssl.org/news/secadv/20151203.txt");
  script_xref(name : "URL" , value : "https://support.f5.com/kb/en-us/solutions/public/k/55/sol55540723.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed","Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
sslVer = "";

## Get Version
if(!sslVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Checking for Vulnerable version
if(sslVer =~ "^(1\.0\.0)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.0t"))
  {
    fix = "1.0.0t";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.1)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.1p"))
  {
    fix = "1.0.1p";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.2)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.2d"))
  {
    fix = "1.0.2d";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed version: ' + sslVer + '\n' +
           'Fixed version:     ' + fix + '\n';

  security_message(data:report);
  exit(0);
}

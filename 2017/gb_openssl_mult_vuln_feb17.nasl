###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_vuln_feb17.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# OpenSSL Multiple Vulnerabilities Feb17
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
  script_oid("1.3.6.1.4.1.25623.1.0.810542");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2017-3731", "CVE-2017-3732");
  script_bugtraq_id(95813, 95814);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-09 18:50:03 +0530 (Thu, 09 Feb 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Multiple Vulnerabilities Feb17");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - An out-of-bounds read error while using a specific cipher.

  - A carry propagating bug in the x86_64 Montgomery squaring procedure.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to conduct a denial of service attack and produce incorrect results.");

  script_tag(name:"affected", value:"OpenSSL 1.1.0 before 1.1.0d and
  1.0.2 before 1.0.2k");

  script_tag(name:"solution", value:"Upgrade to OpenSSL version 1.1.0d or
  1.0.2k or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20170126.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect.nasl");
  script_mandatory_keys("OpenSSL/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!sslPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!sslVer = get_app_version(cpe:CPE, port:sslPort)){
  exit(0);
}

if(sslVer =~ "^(1\.1\.0)"){
  fix = '1.1.0d';
}

else if(sslVer =~ "^(1\.0\.1)"){
  fix = '1.0.2k';
}

if(!fix) exit(99);

if(version_is_less(version:sslVer, test_version:fix))
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:fix);
  security_message(port:sslPort, data:report);
  exit(0);
}
exit(99);

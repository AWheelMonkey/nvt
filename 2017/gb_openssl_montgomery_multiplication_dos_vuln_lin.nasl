###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_montgomery_multiplication_dos_vuln_lin.nasl 11982 2018-10-19 08:49:21Z mmartin $
#
# OpenSSL Montgomery Multiplication Denial of Service Vulnerability (Linux)
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
  script_oid("1.3.6.1.4.1.25623.1.0.810544");
  script_version("$Revision: 11982 $");
  script_cve_id("CVE-2016-7055");
  script_bugtraq_id(94242);
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 10:49:21 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-02-09 18:50:03 +0530 (Thu, 09 Feb 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Montgomery Multiplication Denial of Service Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to a carry propagating
  bug in the Broadwell-specific Montgomery multiplication procedure that
  handles input lengths divisible by, but longer than 256 bits.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause transient authentication, key negotiation failures or
  reproducible erroneous outcome of public-key operations with specially
  crafted input and denial of service condition.");

  script_tag(name:"affected", value:"OpenSSL 1.1.0 before 1.1.0c and
  1.0.2 before 1.0.2k on Linux");

  script_tag(name:"solution", value:"Upgrade to OpenSSL version 1.1.0c or
  1.0.2k or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20170126.txt");
  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20161110.txt");

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

if(!sslPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!sslVer = get_app_version(cpe:CPE, port:sslPort)){
  exit(0);
}

if(sslVer =~ "^(1\.1\.0)"){
  fix = "1.1.0c";
}

else if(sslVer =~ "^(1\.0\.2)"){
  fix = "1.0.2k";
}

if(!fix) exit(99);

if(version_is_less(version:sslVer, test_version:fix))
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:fix);
  security_message(port:sslPort, data:report);
  exit(0);
}

exit(99);

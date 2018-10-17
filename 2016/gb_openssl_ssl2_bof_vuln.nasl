###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_ssl2_bof_vuln.nasl 11725 2018-10-02 10:50:50Z asteins $
#
# OpenSSL SSL2 'KEY_ARG' Buffer Overflow Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810215");
  script_version("$Revision: 11725 $");
  script_cve_id("CVE-2002-0656");
  script_bugtraq_id(5363);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-02 12:50:50 +0200 (Tue, 02 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-11-26 18:50:26 +0530 (Sat, 26 Nov 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL SSL2 'KEY_ARG' Buffer Overflow Vulnerability");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to a buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation of
  'KEY_ARG_LENGTH' parameter by the 'get_client_master_key' function in script
  'ssl/s2_srvr.c' during the handshake process with an SSL server connection
  using the SSLv2 communication process");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to execute arbitrary code on the server.");

  script_tag(name:"affected", value:"OpenSSL versions 0.9.6d and earlier, and
  0.9.7-beta2 and earlier on Linux.");

  script_tag(name:"solution", value:"Upgrade to OpenSSL version 0.9.6e or later
  or apply the patch provided by vendor.
  For updates refer to https://www.openssl.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/102795");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40347");
  script_xref(name:"URL", value:"http://www.cert.org/historical/advisories/CA-2002-23.cfm");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
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

if(version_is_less(version:sslVer, test_version:"0.9.6e") ||
   version_is_equal(version:sslVer, test_version:"0.9.7-beta1") ||
   version_is_equal(version:sslVer, test_version:"0.9.7-beta2"))
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:"0.9.6e or Appl the Patch");
  security_message(data:report, port:sslPort);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_dos_vuln02_dec15_lin.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# OpenSSL Multiple Denial of Service Vulnerabilities -02 Dec15 (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.806745");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-1789", "CVE-2015-1790", "CVE-2015-1791", "CVE-2015-1792");
  script_bugtraq_id(75156, 75157, 75161, 75154);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-12-01 09:41:47 +0530 (Tue, 01 Dec 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Multiple Denial of Service Vulnerabilities -02 Dec15 (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to:

  - An out-of-bounds read vulnerability in 'X509_cmp_time' function in
    'crypto/x509/x509_vfy.c' script.

  - NULL pointer dereference vulnerability in 'PKCS7_dataDecodefunction' in
    'crypto/pkcs7/pk7_doit.c' script.

  - 'ssl3_get_new_session_ticket' function in 'ssl/s3_clnt.c' script causes
    race condition while handling NewSessionTicket.

  - 'do_free_upto' function in 'crypto/cms/cms_smime.c' script verify infinite
    loop with unknown hash function.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause a denial of service or possibly have unspecified other impact.");

  script_tag(name:"affected", value:"OpenSSL versions before 0.9.8zg, 1.0.0
  before 1.0.0s, 1.0.1 before 1.0.1n, and 1.0.2 before 1.0.2b on Linux");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 0.9.8zg, or 1.0.0s or
  1.0.1n or 1.0.2b or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20150611.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!sslVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(sslVer =~ "^(0\.9\.8)")
{
  if(version_is_less(version:sslVer, test_version:"0.9.8zg"))
  {
    fix = "0.9.8zg";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.0)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.0s"))
  {
    fix = "1.0.0s";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.1)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.1n"))
  {
    fix = "1.0.1n";
    VULN = TRUE;
  }
}
else if(sslVer =~ "^(1\.0\.2)")
{
  if(version_is_less(version:sslVer, test_version:"1.0.2b"))
  {
    fix = "1.0.2b";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = 'Installed version: ' + sslVer + '\n' +
           'Fixed version:    ' + fix + '\n';

  security_message(data:report);
  exit(0);
}

##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mis_crl_chk_lin.nasl 11702 2018-10-01 07:31:38Z asteins $
# OpenSSL Missing CRL sanity check Vulnerability (Linux)
#
# Authors:
# Tameem Eissa <tameem.eissa..at..greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.107056");
  script_version("$Revision: 11702 $");
  script_cve_id("CVE-2016-7052");

  script_tag(name:"last_modification", value:"$Date: 2018-10-01 09:31:38 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"creation_date", value:"2016-09-26 06:40:16 +0200 (Mon, 26 Sep 2016)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_name("OpenSSL Missing CRL sanity check Vulnerability (Linux)");

  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20160926.txt");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone to a denial of service vulnerability.");
  script_tag(name:"insight", value:"OpenSSL suffers from the possibility of DoS attack after a bug fix added to OpenSSL 1.1.0 but was omitted from OpenSSL 1.0.2i causing a null pointer exception when using CRLs in OpenSSL 1.0.2i.");
  script_tag(name:"impact", value:"Successful exploitation could result a in service crash.");
  script_tag(name:"affected", value:"OpenSSL 1.0.2i.");
  script_tag(name:"solution", value:"OpenSSL 1.0.2i users should upgrade to 1.0.2j.");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!sslVer = get_app_version(cpe:CPE))
{
  exit(0);
}

if(version_is_equal(version:sslVer, test_version:"1.0.2i"))
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:"1.0.2j");
  security_message(data:report);
  exit(0);
}

exit(99);

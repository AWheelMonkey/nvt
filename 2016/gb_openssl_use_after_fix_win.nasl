##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_use_after_fix_win.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# OpenSSL Use-After-Free Fix Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.107055");
  script_version("$Revision: 11523 $");
  script_cve_id("CVE-2016-6309");

  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"creation_date", value:"2016-09-26 06:40:16 +0200 (Mon, 26 Sep 2016)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_name("OpenSSL Use-After-Free Fix Vulnerability (Windows)");

  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20160926.txt");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_openssl_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("OpenSSL/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);

  script_tag(name:"summary", value:"This host is running OpenSSL and prone to denial of service or remote code execution vulnerability.");
  script_tag(name:"insight", value:"OpenSSL suffers from the possibility of Remote Code Execution or DoS attack after a patch applied to fix the 'Use-After-Free' issue which enable attacker to write to the previously freed location.");
  script_tag(name:"impact", value:"Successful exploitation could result in service crash or execution of arbitrary code.");
  script_tag(name:"affected", value:"OpenSSL 1.1.0a.");
  script_tag(name:"solution", value:"OpenSSL 1.1.0 users should upgrade to 1.1.0b.");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!sslVer = get_app_version(cpe:CPE))
{
  exit(0);
}

if(version_is_equal(version:sslVer, test_version:"1.1.0a"))
{
  report = report_fixed_ver(installed_version:sslVer, fixed_version:"1.1.0b");
  security_message(data:report);
  exit(0);
}

exit(99);

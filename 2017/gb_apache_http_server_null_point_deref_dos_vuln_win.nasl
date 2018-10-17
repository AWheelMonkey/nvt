###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_http_server_null_point_deref_dos_vuln_win.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# Apache HTTP Server 'mod_http2 null pointer dereference' DoS Vulnerability (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:apache:http_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811217");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2017-7659");
  script_bugtraq_id(99132);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-21 17:56:43 +0530 (Wed, 21 Jun 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache HTTP Server 'mod_http2 null pointer dereference' DoS Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Apache HTTP Server
  and is prone to denial-of-service vulnerability");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as a maliciously constructed
  HTTP/2 request could cause mod_http2 to dereference a NULL pointer and crash
  the server process.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial-of-service condition.");

  script_tag(name:"affected", value:"Apache HTTP Server version 2.4.25 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apache HTTP Server 2.4.26 or
  later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2017/q2/504");
  script_xref(name:"URL", value:"http://httpd.apache.org/security/vulnerabilities_24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("secpod_apache_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("apache/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"https://httpd.apache.org");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!httpd_port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!httpd_ver = get_app_version(cpe:CPE, port:httpd_port)){
  exit(0);
}

if(httpd_ver =~ "^2\.4")
{
  if(version_is_equal(version:httpd_ver, test_version:"2.4.25"))
  {
    report = report_fixed_ver(installed_version:httpd_ver, fixed_version:"2.4.26");
    security_message(data:report, port:httpd_port);
    exit(0);
  }
}
exit(0);

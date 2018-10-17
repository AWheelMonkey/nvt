###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_http_server_mod_auth_digest_dos_vuln_win.nasl 7682 2017-11-07 11:49:59Z santu $
#
# Apache HTTP Server 'mod_auth_digest' DoS Vulnerability (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.812066");
  script_version("$Revision: 7682 $");
  script_cve_id("CVE-2016-2161");
  script_bugtraq_id(95076);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-11-07 12:49:59 +0100 (Tue, 07 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-06 12:42:38 +0530 (Mon, 06 Nov 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache HTTP Server 'mod_auth_digest' DoS Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Apache HTTP Server
  and is prone to denial-of-service vulnerability");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to insufficient handling
  of malicious input to 'mod_auth_digest'.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial-of-service condition.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache HTTP Server versions 2.4.23, 2.4.20,
  2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3,
  2.4.2 and 2.4.1 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apache HTTP Server 2.4.25 or
  later. For updates refer to https://httpd.apache.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://httpd.apache.org/security/vulnerabilities_24.html#CVE-2016-2161");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("secpod_apache_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("apache/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

httpd_port = 0;
httpd_ver = "";
affected_version = "";

if(!httpd_port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!httpd_ver = get_app_version(cpe:CPE, port:httpd_port)){
  exit(0);
}

if(httpd_ver =~ "^2\.4")
{
  foreach affected_version (make_list("2.4.23", "2.4.20", "2.4.18", "2.4.17",
           "2.4.16", "2.4.12", "2.4.10", "2.4.9", "2.4.7", "2.4.6", "2.4.4",
           "2.4.3", "2.4.2", "2.4.1"))
  {
    if(affected_version == httpd_ver)
    {
      report = report_fixed_ver(installed_version:httpd_ver, fixed_version:"2.4.25");
      security_message(data:report, port:httpd_port);
      exit(0);
    }
  }
}
exit(0);

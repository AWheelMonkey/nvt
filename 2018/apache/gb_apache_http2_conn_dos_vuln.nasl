###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_http2_conn_dos_vuln.nasl 11109 2018-08-24 14:47:20Z mmartin $
#
# Apache HTTP Server 'HTTP/2 connection' DoS Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813812");
  script_version("$Revision: 11109 $");
  script_cve_id("CVE-2018-1333");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-24 16:47:20 +0200 (Fri, 24 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-08-02 16:10:09 +0530 (Thu, 02 Aug 2018)");
  ## Affects servers that have configured and enabled HTTP/2 support
  ## which is not the default
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Apache HTTP Server 'HTTP/2 connection' DoS Vulnerability");

  script_tag(name:"summary", value:"This host is running Apache HTTP Server
  and is prone to denial-of-service vulnerability");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an error in the handling
  of specially crafted HTTP/2 requests.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service (DoS) condition on a targeted system.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache HTTP Server versions 2.4.18 through
  2.4.30 and 2.4.33.");

  script_tag(name:"solution", value:"Upgrade to Apache HTTP Server 2.4.34 or
  later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://httpd.apache.org");
  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2018/q3/39");
  script_xref(name:"URL", value:"https://httpd.apache.org/security/vulnerabilities_24.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("secpod_apache_detect.nasl");
  script_mandatory_keys("apache/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!httpd_port = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:httpd_port, exit_no_version:TRUE);
httpd_ver = infos['version'];
path = infos['location'];

if(httpd_ver =~ "^2\.4")
{
  foreach affected_version (make_list("2.4.18", "2.4.20", "2.4.23", "2.4.25",
           "2.4.26", "2.4.27", "2.4.28", "2.4.29", "2.4.30", "2.4.33"))
  {
    if(affected_version == httpd_ver)
    {
      report = report_fixed_ver(installed_version:httpd_ver, fixed_version:"2.4.34", install_path:path);
      security_message(data:report, port:httpd_port);
      exit(0);
    }
  }
}

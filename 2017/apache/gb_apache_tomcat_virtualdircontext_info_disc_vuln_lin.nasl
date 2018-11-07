###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_virtualdircontext_info_disc_vuln_lin.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# Apache Tomcat 'VirtualDirContext' Information Disclosure Vulnerability (Linux)
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811847");
  script_version("$Revision: 11983 $");
  script_cve_id("CVE-2017-12616");
  script_bugtraq_id(100897);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-25 17:29:27 +0530 (Mon, 25 Sep 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Apache Tomcat 'VirtualDirContext' Information Disclosure Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper serving of
  files via 'VirtualDirContext'.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to obtain potentially sensitive information on the target system.");

  script_tag(name:"affected", value:"Apache Tomcat versions 7.0.0 to 7.0.80
  on Linux");

  script_tag(name:"solution", value:"Upgrade to Tomcat version 7.0.81 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1039393");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html#Fixed_in_Apache_Tomcat_7.0.81");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheTomcat/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 8080);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!tomPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!appVer = get_app_version(cpe:CPE, port:tomPort)){
  exit(0);
}

if(appVer =~ "^(7\.)")
{
  if(version_is_less(version:appVer, test_version:"7.0.81"))
  {
    report = report_fixed_ver(installed_version:appVer, fixed_version:"7.0.81");
    security_message(data:report, port:tomPort);
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_tomcat_sec_bypass_n_info_disc_vuln_win.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Apache Tomcat Security Bypass and Information Disclosure Vulnerabilities (Windows)
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

CPE = "cpe:/a:apache:tomcat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811298");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2016-6794", "CVE-2016-0762", "CVE-2016-5018", "CVE-2016-6796",
                "CVE-2016-6797");
  script_bugtraq_id(93940, 93944, 93939, 93942, 93943);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-11 14:49:43 +0530 (Fri, 11 Aug 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache Tomcat Security Bypass and Information Disclosure Vulnerabilities (Windows)");

  script_tag(name:"summary", value:"This host is installed with Apache Tomcat
  and is prone to security bypass and information disclosure vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - An error in the system property replacement feature for configuration files.

  - An error in the realm implementations in Apache Tomcat that does not process
    the supplied password if the supplied user name did not exist.

  - An error in the configured SecurityManager via a Tomcat utility method that
    is accessible to web applications.

  - An error in the configured SecurityManager via manipulation of the
    configuration parameters for the JSP Servlet.

  - An error in the ResourceLinkFactory implementation in Apache Tomcat that
    does not limit web application access to global JNDI resources to those
    resources explicitly linked to the web application.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to gain access to potentially sensitive information and bypass
  certain security restrictions.");

  script_tag(name:"affected", value:"Apache Tomcat versions 9.0.0.M1 to 9.0.0.M9,
  Apache Tomcat versions 8.5.0 to 8.5.4,
  Apache Tomcat versions 8.0.0.RC1 to 8.0.36,
  Apache Tomcat versions 7.0.0 to 7.0.70, and
  Apache Tomcat versions 6.0.0 to 6.0.45 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Apache Tomcat version 9.0.0.M10
  or 8.5.5 or 8.0.37 or 7.0.72 or 6.0.47 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://tomcat.apache.org/security-7.html#Fixed_in_Apache_Tomcat_7.0.72");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-6.html#Fixed_in_Apache_Tomcat_6.0.47");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-9.html#Fixed_in_Apache_Tomcat_9.0.0.M10");
  script_xref(name:"URL", value:"http://tomcat.apache.org/security-8.html#Fixed_in_Apache_Tomcat_8.5.5_and_8.0.37");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web Servers");
  script_dependencies("gb_apache_tomcat_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheTomcat/installed", "Host/runs_windows");
  script_require_ports("Services/www", 8080);
  exit(0);
}

include("host_details.inc");
include("revisions-lib.inc");
include("version_func.inc");

if(!tomPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!appVer = get_app_version(cpe:CPE, port:tomPort)){
  exit(0);
}

if(appVer =~ "^6")
{
  if(revcomp(a: appVer, b: "6.0.47") < 0){
    fix = "6.0.47";
  }
}

else if(appVer =~ "^7")
{
  if(revcomp(a: appVer, b: "7.0.72") < 0){
    fix = "7.0.72";
  }
}

else if(appVer =~ "^(8\.5\.)")
{
  if(revcomp(a: appVer, b: "8.5.5") < 0){
    fix = "8.5.5";
  }
}

else if(appVer =~ "^(8\.)")
{
  if(revcomp(a: appVer, b: "8.0.37") < 0){
    fix = "8.0.37";
  }
}

else if(appVer =~ "^(9\.)")
{
  if(revcomp(a: appVer, b: "9.0.0.M10") < 0){
    fix = "9.0.0.M10";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:appVer, fixed_version:fix);
  security_message(data:report, port:tomPort);
  exit(0);
}
exit(0);

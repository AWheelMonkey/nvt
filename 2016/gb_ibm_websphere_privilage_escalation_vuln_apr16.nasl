###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_privilage_escalation_vuln_apr16.nasl 11903 2018-10-15 10:26:16Z asteins $
#
# IBM Websphere Application Server Privilege Escalation Vulnerability Apr16
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:ibm:websphere_application_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807650");
  script_version("$Revision: 11903 $");
  script_cve_id("CVE-2015-1946");
  script_bugtraq_id(75496);
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 12:26:16 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-12 18:40:47 +0530 (Tue, 12 Apr 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Websphere Application Server Privilege Escalation Vulnerability Apr16");

  script_tag(name:"summary", value:"This host is installed with IBM Websphere
  application server and is prone to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaws is due to the user roles
  not being handled properly.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  attackers to gain elevated privileges on the system.");

  script_tag(name:"affected", value:"IBM WebSphere Application Server (WAS)
  8.5 before 8.5.5.6, 7.0 and 8.0");

  script_tag(name:"solution", value:"Upgrade to IBM WebSphere Application
  Server (WAS) 8.5.5.6 or later for versions 8.5 through 8.5.5.5 and apply
  WebSphere Virtual Enterprise Fix Pack 6 (7.0.0.6) or later for versions
  7.0 and 8.0.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21959083");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_mandatory_keys("ibm_websphere_application_server/installed");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"http://www-03.ibm.com/software/products/en/appserv-was");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!wasPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!wasVer = get_app_version(cpe:CPE, port:wasPort)){
  exit(0);
}

if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.5.5"))
{
  fix = "8.5.5.6";
  VULN = TRUE;
}

else if(version_is_equal(version:wasVer, test_version:"8.0") ||
        version_is_equal(version:wasVer, test_version:"7.0"))
{
  fix = "Apply WebSphere Virtual Enterprise Fix Pack 6 (7.0.0.6) or later.";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:wasVer, fixed_version:fix);
  security_message(data:report, port:wasPort);
  exit(0);
}

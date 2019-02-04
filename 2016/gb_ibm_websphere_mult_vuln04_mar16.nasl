###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_mult_vuln04_mar16.nasl 12456 2018-11-21 09:45:52Z cfischer $
#
# IBM Websphere Application Server Multiple Vulnerabilities-04 Mar16
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
  script_oid("1.3.6.1.4.1.25623.1.0.807621");
  script_version("$Revision: 12456 $");
  script_cve_id("CVE-2015-1882", "CVE-2015-0175", "CVE-2015-0174");
  script_bugtraq_id(74222, 74223, 74215);
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-21 10:45:52 +0100 (Wed, 21 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-21 14:49:58 +0530 (Mon, 21 Mar 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Websphere Application Server Multiple Vulnerabilities-04 Mar16");

  script_tag(name:"summary", value:"This host is installed with IBM Websphere
  application server and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - The Run-as user for EJB not being honored under multi-threaded race conditions.

  - An error with the authData elements.

  - An improper handling of configuarion data in SNMP implementation.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain elevated privileges on the system, also to obtain
  sensitive information.");

  script_tag(name:"affected", value:"IBM WebSphere Application Server (WAS)
  Liberty Profile 8.5.x before 8.5.5.5.");

  script_tag(name:"solution", value:"Upgrade to IBM WebSphere Application
  Server (WAS) Liberty Profile version 8.5.5.5, or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21697368");

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

if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.5.4"))
{
  report = report_fixed_ver(installed_version:wasVer, fixed_version:"8.5.5.5");
  security_message(data:report, port:wasPort);
  exit(0);
}
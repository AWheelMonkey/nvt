###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_bi_publisher_jul2017-3236622_01_vuln.nasl 11936 2018-10-17 09:05:37Z mmartin $
#
# Oracle BI Publisher Multiple Unspecified Vulnerabilities-01 (jul2017-3236622-jul2018-4258247)
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

CPE = "cpe:/a:oracle:business_intelligence_publisher";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811247");
  script_version("$Revision: 11936 $");
  script_cve_id("CVE-2017-10025", "CVE-2017-10024", "CVE-2017-10028", "CVE-2017-10029",
                "CVE-2017-10030", "CVE-2017-10059", "CVE-2018-2900");
  script_bugtraq_id(99697, 99723, 99724, 99738, 99740, 99743);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 11:05:37 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-19 17:26:23 +0530 (Wed, 19 Jul 2017)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Oracle BI Publisher Multiple Unspecified Vulnerabilities-01 (jul2017-3236622-jul2018-4258247)");

  script_tag(name:"summary", value:"This host is installed with Oracle BI Publisher
  and is prone to multiple unspecified vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to unspecified
  errors in 'Mobile Service', 'Web Server', 'Layout Tools' and 'BI Publisher
  Security' components of the application.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to have impact on confidentiality and integrity.");

  script_tag(name:"affected", value:"Oracle BI Publisher version 11.1.1.7.0");

  script_tag(name:"solution", value:"Apply updates from the links mentioned in
  reference.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujul2017-3236622.html");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujul2018-4258247.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_oracle_bi_publisher_detect.nasl");
  script_mandatory_keys("Oracle/BI/Publisher/Enterprise/installed");
  script_require_ports("Services/www", 9704);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!obpPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE, port:obpPort);
obpVer = infos['version'];
obPath = infos['location'];

if(obpVer == "11.1.1.7.0")
{
  report = report_fixed_ver(installed_version:obpVer, fixed_version:"Apply Patch", install_path:obPath);
  security_message(data:report, port:obpPort);
  exit(0);
}

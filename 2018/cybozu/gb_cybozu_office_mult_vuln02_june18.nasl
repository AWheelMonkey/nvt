###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cybozu_office_mult_vuln02_june18.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Cybozu Office Multiple Vulnerabilities-02 June18
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

CPE = "cpe:/a:cybozu:office";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813618");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-0565", "CVE-2018-0566", "CVE-2018-0567");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-06-27 11:07:13 +0530 (Wed, 27 Jun 2018)");
  script_name("Cybozu Office Multiple Vulnerabilities-02 June18");

  script_tag(name:"summary", value:"This host is installed with Cybozu Office
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - An operation restriction bypass error in the application 'Bulletin'.

  - A browse restriction bypass error in the application 'Scheduler'.

  - An input validation error in the application 'MultiReport'.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to execute arbitrary script and bypass security restrictions.");

  script_tag(name:"affected", value:"Cybozu Office versions 10.0.0 to 10.8.0.");

  script_tag(name:"solution", value:"Upgrade to Cybozu Office version 10.8.1 or
  later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://jvn.jp/en/jp/JVN51737843/index.html");
  script_xref(name:"URL", value:"https://office-users.cybozu.co.jp");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_dependencies("secpod_cybozu_products_detect.nasl");
  script_mandatory_keys("CybozuOffice/Installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!infos = get_app_version_and_location(cpe:CPE, port:port, exit_no_version:TRUE)) exit(0);
cybVer = infos['version'];
path = infos['location'];

if(cybVer =~ "^10\.")
{
  if(version_is_less_equal(version:cybVer, test_version:"10.8.0"))
  {
    report = report_fixed_ver(installed_version:cybVer, fixed_version:"10.8.1", install_path:path);
    security_message(data:report, port:port);
    exit(0);
  }
}

exit(99);

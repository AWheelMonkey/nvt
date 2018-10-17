###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ilias_mult_vuln02_may18.nasl 9934 2018-05-23 11:48:03Z santu $
#
# ILIAS LMS Multiple Vulnerabilities-02 May18
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
CPE = "cpe:/a:ilias:ilias";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813199");
  script_version("$Revision: 9934 $");
  script_cve_id("CVE-2018-10306", "CVE-2018-10307", "CVE-2018-10428");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-05-23 13:48:03 +0200 (Wed, 23 May 2018) $");
  script_tag(name:"creation_date", value:"2018-05-21 13:56:09 +0530 (Mon, 21 May 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("ILIAS LMS Multiple Vulnerabilities-02 May18");

  script_tag(name:"summary", value:"This host is installed with ILIAS LMS
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,
  - Insufficient validation of input passed via 'invalid date' to
  'Services/Form/classes/class.ilDateDurationInputGUI.php' script and
  'Services/Form/classes/class.ilDateTimeInputGUI.php' script.

  - Insufficient validation of input passed via text of a PDO exception to
  'error.php' script.

  - An unspecified vulnerability.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to conduct XSS attacks and have unspecified impact on affected
  system.

  Impact Level: Application");

  script_tag(name:"affected", value:"ILIAS LMS 5.3.x prior to 5.3.4 and 5.2.x
  prior to 5.2.15");

  script_tag(name:"solution", value:"Upgrade to ILIAS LMS 5.3.4 or 5.2.15 or
  later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://www.ilias.de/docu/ilias.php?ref_id=35&obj_id=116792&from_page=116805&cmd=layout&cmdClass=illmpresentationgui&cmdNode=wc&baseClass=ilLMPresentationGUI");
  script_xref(name : "URL" , value : "https://www.ilias.de/docu/ilias.php?ref_id=35&from_page=116799&obj_id=116799&cmd=layout&cmdClass=illmpresentationgui&cmdNode=wc&baseClass=ilLMPresentationGUI");
  script_xref(name : "URL" , value : "https://www.ilias.de");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_ilias_detect.nasl");
  script_mandatory_keys("ilias/installed", "ilias/version");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!ilPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:ilPort, exit_no_version:TRUE);
ilVer = infos['version'];
path = infos['location'];

if(ilVer =~ "^(5\.3)" && version_is_less(version:ilVer, test_version:"5.3.4")){
  fix = "5.3.4";
} 
else if (ilVer =~ "^(5\.2)" && version_is_less(version:ilVer, test_version:"5.2.15")){
  fix = "5.2.15";
}

if(fix)
{
  report = report_fixed_ver(installed_version:ilVer, fixed_version:fix, install_path:path);
  security_message(data:report, port:ilPort);
  exit(0);
}
exit(0);

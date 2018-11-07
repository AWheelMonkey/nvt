###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_jenkins_xss_n_info_disc_vuln_apr18_win.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# Jenkins Cross Site Scripting And Information disclosure Vulnerabilities Apr18 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
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

CPE = "cpe:/a:cloudbees:jenkins";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813315");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-1000169", "CVE-2018-1000170");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-04-23 16:40:26 +0530 (Mon, 23 Apr 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Jenkins Cross Site Scripting And Information disclosure Vulnerabilities Apr18 (Windows)");

  script_tag(name:"summary", value:"This host is running Jenkins and is prone
  to cross site scripting and information disclosure vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Some JavaScript confirmation dialogs included the item name in an unsafe
    manner.

  - The Jenkins CLI send different error responses for commands with view and
    agent arguments depending on the existence of the specified views or agents
    to unauthorized users.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute a script on victim's Web browser within the security
  context of the hosting Web site and also disclose sensitive information.");

  script_tag(name:"affected", value:"Jenkins 2.115 and older, LTS 2.107.1 and
  older.");

  script_tag(name:"solution", value:"Upgrade to Jenkins weekly to 2.116 or
  later, Jenkins LTS to 2.107.2 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://jenkins.io/security/advisory/2018-04-11/#SECURITY-759");
  script_xref(name:"URL", value:"https://www.cloudbees.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("sw_jenkins_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("jenkins/installed", "Host/runs_windows");
  script_require_ports("Services/www", 8080);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!jport = get_app_port(cpe:CPE)) exit(0);
if(!infos = get_app_version_and_location(cpe:CPE, port:jport, exit_no_version:TRUE)) exit(0);

jenVer = infos['version'];
path = infos['location'];

if(get_kb_item("jenkins/" + jport + "/is_lts"))
{
  if(version_is_less(version:jenVer, test_version:"2.107.2")){
    fix = "2.107.2";
  }
}
else
{
  if(version_is_less(version:jenVer, test_version:"2.116")){
    fix = "2.116";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:jenVer, fixed_version:fix, install_path:path);
  security_message(port:jport, data:report);
  exit( 0 );
}
exit(0);

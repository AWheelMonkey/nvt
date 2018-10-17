###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_intel_amt_mult_bof_vuln.nasl 8367 2018-01-11 07:32:43Z cfischer $
#
# Intel Active Management Technology Multiple Buffer Overflow Vulnerabilities
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

CPE = 'cpe:/h:intel:active_management_technology';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812222");
  script_version("$Revision: 8367 $");
  script_cve_id("CVE-2017-5711", "CVE-2017-5712");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-01-11 08:32:43 +0100 (Thu, 11 Jan 2018) $");
  script_tag(name:"creation_date", value:"2017-11-22 13:16:37 +0530 (Wed, 22 Nov 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Intel Active Management Technology Multiple Buffer Overflow Vulnerabilities");

  script_tag(name: "summary" , value:"This host is installed with Intel
  Active Management Technology and is prone to multiple buffer overflow 
  vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"Multiple flaws are due to multiple unspecified
  buffer overflow errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers 
  to execute arbitrary code with AMT execution privilege.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Intel AMT for Intel ME Firmware versions 
  8.x, 9.x, 10.x, 11.0.x.x, 11.5.x.x, 11.6.x.x, 11.7.x.x, 11.10.x.x and 11.20.x.x.");

  script_tag(name: "solution" , value:"Upgrade Intel Active Management Technology to 
  appropriate Intel ME firmware version as mentioned in the link below.
  https://security-center.intel.com/advisory.aspx?intelid=INTEL-SA-00086&languageid=en-fr 
  For updates refer to https://downloadcenter.intel.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://thehackernews.com/2017/11/intel-chipset-flaws.html");
  script_xref(name : "URL" , value : "https://security-center.intel.com/advisory.aspx?intelid=INTEL-SA-00086&languageid=en-fr");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_intel_amt_webui_detect.nasl");
  script_mandatory_keys("intel_amt/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

imePort = 0;
imeVer = "";

if(!imePort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!infos = get_app_version_and_location( cpe:CPE, port:imePort, exit_no_version:TRUE)) exit(0);
imeVer = infos['version'];
imepath = infos['location'];

if(imeVer =~ "^(8|9|10|(11\.(0|5|6|7|10|20)))")
{
  report = report_fixed_ver(installed_version:imeVer, fixed_version:"Upgrade to appropriate Intel ME firmware version as mentioned in reference link", install_path:imepath);
  security_message(port:imePort, data:report);
  exit(0);
}
exit(0);                       

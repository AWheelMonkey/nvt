###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hpe_loadrunner_mms_prot_bof_vuln.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# HPE LoadRunner MMS Protocol Buffer Overflow RCE Vulnerability
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

CPE = "cpe:/a:hp:loadrunner";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812940");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2016-8512");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-02-21 18:29:57 +0530 (Wed, 21 Feb 2018)");
  script_name("HPE LoadRunner MMS Protocol Buffer Overflow RCE Vulnerability");

  script_tag(name:"summary", value:"This host is installed with HPE LoadRunner
  and is prone to a remote code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to buffer overflow
  error in the MMS protocol due to improper validation of user-supplied input.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attacker to cause a denial of service condition or the execution of arbitrary
  code.");

  script_tag(name:"affected", value:"HPE LoadRunner");

  script_tag(name:"solution", value:"Mitigation from the vendor is available.
  Remove the files MMSEngine.dll and MM1Client.dll.");

  script_tag(name:"solution_type", value:"Mitigation");
  ##Lowering QOD as Mitigation is available as solution
  script_tag(name:"qod", value:"30");
  script_xref(name:"URL", value:"https://support.hpe.com/hpsc/doc/public/display?docId=emr_na-c05354136");
  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_dependencies("gb_hpe_loadrunner_detect.nasl");
  script_mandatory_keys("HPE/LoadRunner/Win/Ver");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

infos = "";
vers = "";
path = "";

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

report = report_fixed_ver(installed_version:vers, fixed_version:"Mitigation is available", install_path:path);
security_message(data:report);
exit(0);

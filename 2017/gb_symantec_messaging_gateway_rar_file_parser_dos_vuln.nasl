###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_symantec_messaging_gateway_rar_file_parser_dos_vuln.nasl 11935 2018-10-17 08:47:01Z mmartin $
#
# Symantec Messaging Gateway RAR File Parser DoS Vulnerabilities
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

CPE = "cpe:/a:symantec:messaging_gateway";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810915");
  script_version("$Revision: 11935 $");
  script_cve_id("CVE-2016-5309", "CVE-2016-5310");
  script_bugtraq_id(92866, 92868);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-17 10:47:01 +0200 (Wed, 17 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-04-25 12:27:02 +0530 (Tue, 25 Apr 2017)");
  script_name("Symantec Messaging Gateway RAR File Parser DoS Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with Symantec Messaging Gateway
  and is prone to denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to mishandling of
  RAR file by RAR file parser component in the AntiVirus Decomposer engine.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service (out-of-bounds read) via a crafted RAR
  file that is mishandled during decompression.");

  script_tag(name:"affected", value:"Symantec Messaging Gateway (SMG) before 10.6.2");

  script_tag(name:"solution", value:"Upgrade to Symantec Messaging Gateway (SMG)
  10.6.2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40405");
  script_xref(name:"URL", value:"https://www.symantec.com/security_response/securityupdates/detail.jsp?fid=security_advisory&pvid=security_advisory&year=&suid=20160919_00");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_dependencies("gb_symantec_messaging_gateway_detect.nasl");
  script_mandatory_keys("symantec_smg/detected");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!version = get_app_version(cpe:CPE, nofork: TRUE)) exit(0);

if(version_is_less(version:version, test_version:"10.6.2")) {
  report = report_fixed_ver(installed_version:version, fixed_version:'10.6.2');
  security_message(port: 0, data:report);
  exit(0);
}

exit(0);

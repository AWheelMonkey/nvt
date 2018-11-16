###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_spip_multiple_vuln.nasl 12338 2018-11-13 14:51:17Z asteins $
#
# SPIP Multiple Vulnerabilities
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:spip:spip";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809305");
  script_version("$Revision: 12338 $");
  script_cve_id("CVE-2016-7998", "CVE-2016-7999", "CVE-2016-7982", "CVE-2016-7980",
 		"CVE-2016-7981");
  script_bugtraq_id(93451);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-13 15:51:17 +0100 (Tue, 13 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-11-08 15:15:46 +0530 (Tue, 08 Nov 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("SPIP Multiple Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with SPIP
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to

  - The SPIP template composer/compiler does not correctly handle SPIP
    'INCLUDE/INCLURE' tags.

  - The 'var_url' parameter of the 'valider_xml' file is not correctly sanitized.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary script code in a user's browser session within
  the trust relationship between their browser and the server, trick an
  administrator to open the malicious link, retrieve arbitrary files, bypass
  security restrictions and other attacks are also possible.");

  script_tag(name:"affected", value:"SPIP version prior to 3.1.3");

  script_tag(name:"solution", value:"Upgrade to SPIP version 3.1.3 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL" , value:"https://www.exploit-db.com/exploits/40595");
  script_xref(name:"URL" , value:"https://www.exploit-db.com/exploits/40596");
  script_xref(name:"URL" , value:"https://www.exploit-db.com/exploits/40597");
  script_xref(name:"URL" , value:"http://seclists.org/fulldisclosure/2016/Oct/78");
  script_xref(name:"URL" , value:"http://osdir.com/ml/opensource-software-security/2016-10/msg00108.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_spip_detect.nasl");
  script_mandatory_keys("spip/installed");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"http://www.spip.net");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!sp_port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!sp_Ver = get_app_version(cpe:CPE, port:sp_port)){
  exit(0);
}

if(version_is_less(version:sp_Ver, test_version:"3.1.3"))
{
  report = report_fixed_ver(installed_version:sp_Ver, fixed_version:"3.1.3");
  security_message(port:sp_port, data:report);
  exit(0);
}

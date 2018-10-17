###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_domino_java_console_auth_bypass_vuln.nasl 11702 2018-10-01 07:31:38Z asteins $
#
# IBM Domino 'java console' Authentication Bypass Vulnerability
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

CPE = "cpe:/a:ibm:lotus_domino";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808191");
  script_version("$Revision: 11702 $");
  script_cve_id("CVE-2016-0304");
  script_bugtraq_id(90804);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-01 09:31:38 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-07-12 17:25:38 +0530 (Tue, 12 Jul 2016)");
  script_name("IBM Domino 'java console' Authentication Bypass Vulnerability");

  script_tag(name:"summary", value:"This host is installed with IBM Domino and
  is prone to authentication bypass vulnerability");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an error in the java
  console when a certain unsupported configuration involving UNC share path names
  is used.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker
  to bypass the authentication process and possibly execute arbitrary code
  with SYSTEM privileges.");

  script_tag(name:"affected", value:"IBM Domino versions 8.5.x before
  8.5.3 FP6 IF13 and 9.x before 9.0.1 FP6");

  script_tag(name:"solution", value:"Upgrade to IBM Domino 9.0.1 FP6,
  8.5.3 FP6 IF13 or later.
  For updates refer to http://www-01.ibm.com/support/docview.wss?uid=swg21983328");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21983328");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_lotus_domino_detect.nasl");
  script_mandatory_keys("Domino/Version");
  exit(0);
}

include("version_func.inc");
include("revisions-lib.inc"); # Used in get_highest_app_version
include("host_details.inc");

if(!domVer = get_highest_app_version(cpe:CPE)){
  exit(0);
}


domVer1 = ereg_replace(pattern:"FP", string:domVer, replace: ".");

if(version_in_range(version:domVer1, test_version:"8.5", test_version2:"8.5.3.5"))
{
  fix = "8.5.3 FP6 IF13";
  VULN = TRUE;
}

if(version_in_range(version:domVer1, test_version:"9.0.0", test_version2:"9.0.1.5"))
{
  fix = "9.0.1 FP6";
  VULN = TRUE;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:domVer, fixed_version:fix);
  security_message(data:report, port:0);
  exit(0);
}

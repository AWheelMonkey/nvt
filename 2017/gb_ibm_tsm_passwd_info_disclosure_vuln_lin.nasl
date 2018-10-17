###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_tsm_passwd_info_disclosure_vuln_lin.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# IBM TSM Client 'Password' Information Disclosure Vulnerability - Linux
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

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:ibm:tivoli_storage_manager";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811064");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2016-0371");
  script_bugtraq_id(94148);
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-02 15:14:31 +0530 (Fri, 02 Jun 2017)");
  script_name("IBM TSM Client 'Password' Information Disclosure Vulnerability - Linux");

  script_tag(name:"summary", value:"This host is installed with IBM Tivoli Storage
  Manager Client and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error when
  application tracing is enabled and a password change operation is performed.");

  script_tag(name:"impact", value:"Successful exploitation will allow a local
  user to get password in plain text in the trace output.");

  script_tag(name:"affected", value:"Tivoli Storage Manager Client versions
  7.1.0.0 through 7.1.6.2, 6.4.0.0 through 6.4.3.3, 6.3.0.0 through 6.3.2.5,
  6.2, 6.1, and 5.5 all levels.");

  script_tag(name:"solution", value:"Upgrade to IBM Tivoli Storage Manager Client
  version 7.1.6.3 or 6.4.3.4 or 6.3.2.6 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21985114");

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_ibm_tiv_tsm_detect_lin.nasl");
  script_mandatory_keys("IBM/Tivoli/Storage/Manager/Linux/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!tivVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:tivVer, test_version:"5.5", test_version2:"6.3.2.5")){
  fix = "6.3.2.6";
}

else if(version_in_range(version:tivVer, test_version:"6.4", test_version2:"6.4.3.3")){
  fix = "6.4.3.4";
}

else if(version_in_range(version:tivVer, test_version:"7.1", test_version2:"7.1.6.2")){
  fix = "7.1.6.3";
}

if(fix)
{
  report = report_fixed_ver(installed_version:tivVer, fixed_version:fix);
  security_message(data:report);
  exit(0);
}

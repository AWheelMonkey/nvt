###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hpe_insight_mgt_sizer_remote_code_exec_vuln.nasl 12051 2018-10-24 09:14:54Z asteins $
#
# HPE Insight Management Sizer Remote Arbitrary Code Execution Vulnerability
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:hp:insight_management_sizer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809191");
  script_version("$Revision: 12051 $");
  script_cve_id("CVE-2016-4377");
  script_bugtraq_id(92479);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-24 11:14:54 +0200 (Wed, 24 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-09-02 15:19:02 +0530 (Fri, 02 Sep 2016)");
  script_name("HPE Insight Management Sizer Remote Arbitrary Code Execution Vulnerability");

  script_tag(name:"summary", value:"This host is installed with HPE Insight
  Management Sizer and is prone to remote arbitrary code execution vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified
  error.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  arbitrary code execution.");

  script_tag(name:"affected", value:"HPE Insight Management Sizer prior
  to 16.12.1");

  script_tag(name:"solution", value:"Upgrade to HPE Insight Management
  Sizer version 16.12.1 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://h20564.www2.hpe.com/hpsc/doc/public/display?docId=emr_na-c05237578");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_hpe_insight_management_sizer_detect.nasl");
  script_mandatory_keys("HPE/Insight/Management/Win/Ver");

  script_xref(name:"URL", value:"https://www.hpe.com");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!hpVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:hpVer, test_version:"16.12.1"))
{
  report = report_fixed_ver(installed_version:hpVer, fixed_version:"16.12.1");
  security_message(data:report);
  exit(0);
}
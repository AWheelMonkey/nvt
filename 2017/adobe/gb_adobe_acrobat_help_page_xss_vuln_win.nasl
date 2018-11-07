###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_acrobat_help_page_xss_vuln_win.nasl 12142 2018-10-29 08:28:54Z cfischer $
#
# Adobe Acrobat Help Page Cross Site Scripting Vulnerability (Windows)
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

CPE = "cpe:/a:adobe:acrobat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812287");
  script_version("$Revision: 12142 $");
  script_cve_id("CVE-2014-5315");
  script_bugtraq_id(69791);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 09:28:54 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-12-29 11:29:42 +0530 (Fri, 29 Dec 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Adobe Acrobat Help Page Cross Site Scripting Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is running Adobe Acrobat and is
  prone to cross site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an input validation
  error in Help page.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to inject arbitrary web script or HTML via unspecified vectors.");

  script_tag(name:"affected", value:"Adobe Acrobat 9.5.2 and earlier.");

  script_tag(name:"solution", value:"Upgrade to latest version of Adobe Acrobat
  according to the information provided by the developer.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://jvn.jp/en/jp/JVN84376800/index.html");
  script_xref(name:"URL", value:"http://jvndb.jvn.jp/en/contents/2014/JVNDB-2014-000105.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Acrobat/Win/Installed");
  script_xref(name:"URL", value:"http://www.adobe.com");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE);
adVer = infos['version'];
path = infos['location'];

if(version_is_less_equal(version:adVer, test_version:"9.5.2"))
{
  report = report_fixed_ver(installed_version:adVer, fixed_version:"Upgrade to latest version according to the information provided by the developer", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);

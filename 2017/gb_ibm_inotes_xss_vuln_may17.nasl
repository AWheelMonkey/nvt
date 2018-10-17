###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_inotes_xss_vuln_may17.nasl 11874 2018-10-12 11:28:04Z mmartin $
#
# IBM iNotes Cross-Site Scripting Vulnerability May17
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:ibm:lotus_domino";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811125");
  script_version("$Revision: 11874 $");
  script_cve_id("CVE-2017-1325");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:28:04 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-05-29 14:57:17 +0530 (Mon, 29 May 2017)");
  script_name("IBM iNotes Cross-Site Scripting Vulnerability May17");

  script_tag(name:"summary", value:"This host is installed with IBM iNotes and
  is prone to cross site scripting vulnerability");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an input validation error
  in Web UI.");

  script_tag(name:"impact", value:"Successful exploitation will allow users to embed
  arbitrary JavaScript code in the Web UI thus altering the intended functionality
  potentially leading to credentials disclosure within a trusted session.");

  script_tag(name:"affected", value:"IBM iNotes version 9.0 and 9.0.1 prior to
  9.0.1 FP8 IF2, 8.5, 8.5.1, 8.5.2 and 8.5.3 prior to 8.5.3 FP6 IF4");

  script_tag(name:"solution", value:"Upgrade to IBM iNotes 9.0.1 FP8 IF2 or,
  8.5.3 FP6 IF4 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg22003497");

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_lotus_domino_detect.nasl");
  script_mandatory_keys("Domino/Version");
  exit(0);
}

include("version_func.inc");
include("revisions-lib.inc"); # Used in get_highest_app_version
include("host_details.inc");

if(!port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!domVer = get_highest_app_version(cpe:CPE)){
  exit(0);
}

domVer = ereg_replace(pattern:"FP", string:domVer, replace: ".");

if(domVer =~ "^(9\.0)")
{
  if(version_in_range(version:domVer, test_version:"9.0", test_version2:"9.0.1.7")){
    fix = "9.0.1 Fix Pack 8 Interim Fix 2";
  }
}

else if(domVer =~ "^(8\.5)")
{
  if(version_in_range(version:domVer, test_version:"8.5", test_version2:"8.5.3.6")){
    fix = "8.5.3 Fix Pack 6 Interim Fix 4";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:domVer, fixed_version:fix);
  security_message(data:report, port:port);
  exit(0);
}

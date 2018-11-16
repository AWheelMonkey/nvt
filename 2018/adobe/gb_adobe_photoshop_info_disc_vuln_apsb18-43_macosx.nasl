###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_photoshop_info_disc_vuln_apsb18-43_macosx.nasl 12362 2018-11-15 09:45:28Z santu $
#
# Adobe Photoshop CC Information Disclosure Vulnerability-APSB18-28 (Mac OS X)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
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

CPE = "cpe:/a:adobe:photoshop_cc2018";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814197");
  script_version("$Revision: 12362 $");
  script_cve_id("CVE-2018-15980");
  script_bugtraq_id(105905);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-15 10:45:28 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-15 13:26:21 +0530 (Thu, 15 Nov 2018)");
  script_name("Adobe Photoshop CC Information Disclosure Vulnerability-APSB18-28 (Mac OS X)");

  script_tag(name:"summary", value:"The host is installed with Adobe Photoshop
  CC and is prone to information disclosure vulnerability");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to out-of-bounds read
  when handling malicious input. A remote attacker can trick the victim into
  opening specially crafted data, trigger memory corruption and gain access
  to potentially sensitive information.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to disclosure of sensitive information which may aid in launching further
  attacks.");

  script_tag(name:"affected", value:"Adobe Photoshop CC 2018 19.1.6 and earlier on Mac OS X.");

  script_tag(name:"solution", value:"Upgrade to Photoshop CC 2018 19.1.7, 20.0 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/photoshop/apsb18-43.html");
  script_xref(name:"URL", value:"http://www.adobe.com/in/products/photoshop.html");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_adobe_photoshop_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Photoshop/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
pver = infos['version'];
ppath = infos['location'];

if(version_in_range(version:pver, test_version:"19.0", test_version2:"19.1.6"))
{
  report = report_fixed_ver( installed_version: "Adobe Photoshop CC 2018 " + pver, fixed_version: "19.1.7", install_path:ppath);
  security_message(data:report);
}
exit(99);

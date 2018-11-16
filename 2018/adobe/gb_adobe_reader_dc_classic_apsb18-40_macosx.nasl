###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_dc_classic_apsb18-40_macosx.nasl 12362 2018-11-15 09:45:28Z santu $
#
# Adobe Reader DC 2015 Information Disclosure Vulnerability(apsb18-40)-MAC OS X
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat_reader_dc_classic";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814195");
  script_version("$Revision: 12362 $");
  script_cve_id("CVE-2018-15979");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-15 10:45:28 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-15 12:20:33 +0530 (Thu, 15 Nov 2018)");
  script_name("Adobe Reader DC 2015 Information Disclosure Vulnerability(apsb18-40)-MAC OS X");

  script_tag(name:"summary", value:"This host is installed with Adobe Reader DC 2015
  and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name: "insight" , value:"The flaw exists due to an error in handing
  the feature of Portable Document Files (PDFs).That leaks NT LAN Manager (NTLM)
  credentials.");

  script_tag(name:"impact" , value:"Successful exploitation will allow remote
  attackers to an inadvertent leak of the users hashed NTLM password.");

  script_tag(name: "affected" , value:"Adobe Reader DC 2015 version 2015.x before 2015.006.30457 on MAC OS X.");

  script_tag(name:"solution", value:"Upgrade to Adobe Reader DC 2015 version
  2015.006.30457 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name: "URL" , value :"https://helpx.adobe.com/security/products/acrobat/apsb18-40.html");
  script_xref(name:"URL", value:"https://helpx.adobe.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_acrobat_reader_dc_classic_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Acrobat/ReaderDC/Classic/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
readerVer = infos['version'];
InstallPath = infos['location'];

if(version_in_range(version:readerVer, test_version:"2015.0", test_version2:"2015.006.30456"))
{
  report = report_fixed_ver(installed_version:readerVer, fixed_version:"2015.006.30457", install_path:InstallPath);
  security_message(data:report);
  exit(0);
}
exit(99);

##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxit_phantompdf_mult_vuln_jan19_win.nasl 13269 2019-01-24 14:09:58Z jschulte $
#
# Foxit PhantomPDF Multiple Vulnerabilities-Jan 2019 (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:foxitsoftware:phantompdf";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814582");
  script_version("$Revision: 13269 $");
  script_cve_id("CVE-2018-18688", "CVE-2018-18689", "CVE-2018-3956",
  "CVE-2019-5005", "CVE-2019-5006", "CVE-2019-5007");
  script_tag(name:"cvss_base", value:"6.2");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:M/C:C/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2019-01-24 15:09:58 +0100 (Thu, 24 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-04 15:15:18 +0530 (Fri, 04 Jan 2019)");
  script_name("Foxit PhantomPDF Multiple Vulnerabilities-Jan 2019 (Windows)");

  script_tag(name:"summary", value:"The host is installed with Foxit PhantomPDF and
  is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on
  the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to:

  - Error in handing image data, because two bytes are written to the end
    of the allocated memory without judging whether this will cause
    corruption

  - A NULL pointer dereference during PDF parsing

  - An Out-of-Bounds Read Information Disclosure and crash due to a
    NULL pointer dereference when reading TIFF data during TIFF parsing

  - An out-of-bounds read/write vulnerability and crash
    when handling XFA element attributes");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service.");

  script_tag(name:"affected", value:"Foxit PhantomPDF versions 9.3.0.10826 and prior on Windows.");

  script_tag(name:"solution", value:"Upgrade to Foxit PhantomPDF 9.4 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"http://www.foxitsoftware.com");
  script_xref(name:"URL", value:"https://www.foxitsoftware.com/support/security-bulletins.php");

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_foxit_phantom_reader_detect.nasl");
  script_mandatory_keys("foxit/phantompdf/ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
pdfVer = infos['version'];
pdfPath = infos['location'];

if(version_is_less(version:pdfVer, test_version:"9.4"))
{
  report = report_fixed_ver(installed_version:pdfVer, fixed_version:"9.4", install_path:pdfPath);
  security_message(data:report);
  exit(0);
}
exit(0);

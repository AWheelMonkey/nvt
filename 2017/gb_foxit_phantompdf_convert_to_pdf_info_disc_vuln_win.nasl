###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxit_phantompdf_convert_to_pdf_info_disc_vuln_win.nasl 11888 2018-10-12 15:27:49Z cfischer $
#
# Foxit PhantomPDF 'ConvertToPDF plugin' Information Disclosure Vulnerability (Windows)
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

CPE = "cpe:/a:foxitsoftware:phantompdf";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809874");
  script_version("$Revision: 11888 $");
  script_cve_id("CVE-2017-5556");
  script_bugtraq_id(95353);
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 17:27:49 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-01-24 12:33:27 +0530 (Tue, 24 Jan 2017)");
  script_name("Foxit PhantomPDF 'ConvertToPDF plugin' Information Disclosure Vulnerability (Windows)");

  script_tag(name:"summary", value:"The host is installed with Foxit PhantomPDF
  and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists as the ConvertToPDF plugin
  does not properly handle a crafted JPEG image.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to get sensitive information, also an attacker can leverage this in
  conjunction with other vulnerabilities to execute code in the context of the
  current process.");

  script_tag(name:"affected", value:"Foxit PhantomPDF version prior to 8.2");

  script_tag(name:"solution", value:"Upgrade to Foxit PhantomPDF version
  8.2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"http://www.zerodayinitiative.com/advisories/ZDI-17-039");
  script_xref(name:"URL", value:"https://www.foxitsoftware.com/support/security-bulletins.php");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_foxit_phantom_reader_detect.nasl");
  script_mandatory_keys("foxit/phantompdf/ver");
  script_xref(name:"URL", value:"http://www.foxitsoftware.com");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!foxitVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:foxitVer, test_version:"8.2"))
{
  report = report_fixed_ver(installed_version:foxitVer, fixed_version:"8.2");
  security_message(data:report);
  exit(0);
}

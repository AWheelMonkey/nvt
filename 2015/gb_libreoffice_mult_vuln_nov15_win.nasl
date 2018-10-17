###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_libreoffice_mult_vuln_nov15_win.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# LibreOffice Multiple Vulnerabilities Nov15 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:libreoffice:libreoffice";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806572");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-5213", "CVE-2015-5212", "CVE-2015-4551");
  script_bugtraq_id(77486);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-11-16 15:31:04 +0530 (Mon, 16 Nov 2015)");
  script_tag(name:"qod_type", value:"registry");
  script_name("LibreOffice Multiple Vulnerabilities Nov15 (Windows)");

  script_tag(name:"summary", value:"The host is installed with LibreOffice
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to:

  - Usage of stored LinkUpdateMode configuration information in OpenDocument
    Format files and templates when handling links.

  - Integer underflow when the configuration setting 'Load printer settings with
  the document' is enabled.

  - Integer overflow via a long DOC file.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to obtain sensitive information, to cause a denial of service or
  possibly execute arbitrary code.");

  script_tag(name:"affected", value:"LibreOffice version before 4.4.5 on
  Windows.");

  script_tag(name:"solution", value:"Upgrade to LibreOffice version
  4.4.5 or 5.0.0 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.libreoffice.org/about-us/security/advisories/cve-2015-4551");
  script_xref(name:"URL", value:"https://www.libreoffice.org/about-us/security/advisories/cve-2015-5212");
  script_xref(name:"URL", value:"https://www.libreoffice.org/about-us/security/advisories/cve-2015-5213");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_libreoffice_detect_portable_win.nasl");
  script_mandatory_keys("LibreOffice/Win/Ver");
  script_xref(name:"URL", value:"http://www.libreoffice.org");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!libreVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:libreVer, test_version:"4.4.5"))
{
  report = 'Installed version: ' + libreVer + '\n' +
           'Fixed version:     4.4.5 or 5.0.0 or later\n';
  security_message(data:report);
  exit(0);
}

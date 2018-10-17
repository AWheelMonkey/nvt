###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mfsa_2017-01_2017-02_win.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# Mozilla Firefox ESR Security Updates(mfsa_2017-01_2017-02)-Windows
#
# Authors:
# kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809877");
  script_version("$Revision: 10965 $");
  script_cve_id("CVE-2017-5375", "CVE-2017-5376", "CVE-2017-5378", "CVE-2017-5380",
		"CVE-2017-5390", "CVE-2017-5396", "CVE-2017-5383", "CVE-2017-5386",
		"CVE-2017-5373");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-01-27 12:11:16 +0530 (Fri, 27 Jan 2017)");
  script_name("Mozilla Firefox ESR Security Updates(mfsa_2017-01_2017-02)-Windows");

  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox
  ESR and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaws exists due to,
  - The excessive JIT code allocation allows bypass of ASLR and DEP.
  - An use-after-free in XSL.
  - The pointer and frame data leakage of Javascript objects.
  - The potential use-after-free during DOM manipulations.
  - An insecure communication methods in Developer Tools JSON viewer.
  - An use-after-free with Media Decoder.
  - A location bar spoofing with unicode characters.
  - The webExtensions can use data: protocol to affect other extensions.");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to execute arbitrary code, to delete arbitrary files
  by leveraging certain local file execution, to obtain sensitive information,
  and to cause a denial of service.

  Impact Level: Application.");

  script_tag(name:"affected", value:"Mozilla Firefox ESR version before
  45.7 on Windows.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox ESR version 45.7
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2017-02/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}

if(version_is_less(version:ffVer, test_version:"45.7"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"45.7");
  security_message(data:report);
  exit(0);
}

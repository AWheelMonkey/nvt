##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mfsa_2017-08_2017-08_win.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# Mozilla Firefox Security Updates(mfsa_2017-08_2017-08)-Windows
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810819");
  script_version("$Revision: 10965 $");
  script_cve_id("CVE-2017-5428");
  script_bugtraq_id(96959);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-03-20 13:40:58 +0530 (Mon, 20 Mar 2017)");
  script_name("Mozilla Firefox Security Updates(mfsa_2017-08_2017-08)-Windows");

  script_tag(name:"summary", value:"This host is installed with Mozilla Firefox
  and is prone to buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an integer overflow
  in createImageBitmap().");

  script_tag(name:"impact", value:"Successful exploitation of this vulnerability
  will allow remote attackers to cause buffer overflow.

  Impact Level: Application.");

  script_tag(name:"affected", value:"Mozilla Firefox version before 52.0.1
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 52.0.1
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2017-08");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}

if(version_is_less(version:ffVer, test_version:"52.0.1"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"52.0.1");
  security_message(data:report);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mult_vuln_sep15_win.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Mozilla Firefox Multiple Vulnerabilities - Sep15 (Windows)
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805754");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-7327", "CVE-2015-7180", "CVE-2015-7179", "CVE-2015-7178",
                "CVE-2015-7177", "CVE-2015-7176", "CVE-2015-7175", "CVE-2015-7174",
                "CVE-2015-4522", "CVE-2015-4521", "CVE-2015-4520", "CVE-2015-4519",
                "CVE-2015-4517", "CVE-2015-4516", "CVE-2015-4511", "CVE-2015-4510",
                "CVE-2015-4509", "CVE-2015-4508", "CVE-2015-4507", "CVE-2015-4506",
                "CVE-2015-4505", "CVE-2015-4504", "CVE-2015-4503", "CVE-2015-4502",
                "CVE-2015-4501", "CVE-2015-4500");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-09-29 18:11:28 +0530 (Tue, 29 Sep 2015)");
  script_name("Mozilla Firefox Multiple Vulnerabilities - Sep15 (Windows)");

  script_tag(name:"summary", value:"This host is installed with Mozilla
  Firefox and is prone to vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are exists due to,

  - Failed to  restrict the availability of High Resolution Time API times,

  - Multiple memory corruption flaws,

  - 'js/src/proxy/Proxy.cpp' mishandles certain receiver arguments,

  - Multiple unspecified errors.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  and remote attackers to cause a denial of service or possibly execute arbitrary
  code, gain privileges and some unspecified impacts.");

  script_tag(name:"affected", value:"Mozilla Firefox version before 41.0 on
  Windows");

  script_tag(name:"solution", value:"Upgrade to Mozilla Firefox version 41.0
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-114/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  script_xref(name:"URL", value:"http://www.mozilla.com/en-US/firefox/all.html");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}
if(version_is_less(version:ffVer, test_version:"41.0"))
{
  report = 'Installed version: ' + ffVer + '\n' +
           'Fixed version:     ' + "41.0" + '\n';
  security_message(data:report);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_jan2019-5072801_07_win.nasl 13394 2019-02-01 07:36:10Z mmartin $
#
# Oracle VirtualBox Security Updates (jan2019-5072801) 07 - Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814658");
  script_version("$Revision: 13394 $");
  script_cve_id("CVE-2018-0734");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-02-01 08:36:10 +0100 (Fri, 01 Feb 2019) $");
  script_tag(name:"creation_date", value:"2019-01-16 15:28:33 +0530 (Wed, 16 Jan 2019)");
  script_name("Oracle VirtualBox Security Updates (jan2019-5072801) 07 - Windows");

  script_tag(name:"summary", value:"The host is installed with Oracle VM
  VirtualBox and is prone to an unspecified security vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified
  error in Core (OpenSSL) component.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to affect confidentiality via unknown vectors.");

  script_tag(name:"affected", value:"VirtualBox versions Prior to 5.2.24
  Windows.");

  script_tag(name:"solution", value:"Upgrade to Oracle VirtualBox Prior to
  5.2.24 or later, For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/security-advisory/cpujan2019-5072801.html");
  script_xref(name:"URL", value:"https://www.virtualbox.org");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_mandatory_keys("Oracle/VirtualBox/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
virtualVer = infos['version'];
path = infos['location'];

if(version_is_less(version:virtualVer, test_version:"5.2.24"))
{
  report = report_fixed_ver(installed_version:virtualVer, fixed_version:"5.2.24", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);

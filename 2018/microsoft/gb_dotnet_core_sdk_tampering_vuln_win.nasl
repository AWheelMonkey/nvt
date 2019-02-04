###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dotnet_core_sdk_tampering_vuln_win.nasl 13072 2019-01-15 08:12:06Z asteins $
#
# ASP.NET Core SDK Tampering Vulnerability-Nov18 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
##########################################################################

CPE = "cpe:/a:microsoft:.netcore_sdk";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814296");
  script_version("$Revision: 13072 $");
  script_cve_id("CVE-2018-8416");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-15 09:12:06 +0100 (Tue, 15 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-11-15 17:19:11 +0530 (Thu, 15 Nov 2018)");
  script_name("ASP.NET Core SDK Tampering Vulnerability-Nov18 (Windows)");

  script_tag(name:"summary", value:"This host is installed with ASP.NET Core SDK
  and is prone to a tampering vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error when .NET
  Core improperly handles specially crafted files.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to write arbitrary files and directories to certain locations on a vulnerable
  system.");

  script_tag(name:"affected", value:"ASP.NET Core SDK 2.1 prior to version 2.1.500");

  script_tag(name:"solution", value:"Upgrade to ASP.NET Core 2.1.500 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://github.com/dotnet/core/blob/master/release-notes/2.1/2.1.6/2.1.6.md#notable-changes-in-216");
  script_xref(name:"URL", value:"https://github.com/dotnet/corefx/pull/32127");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows");
  script_dependencies("gb_asp_dotnet_core_detect_win.nasl");
  script_mandatory_keys(".NET/Core/SDK/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
coreVers = infos['version'];
path = infos['location'];

if(coreVers =~ "^(2\.1)" && version_is_less(version:coreVers, test_version:"2.1.500"))
{
  report = report_fixed_ver(installed_version:coreVers, fixed_version:"2.1.500", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);

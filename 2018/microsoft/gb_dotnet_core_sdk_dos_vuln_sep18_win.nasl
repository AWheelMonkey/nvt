###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dotnet_core_sdk_dos_vuln_sep18_win.nasl 12120 2018-10-26 11:13:20Z mmartin $
#
# ASP.NET Core SDK 'System.IO.Pipelines' Denial of Service Vulnerability Sep18 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.814209");
  script_version("$Revision: 12120 $");
  script_cve_id("CVE-2018-8409");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 13:13:20 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-09-14 11:39:31 +0530 (Fri, 14 Sep 2018)");
  script_name("ASP.NET Core SDK 'System.IO.Pipelines' Denial of Service Vulnerability Sep18 (Windows)");

  script_tag(name:"summary", value:"This host is installed with ASP.NET Core SDK
  and is prone to a denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error on how
  'System.IO.Pipelines' handles requests.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to cause a denial of service against an application that is leveraging
  System.IO.Pipelines.");

  script_tag(name:"affected", value:"ASP.NET Core SDK 2.1 prior to version 2.1.402");

  script_tag(name:"solution", value:"Upgrade to ASP.NET Core 2.1.402 or later. For
  updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://blogs.msdn.microsoft.com/dotnet/2018/09/11/net-core-september-2018-update/");
  script_xref(name:"URL", value:"https://github.com/dotnet/announcements/issues/83");

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

if(coreVers =~ "^(2\.1)" && version_is_less(version:coreVers, test_version:"2.1.402"))
{
  report = report_fixed_ver(installed_version:coreVers, fixed_version:"2.1.402", install_path:path);
  security_message(data:report);
  exit(0);
}
exit(99);

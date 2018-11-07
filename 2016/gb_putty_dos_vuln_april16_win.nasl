###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_putty_dos_vuln_april16_win.nasl 12149 2018-10-29 10:48:30Z asteins $
#
# PuTTY Denial Of Service Vulnerability April16 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:putty:putty";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807915");
  script_version("$Revision: 12149 $");
  script_cve_id("CVE-2016-2563");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 11:48:30 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-04-21 10:16:59 +0530 (Thu, 21 Apr 2016)");
  script_tag(name:"qod_type", value:"registry");
  script_name("PuTTY Denial Of Service Vulnerability April16 (Windows)");

  script_tag(name:"summary", value:"The host is installed with PuTTY and is
  prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to SCP command-line utility
  (pscp) is missing a bounds-check for a stack buffer when processing the
  SCP-SINK file-size response to a SCP download request.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  servers to conduct denial of service attack.");

  script_tag(name:"affected", value:"PuTTY version 0.59 through 0.66 on
  Windows.");

  script_tag(name:"solution", value:"Upgrade to PuTTY version 0.67 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://github.com/tintinweb/pub/tree/master/pocs/cve-2016-2563");
  script_xref(name:"URL", value:"http://www.chiark.greenend.org.uk/~sgtatham/putty/wishlist/vuln-pscp-sink-sscanf.html");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_dependencies("gb_putty_portable_detect.nasl");
  script_mandatory_keys("putty/version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!puttyVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:puttyVer, test_version:"0.59", test_version2:"0.66"))
{
  report = report_fixed_ver(installed_version:puttyVer, fixed_version:"0.67");
  security_message(data:report);
  exit(0);
}

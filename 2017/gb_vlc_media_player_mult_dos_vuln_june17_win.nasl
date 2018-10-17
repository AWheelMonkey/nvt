###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_mult_dos_vuln_june17_win.nasl 9780 2018-05-09 12:51:34Z cfischer $
#
# VLC Media Player Multiple Denial-of-Service Vulnerabilities (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:videolan:vlc_media_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811077");
  script_version("$Revision: 9780 $");
  script_cve_id("CVE-2017-9301","CVE-2017-9300");
  script_bugtraq_id(98747, 98746);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-05-09 14:51:34 +0200 (Wed, 09 May 2018) $");
  script_tag(name:"creation_date", value:"2017-06-05 14:19:32 +0530 (Mon, 05 Jun 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("VLC Media Player Multiple Denial-of-Service Vulnerabilities (Windows)");

  script_tag(name: "summary" , value:"The host is installed with VLC media player
  and is prone to multiple denial-of-service vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to an error in
  the 'plugins\codec\libflac_plugin.dll' and
  'plugins\audio_filter\libmpgatofixed32_plugin.dll' scripts while reading a
  crafted file.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to remote attackers to cause a denial of service (heap corruption and
  application crash or invalid read and application crash) or possibly have
  unspecified other impact.

  Impact Level: Application");

  script_tag(name: "affected" , value:"VideoLAN VLC media player version 2.2.4 on Windows");

  script_tag(name: "solution" , value:"Update to version 3.0 or above.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://code610.blogspot.in/2017/04/multiple-crashes-in-vlc-224.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!vlcVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(vlcVer == "2.2.4")
{
  report = report_fixed_ver(installed_version:vlcVer, fixed_version:"3.0");
  security_message(data:report);
  exit(0);
}

exit(99);
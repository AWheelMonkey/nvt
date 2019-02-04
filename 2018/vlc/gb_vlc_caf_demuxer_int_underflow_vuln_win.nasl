###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_caf_demuxer_int_underflow_vuln_win.nasl 12938 2019-01-04 07:18:11Z asteins $
#
# VLC Media Player CAF Demuxer Integer Underflow Vulnerability (Windows)
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.814375");
  script_version("$Revision: 12938 $");
  script_cve_id("CVE-2018-19857");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-04 08:18:11 +0100 (Fri, 04 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-17 10:49:31 +0530 (Mon, 17 Dec 2018)");
  ## Not detecting patch lavel
  script_tag(name:"qod", value:"50");
  script_name("VLC Media Player CAF Demuxer Integer Underflow Vulnerability (Windows)");

  script_tag(name:"summary", value:"The host is installed with VLC media player
  and is prone to integer underflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an improper handling
  of magic cookies in Core Audio Format (CAF) files, which could result in an
  uninitialized memory read in the CAF demuxer.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to execute arbitrary code in the context of affected application and failed
  exploit attempts will likely result in denial of service conditions.");

  script_tag(name:"affected", value:"VideoLAN VLC media player versions 3.0.4 on Windows");

  script_tag(name:"solution", value:"Apply patch from Reference link.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://dyntopia.com/advisories/013-vlc");
  script_xref(name:"URL", value:"https://www.videolan.org");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vlcVer = infos['version'];
vlcpath = infos['location'];

if(version_is_equal(version:vlcVer, test_version:"3.0.4"))
{
  report = report_fixed_ver(installed_version:vlcVer, fixed_version:"3.0.4", install_path: vlcpath);
  security_message(data:report);
  exit(0);
}
exit(99);

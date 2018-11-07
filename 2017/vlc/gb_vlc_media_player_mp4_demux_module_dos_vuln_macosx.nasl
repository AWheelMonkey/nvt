###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_mp4_demux_module_dos_vuln_macosx.nasl 11983 2018-10-19 10:04:45Z mmartin $
#
# VLC Media Player 'MP4 Demux Module' DoS Vulnerability (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.812503");
  script_version("$Revision: 11983 $");
  script_cve_id("CVE-2017-17670");
  script_bugtraq_id(102214);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:04:45 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-12-20 12:10:31 +0530 (Wed, 20 Dec 2017)");

  script_tag(name:"qod_type", value:"executable_version");

  script_name("VLC Media Player 'MP4 Demux Module' DoS Vulnerability (Mac OS X)");

  script_tag(name:"summary", value:"The host is installed with VLC media player
  and is prone to a denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to a type conversion error
  in 'modules/demux/mp4/libmp4.c' in the MP4 demux module leading to a invalid
  free, because the type of a box may be changed between a read operation and a
  free operation.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial-of-service condition. Given the nature of this
  issue, attackers may also be able to execute arbitrary code, but this has not
  been confirmed.");

  script_tag(name:"affected", value:"VideoLAN VLC media player 2.2.8 and prior
  on Mac OS X.");

  script_tag(name:"solution", value:"Update to version 3.0.1 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://openwall.com/lists/oss-security/2017/12/15/1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_vlc_media_player_detect_macosx.nasl");
  script_mandatory_keys("VLC/Media/Player/MacOSX/Version");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vlcVer = infos['version'];
path = infos['location'];

if (version_is_less_equal(version:vlcVer, test_version:"2.2.8")) {
  report = report_fixed_ver( installed_version:vlcVer, fixed_version:"3.0.1", install_path:path );
  security_message(data:report);
  exit(0);
}

exit(0);

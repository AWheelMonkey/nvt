###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_mult_vul03_jan15_win.nasl 11424 2018-09-17 08:03:52Z mmartin $
#
# VLC Media Player Multiple Vulnerabilities-03 Jan15 (Windows)
#
# Authors:
# Deependra Bapna<bdeependra@secpod.com>
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

CPE = "cpe:/a:videolan:vlc_media_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805316");
  script_version("$Revision: 11424 $");
  script_cve_id("CVE-2010-1445", "CVE-2010-1444", "CVE-2010-1443", "CVE-2010-1442",
                "CVE-2010-1441");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 10:03:52 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-01-02 12:58:41 +0530 (Fri, 02 Jan 2015)");
  script_name("VLC Media Player Multiple Vulnerabilities-03 Jan15 (Windows)");

  script_tag(name:"summary", value:"The host is installed with VLC media player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - Multiple errors in the A/52 audio decoder, DTS audio decoder, MPEG audio
  decoder, AVI demuxer, ASF demuxer and Matroska demuxer.

  - An error when processing XSPF playlists.

  - A use-after-free error when attempting to create a playlist of the contents
  of a malformed zip archive.

  - An error in the RTMP implementation.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  attackers to conduct a denial of service or potentially compromise a
  user's system.");

  script_tag(name:"affected", value:"VideoLAN VLC media player before version
  1.0.6 on Windows.");

  script_tag(name:"solution", value:"Upgrade to VideoLAN VLC media player
  version 1.0.6 or later. For updates refer http://www.videolan.org/");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/39558");
  script_xref(name:"URL", value:"http://www.videolan.org/security/sa1003.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!vlcVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:vlcVer, test_version:"1.0.6"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}

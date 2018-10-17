###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_mult_bof_vuln_win.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# VLC Media Player Real Demuxer File Handling Array Indexing Vulnerabilities (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow the attackers to crash an affected application
  or compromise a vulnerable system by convincing a user to open a malicious media
  file or to visit a specially crafted web page.
  Impact Level: Application.";
tag_affected = "VLC Media Player version 1.1.5 and prior.";

tag_insight = "This issue is caused by an array indexing error in the 'Close()' and
  'DemuxAudioMethod1()' [modules/demux/real.c] functions within the Real
   demuxer when processing a Real Media file with a zero 'i_subpackets' value.";
tag_solution = "Upgrade to VLC version 1.1.6 or apply patch from below link,
  For updates refer to http://www.videolan.org/vlc/";
tag_summary = "This host is installed with VLC media player and is prone to
  array indexing vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801565");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-08 10:30:18 +0100 (Sat, 08 Jan 2011)");
  script_cve_id("CVE-2010-3907");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("VLC Media Player Real Demuxer File Handling Array Indexing Vulnerabilities (Windows)");
  script_xref(name : "URL" , value : "http://www.videolan.org/security/sa1007.html");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/3345");
  script_xref(name : "URL" , value : "http://www.cs.brown.edu/people/drosenbe/research.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Installed");
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

# VLC Media Player Version 1.1.5 and prior.
if( version_is_less( version:vers, test_version:"1.1.6" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.1.6", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );
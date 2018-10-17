###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vlc_media_player_insecure_lib_load_vuln_win.nasl 10022 2018-05-30 09:20:48Z cfischer $
#
# VLC Media Player File Opening Insecure Library Loading Vulnerability (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801500");
  script_version("$Revision: 10022 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-30 11:20:48 +0200 (Wed, 30 May 2018) $");
  script_tag(name:"creation_date", value:"2010-09-03 15:47:26 +0200 (Fri, 03 Sep 2010)");
  script_cve_id("CVE-2010-3124");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("VLC Media Player File Opening Insecure Library Loading Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/41107");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/14750/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/2172");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2010/08/25/9");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2010/08/25/10");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_vlc_media_player_detect_win.nasl");
  script_mandatory_keys("VLCPlayer/Win/Installed");

  script_tag(name : "insight" , value : "The flaw is due to the application insecurely loading certain libraries
  from the current working directory, which could allow attackers to execute
  arbitrary code by tricking a user into opening a file from a network share.");
  script_tag(name : "solution" , value : "Upgrade to VLC version 1.1.4 or apply patch from below link,
  For updates refer to http://www.videolan.org/vlc/");
  script_tag(name : "summary" , value : "This host is installed with VLC media player and is prone to insecure
  library loading vulnerability.");
  script_tag(name : "impact" , value : "Successful exploitation will allow the attackers to execute arbitrary code and
  conduct DLL hijacking attacks.

  Impact Level: Application.");
  script_tag(name : "affected" , value : "VLC Media Player version 1.1.3 and prior.");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

# VLC Media Player Version 1.1.3 and prior.
if( version_is_less( version:vers, test_version:"1.1.4" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.1.4", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );
###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_win_media_player_int_overflow_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Integer Overflow vulnerability in Microsoft Windows Media Player
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary codes
  and cause application crash.
  Impact Level: Application";
tag_affected = "Microsoft, Windows Media Player version 9.x, 10.x, and 11.x";
tag_insight = "The issue is due to improper loading of WAV, SND or MID files on
  the affected application.";
tag_solution = "Upgrade to Windows server 2003 SP2, or later versions of
  windows, which fixes this issue.
  For updates refer to http://www.microsoft.com/";
tag_summary = "This host has Windows Media Player installed and is prone to
  Integer Overflow vulnerability";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800328");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-01-06 15:38:06 +0100 (Tue, 06 Jan 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2008-5745");
  script_bugtraq_id(33042);
  script_name("Integer Overflow vulnerability in Microsoft Windows Media Player");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2008/Dec/1021495.html");
  script_xref(name : "URL" , value : "http://downloads.securityfocus.com/vulnerabilities/exploits/33042.c");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_ms_win_media_player_detect_900173.nasl");
  script_mandatory_keys("Win/MediaPlayer/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

if( ! version = get_kb_item( "Win/MediaPlayer/Ver" ) ) exit( 0 );

#Grep for the versions 9.x , 10.x and 11.x
if( version =~ "^(9|1[01])\..*$" ) {
  security_message( port:0 );
  exit( 0 );
}

exit( 99 );
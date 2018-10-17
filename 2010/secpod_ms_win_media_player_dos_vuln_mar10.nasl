###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms_win_media_player_dos_vuln_mar10.nasl 11553 2018-09-22 14:22:01Z cfischer $
#
# Microsoft Windows Media Player '.AVI' File DOS Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900757");
  script_version("$Revision: 11553 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 16:22:01 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-03-30 16:15:33 +0200 (Tue, 30 Mar 2010)");
  script_cve_id("CVE-2010-1042");
  script_bugtraq_id(38790);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");

  script_name("Microsoft Windows Media Player '.AVI' File DOS Vulnerability");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/38790");
  script_xref(name:"URL", value:"http://www.security-database.com/detail.php?alert=CVE-2010-1042");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Denial of Service");
  script_dependencies("secpod_ms_win_media_player_detect_900173.nasl");
  script_mandatory_keys("Win/MediaPlayer/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to cause a denial
of service or possibly execute arbitrary code via a crafted message.");
  script_tag(name:"affected", value:"Microsoft Windows Media Player versions 11.x");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"This host is installed with windows media player and is prone to
Denial Of Service vulnerability.

Vulnerabilities Insight:
The flaw is due to error in '.avi' file, which fails to perform colorspace
conversion properly, and causes denial of service (memory corruption).");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

mediaVer = get_kb_item("Win/MediaPlayer/Ver");
if(mediaVer != NULL)
{
   if(version_in_range(version:mediaVer, test_version:"11", test_version2:"11.0.6000.6324")){
     security_message( port: 0, data: "The target host was found to be vulnerable" );
   }
}

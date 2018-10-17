###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_realplayer_mult_vuln_win_03_dec10.nasl 11553 2018-09-22 14:22:01Z cfischer $
#
# RealNetworks RealPlayer Multiple Vulnerabilities (Windows) - Dec10
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Updated By: Sooraj KS <kssooraj@secpod.com> on 2011-01-03
#   Added the related CVE and description.
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801674");
  script_version("$Revision: 11553 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 16:22:01 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-12-29 07:31:27 +0100 (Wed, 29 Dec 2010)");
  script_cve_id("CVE-2010-2997", "CVE-2010-2999", "CVE-2010-2998");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("RealNetworks RealPlayer Multiple Vulnerabilities (Windows) - Dec10");
  script_xref(name:"URL", value:"http://secunia.com/advisories/38550/");
  script_xref(name:"URL", value:"http://service.real.com/realplayer/security/12102010_player/en/");
  script_xref(name:"URL", value:"http://service.real.com/realplayer/security/10152010_player/en/");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_realplayer_detect_win.nasl");
  script_mandatory_keys("RealPlayer/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation allows remote attackers to execute arbitrary
  code or cause a denial of service.");
  script_tag(name:"affected", value:"RealPlayer SP 1.0 to 1.0.1 (12.x)
  RealNetworks RealPlayer SP 11.0 to 11.1 on Windows platform.");
  script_tag(name:"insight", value:"The multiple flaws are due to,

  - An use-after-free error allows remote attackers to execute arbitrary code
    or cause a denial of service via a crafted StreamTitle tag in an ICY
    SHOUTcast stream, related to the SMIL file format.

  - An integer overflow error allows remote attackers to execute arbitrary
    code or cause a denial of service via a malformed MLLT atom in an AAC file.

  - An array index error allows remote attackers to execute arbitrary code via
    malformed sample data in a RealMedia .IVR file.");
  script_tag(name:"solution", value:"Upgrade to RealPlayer 14.0.1.609 (Build 12.0.1.609) or later,
  For updates refer to http://www.real.com/player");
  script_tag(name:"summary", value:"This host is installed with RealPlayer which is prone to multiple
  vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

rpVer = get_kb_item("RealPlayer/Win/Ver");
if(isnull(rpVer)){
  exit(0);
}

## Realplayer version 11.x, 1.x(12.x)
if(version_in_range(version:rpVer, test_version:"11.0.0", test_version2:"11.0.0.674") ||
   version_in_range(version:rpVer, test_version:"12.0.0", test_version2:"12.0.0.301")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}

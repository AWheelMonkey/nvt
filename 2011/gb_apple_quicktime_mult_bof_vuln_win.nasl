###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_quicktime_mult_bof_vuln_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# Apple QuickTime Multiple Buffer Overflow Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802133");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-08-18 14:57:45 +0200 (Thu, 18 Aug 2011)");
  script_cve_id("CVE-2011-0245", "CVE-2011-0246", "CVE-2011-0247",
                "CVE-2011-0248", "CVE-2011-0249", "CVE-2011-0250",
                "CVE-2011-0251", "CVE-2011-0252", "CVE-2011-0256",
                "CVE-2011-0257", "CVE-2011-0258");
  script_bugtraq_id(49028, 49029, 49030, 49031, 49144, 49396);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Apple QuickTime Multiple Buffer Overflow Vulnerabilities (Windows)");
  script_xref(name:"URL", value:"http://support.apple.com/kb/HT4826");
  script_xref(name:"URL", value:"http://lists.apple.com/archives/security-announce/2011//Aug/msg00000.html");

  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Buffer overflow");
  script_dependencies("secpod_apple_quicktime_detection_win_900124.nasl");
  script_mandatory_keys("QuickTime/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow attackers to execute arbitrary code in
  the context of the currently logged-in user. Viewing a maliciously crafted
  movie file may lead to an unexpected application termination.");
  script_tag(name:"affected", value:"Apple QuickTime version prior to 7.7");
  script_tag(name:"insight", value:"The flaws are due to

  - a buffer overflow error, when handling pict files.

  - heap buffer overflow error, when handling 'GIF' images and 'STSC', 'STSS',
    'STSZ' and 'STTS' atoms in QuickTime movie files.

  - multiple stack buffer overflows existed in the handling of 'H.264' encoded
    movie files.

  - stack buffer overflow existed in the QuickTime ActiveX control's handling
    of 'QTL' files.

  - an integer overflow existed in the handling of track run atoms in
    QuickTime movie files.

  - improper bounds checking when handling 'mp4v' codec information.");
  script_tag(name:"solution", value:"Upgrade to Apple QuickTime version 7.7 or later
  For updates refer to http://www.apple.com/quicktime/download/");
  script_tag(name:"summary", value:"The host is running Apple QuickTime and is prone to multiple buffer
  overflow vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

quickVer = get_kb_item("QuickTime/Win/Ver");
if(!quickVer){
  exit(0);
}

if(version_is_less(version:quickVer, test_version:"7.7")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}

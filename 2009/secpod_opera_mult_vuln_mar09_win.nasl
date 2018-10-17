###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_opera_mult_vuln_mar09_win.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Opera Web Browser Multiple Vulnerabilities (Windows)
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900516");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-03-20 07:08:52 +0100 (Fri, 20 Mar 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0914", "CVE-2009-0915", "CVE-2009-0916");
  script_bugtraq_id(33961);
  script_name("Opera Web Browser Multiple Vulnerabilities (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/34135");
  script_xref(name:"URL", value:"http://www.opera.com/docs/changelogs/windows/964");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("General");
  script_dependencies("gb_opera_detect_portable_win.nasl");
  script_mandatory_keys("Opera/Win/Version");
  script_tag(name:"impact", value:"Successful remote attack could inject arbitrary HTML and script code, launch
  cross site scripting attacks on user's browser session when malicious data
  is being viewed.");
  script_tag(name:"affected", value:"Opera version prior to 9.64 on Windows.");
  script_tag(name:"insight", value:"- memory corruption error when processing a malformed JPEG image.

  - an error related to plug-ins.

  - error with unknown impact and attack vectors related to a
    'moderately severe issue'.");
  script_tag(name:"solution", value:"Upgrade to Opera 9.64.
  http://www.opera.com/download");
  script_tag(name:"summary", value:"The host is installed with Opera Web Browser and is prone to
  multiple vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

operaVer = get_kb_item("Opera/Win/Version");
if(!operaVer){
  exit(0);
}

if(version_is_less(version:operaVer, test_version:"9.64")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}

exit(99);

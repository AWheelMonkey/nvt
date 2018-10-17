###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_file_heap_bof_vuln_win.nasl 10137 2018-06-08 12:38:04Z asteins $
#
# Opera Web Browser Heap Based Buffer Overflow Vulnerability (Windows)
#
# Authors:
# Chandan S <schandan@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800066");
  script_version("$Revision: 10137 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 14:38:04 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2008-11-21 14:18:03 +0100 (Fri, 21 Nov 2008)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-5178");
  script_bugtraq_id(32323);
  script_name("Opera Web Browser Heap Based Buffer Overflow Vulnerability (Windows)");
  script_xref(name : "URL" , value : "http://milw0rm.com/exploits/7135");
  script_xref(name : "URL" , value : "http://www.frsirt.com/english/advisories/2008/3183");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_opera_detect_portable_win.nasl");
  script_mandatory_keys("Opera/Win/Version");
  script_tag(name : "impact" , value : "Successful remote attack could allow arbitrary code execution
  by tricking user into opening malicious HTML file.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Opera version 9.62 and prior on Windows.");
  script_tag(name : "insight" , value : "The flaw is due to an error while processing an overly long
  file:// URI.");
  script_tag(name : "solution" , value : "Upgrade to Opera 9.63
  http://www.opera.com/download/");
  script_tag(name : "summary" , value : "The host is installed with Opera Web Browser and is prone to
  buffer overflow vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

operaVer = get_kb_item("Opera/Win/Version");
if(!operaVer){
  exit(0);
}

if(version_is_less_equal(version:operaVer, test_version:"9.62")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}

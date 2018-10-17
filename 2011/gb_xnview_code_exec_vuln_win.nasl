###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xnview_code_exec_vuln_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# XnView File Search Path Executable File Injection Vulnerability (Windows)
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.802309");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-07-15 12:23:42 +0200 (Fri, 15 Jul 2011)");
  script_cve_id("CVE-2011-1338");
  script_bugtraq_id(48562);
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("XnView File Search Path Executable File Injection Vulnerability (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/45127");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/68369");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_xnview_detect_win.nasl");
  script_mandatory_keys("XnView/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code on the
  system with elevated privileges.");
  script_tag(name:"affected", value:"XnView versions prior to 1.98.1 on windows.");
  script_tag(name:"solution", value:"Update to XnView version 1.98.1 or later.
  For updates refer to http://www.xnview.com/");
  script_tag(name:"summary", value:"This host has XnView installed and is prone to executable file
  injection vulnerability.

  Vulnerabilities Insight:
  The flaw is caused by an untrusted search path vulnerability when loading
  executables.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

xnviewVer = get_kb_item("XnView/Win/Ver");

if(xnviewVer != NULL)
{
  if(version_is_less(version:xnviewVer, test_version:"1.98.1")){
   security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}

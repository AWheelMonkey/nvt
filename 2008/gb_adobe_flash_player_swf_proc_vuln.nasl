###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_swf_proc_vuln.nasl 9349 2018-04-06 07:02:25Z cfischer $
#
# Adobe Flash Player for Linux SWF Processing Vulnerability
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

tag_impact = "Successful attack could result in execution of arbitrary code on the remote
  affected system.
  Impact Level: System";
tag_affected = "Adobe Flash Player prior to 9.0.152.0/10.0.15.3 on Linux.";
tag_insight = "The issue is due to the way Flash Player handles the SWF files.";
tag_solution = "Upgrade to Adobe Flash Player 9.0.152.0 or 10.0.15.3,
  http://www.adobe.com/downloads";
tag_summary = "This host has Adobe Flash Player installed and is prone to
  Shockwave Flash (SWF) Processing vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800087");
  script_version("$Revision: 9349 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:02:25 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2008-12-19 13:40:09 +0100 (Fri, 19 Dec 2008)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-5499");
  script_name("Adobe Flash Player for Linux SWF Processing Vulnerability");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb08-24.html");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

adobeVer = get_kb_item("AdobeFlashPlayer/Linux/Ver");
if(!adobeVer){
  exit(0);
}
# Version match 9.0 to 9.0.151.0 and 10.0 to 10.0.12.36
if(version_in_range(version:adobeVer, test_version:"9.0",
                    test_version2:"9.0.151.0")){
  security_message(0);
}
else if(version_in_range(version:adobeVer, test_version:"10.0",
                         test_version2:"10.0.12.36")){
  security_message(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_cs3_swf_proc_bof_vuln.nasl 9349 2018-04-06 07:02:25Z cfischer $
#
# Adobe Flash CS3 SWF Processing Buffer Overflow Vulnerabilities
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

tag_impact = "Successful exploitation could allow remote attackers to cause heap based
  buffer overflows via specially crafted SWF files.
  Impact Level: Application";
tag_affected = "Adobe Flash CS3 Professional on Windows.";
tag_insight = "The issues are due to boundary errors while processing overly long SWF
  control parameters.";
tag_solution = "Upgrade to Adobe Flash CS4 Professional
  http://www.adobe.com/downloads/";
tag_summary = "This host is installed with Adobe Flash CS3 and is prone to buffer
  overflow vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800035");
  script_version("$Revision: 9349 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:02:25 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2008-10-21 16:25:40 +0200 (Tue, 21 Oct 2008)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-4473");
  script_bugtraq_id(31769);
  script_name("Adobe Flash CS3 SWF Processing Buffer Overflow Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/advisories/apsa08-09.html");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

uninstall = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
keys = registry_enum_keys(key:uninstall);
foreach key (keys)
{
  adobeName = registry_get_sz(key:uninstall + key, item:"DisplayName");
  if("Adobe Flash CS3 Professional" >< adobeName){
    security_message(0);
  }
}

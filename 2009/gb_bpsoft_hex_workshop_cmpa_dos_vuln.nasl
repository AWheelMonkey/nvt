###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bpsoft_hex_workshop_cmpa_dos_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# BreakPoint Software Hex Workshop Denial of Service vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary code and
  can cause Denial of Service to the application.
  Impact Level: Application";
tag_affected = "BreakPoint Software Hex Workshop version 5.1.4 and prior on Windows.";
tag_insight = "The flaw is due to improper boundary checks in Color Mapping or
  .cmap file via a long mapping reference.";
tag_solution = "Upgrade to BreakPoint Software Hex Workshop version 6.0.1 or later.
  For updates refer to http://www.bpsoft.com/downloads";
tag_summary = "This host has Hex Workshop installed and is prone to Denial of
  Service vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800327");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-01-06 15:38:06 +0100 (Tue, 06 Jan 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-5756");
  script_bugtraq_id(33023);
  script_name("BreakPoint Software Hex Workshop Denial of Service vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/Advisories/33327");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/7592");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_bpsoft_hex_workshop_detect.nasl");
  script_mandatory_keys("BPSoft/HexWorkshop/Ver");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);

  exit(0);
}

include("version_func.inc");

hwVer = get_kb_item("BPSoft/HexWorkshop/Ver");
if(!hwVer){
  exit(0);
}

# Check for version 5.1.4.4188 and prior
if(version_in_range(version:hwVer, test_version:"1.0",
                                   test_version2:"5.1.4.4188")){
  security_message(0);
}

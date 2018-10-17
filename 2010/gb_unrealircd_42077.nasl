###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_unrealircd_42077.nasl 8495 2018-01-23 07:57:49Z teissa $
#
# UnrealIRCd User Authentication Buffer Overflow Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

CPE = "cpe:/a:unrealircd:unrealircd";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100856");
 script_version("$Revision: 8495 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-23 08:57:49 +0100 (Tue, 23 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-10-15 13:28:27 +0200 (Fri, 15 Oct 2010)");
 script_bugtraq_id(42077);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-4893");

 script_name("UnrealIRCd User Authentication Buffer Overflow Vulnerability");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/42077");
 script_xref(name : "URL" , value : "http://www.unrealircd.com/txt/unrealsecadvisory.20090413.txt");
 script_xref(name : "URL" , value : "http://unrealircd.com/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Buffer overflow");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("gb_unrealircd_detect.nasl");
 script_mandatory_keys("UnrealIRCD/Detected");
 script_tag(name : "solution" , value : "Updates are available, please see
 the references for more information.");
 script_tag(name : "summary" , value : "UnrealIRCd is prone to a buffer-overflow
 vulnerability. Successful exploits will allow remote attackers to execute arbitrary
 code within the context of the affected application. Failed exploit
 attempts will result in a denial-of-service condition.");
 exit(0);
}


include("host_details.inc");
include("version_func.inc");

##Get port from CPE
if(!UnPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get Version from CPE
if(!UnVer = get_app_version(cpe:CPE, port:UnPort)){
  exit(0);
}

if(UnVer =~ "^3\.2")
{
  if(version_is_less(version: UnVer, test_version: "3.2.8.1"))
  {
    report = report_fixed_ver(installed_version:UnVer, fixed_version:"3.2.8.1");
    security_message(data:report, port:UnPort);
    exit(0);
  }
}

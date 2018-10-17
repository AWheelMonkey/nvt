###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_thunderbird_mult_vuln_nov08_win.nasl 10135 2018-06-08 11:42:28Z asteins $
#
# Mozilla Thunderbird Multiple Vulnerabilities November-08 (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.800059");
  script_version("$Revision: 10135 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:42:28 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2008-11-21 14:18:03 +0100 (Fri, 21 Nov 2008)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-5012", "CVE-2008-5014", "CVE-2008-5016", "CVE-2008-5017",
                "CVE-2008-5018", "CVE-2008-5021", "CVE-2008-5022", "CVE-2008-5024",
                "CVE-2008-5052");
  script_bugtraq_id(32281);
  script_name("Mozilla Thunderbird Multiple Vulnerabilities November-08 (Windows)");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-48.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-50.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-52.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-55.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-56.html");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2008/mfsa2008-58.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Thunderbird/Win/Ver");
  script_tag(name : "impact" , value : "Successful exploitation could result in remote arbitrary code execution,
  bypass security restrictions, spoofing attacks, sensitive information
  disclosure, and JavaScript code that can be executed with the privileges
  of the signed user.
  Impact Level: System");
  script_tag(name : "affected" , value : "Thunderbird version prior to 2.0.0.18 on Windows.");
  script_tag(name : "solution" , value : "Upgrade to Thunderbird version 2.0.0.18
  http://www.mozilla.com/en-US/thunderbird/all.html");
  script_tag(name : "summary" , value : "The host is installed with Mozilla Thunderbird and is prone to
  multiple vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

tbVer = get_kb_item("Thunderbird/Win/Ver");
if(!tbVer){
  exit(0);
}

if(version_is_less(version:tbVer, test_version:"2.0.0.18")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}

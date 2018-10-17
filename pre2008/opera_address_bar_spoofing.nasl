# OpenVAS Vulnerability Test
# $Id: opera_address_bar_spoofing.nasl 11556 2018-09-22 15:37:40Z cfischer $
# Description: Opera web browser address bar spoofing weakness
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
# Updated: 03/12/2009 Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

# Ref: Jakob Balle

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.14244");
  script_version("$Revision: 11556 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:37:40 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2004-2260");
  script_bugtraq_id(10337);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("Opera web browser address bar spoofing weakness");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("This script is Copyright (C) 2004 David Maciejak");
  script_family("Windows");
  script_dependencies("gb_opera_detect_portable_win.nasl");
  script_mandatory_keys("Opera/Win/Version");
  script_tag(name:"solution", value:"Install Opera 7.50 or newer.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"The remote host is using Opera - an alternative web browser.

  This version of Opera is vulnerable to a security weakness
  that may permit malicious web pages to spoof address bar information.

  This is reportedly possible through malicious use of the
  JavaScript 'unOnload' event handler when the browser
  is redirected to another page.

  This issue could be exploited to spoof the domain of a malicious web page,
  potentially causing the victim user to trust the spoofed domain.");
  exit(0);
}


include("version_func.inc");

OperaVer = get_kb_item("Opera/Win/Version");
if(!OperaVer){
  exit(0);
}

if(version_is_less_equal(version:OperaVer, test_version:"7.49")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}

exit(99);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_mozilla_prdts_dos_vuln_jun09_win.nasl 10135 2018-06-08 11:42:28Z asteins $
#
# Mozilla Products DoS Vulnerability June-09 (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.900389");
  script_version("$Revision: 10135 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-08 13:42:28 +0200 (Fri, 08 Jun 2018) $");
  script_tag(name:"creation_date", value:"2009-06-30 16:55:49 +0200 (Tue, 30 Jun 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-2210");
  script_bugtraq_id(35461);
  script_name("Mozilla Products DoS Vulnerability June-09 (Windows)");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/51315");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2009/mfsa2009-33.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_seamonkey_detect_win.nasl", "gb_thunderbird_detect_portable_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : "Successful exploitation will allow attacker to execute arbitrary code via
  e-mail messages, and results in Denial of Service condition.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Seamonkey version prior to 1.1.17 and
  Thunderbird version prior to 2.0.0.22 on Windows.");
  script_tag(name : "insight" , value : "The flaw exists when application fails to handle user input messages via
  a multipart or alternative e-mail message containing a text or enhanced part
  that triggers access to an incorrect object type.");
  script_tag(name : "solution" , value : "Upgrade to Seamonkey version 1.1.17
  http://www.seamonkey-project.org/releases
  Upgrade to Thunderbird version 2.0.0.22
  http://www.mozillamessaging.com/en-US/thunderbird/all.html");
  script_tag(name : "summary" , value : "The host is installed with Thunderbird/Seamonkey and is prone to
  Denial of Service vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Seamonkey Check
smVer = get_kb_item("Seamonkey/Win/Ver");
if(smVer != NULL)
{
  if(version_is_less(version:smVer, test_version:"1.1.17")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

# Thunderbird Check
tbVer = get_kb_item("Thunderbird/Win/Ver");
if(tbVer != NULL)
{
  if(version_is_less(version:tbVer, test_version:"2.0.0.22")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}

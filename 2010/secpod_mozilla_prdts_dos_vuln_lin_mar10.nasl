###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_mozilla_prdts_dos_vuln_lin_mar10.nasl 8510 2018-01-24 07:57:42Z teissa $
#
# Mozilla Products Denial Of Service Vulnerability (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow attackers to cause a denial of service
  or possibly execute arbitrary code via a crafted message, related to message
  indexing.
  Impact Level: Application";
tag_affected = "Seamonkey version prior to 1.1.19 and
  Thunderbird version prior to 2.0.0.24 on Linux.";
tag_insight = "The flaw exists when processing e-mail attachments with a parser that performs
  casts and line termination incorrectly, which allows remote attackers to crash
  the application.";
tag_solution = "Upgrade to Seamonkey version 1.1.19 or later
  http://www.seamonkey-project.org/releases
  Upgrade to Thunderbird version 2.0.0.24 or later
  http://www.mozillamessaging.com/en-US/thunderbird/all.html";
tag_summary = "The host is installed with Thunderbird/Seamonkey and is prone to
  Denial Of Service vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902143");
  script_version("$Revision: 8510 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-24 08:57:42 +0100 (Wed, 24 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-03-30 16:15:33 +0200 (Tue, 30 Mar 2010)");
  script_cve_id("CVE-2010-0163");
  script_bugtraq_id(38831);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Mozilla Products Denial Of Service Vulnerability (Linux)");


  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_seamonkey_detect_lin.nasl", "gb_thunderbird_detect_lin.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Linux/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/56993");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/0648");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-07.html");
  exit(0);
}


include("version_func.inc");

# Seamonkey Check
smVer = get_kb_item("Seamonkey/Linux/Ver");
if(smVer != NULL)
{
  # Grep for Seamonkey version prior to 1.1.19
  if(version_is_less(version:smVer, test_version:"1.1.19")){
    security_message(0);
     exit(0);
  }
}

# Thunderbird Check
tbVer = get_kb_item("Thunderbird/Linux/Ver");
if(tbVer != NULL)
{
  # Grep for Thunderbird version prior to 2.0.0.24
  if(version_is_less(version:tbVer, test_version:"2.0.0.24")){
    security_message(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_apple_safari_spoofing_vuln_win.nasl 8269 2018-01-02 07:28:22Z teissa $
#
# Apple Safari Address Bar Spoofing Vulnerability june-10 (Windows)
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

tag_impact = "Successful exploitation will let attackers to conduct spoofing
attacks via a crafted HTML document.

Impact Level: Application";

tag_affected = "Apple Safari version 5.0(5.33.16.0) and prior on Windows.";

tag_insight = "The flaw is due to an error in handling of address bar, which
does not properly manage the address bar between the request to open a URL and
the retrieval of the new document's content.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Apple Safari and is prone to spoofing
vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902215");
  script_version("$Revision: 8269 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-02 08:28:22 +0100 (Tue, 02 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-07-07 07:04:19 +0200 (Wed, 07 Jul 2010)");
  script_cve_id("CVE-2010-2454");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Apple Safari Address Bar Spoofing Vulnerability june-10 (Windows)");
  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=556957");
  script_xref(name : "URL" , value : "http://lcamtuf.blogspot.com/2010/06/yeah-about-that-address-bar-thing.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 SecPod");
  script_family("General");
  script_dependencies("secpod_apple_safari_detect_win_900003.nasl");
  script_mandatory_keys("AppleSafari/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("version_func.inc");

# Apple Safari Check
apVer = get_kb_item("AppleSafari/Version");
if(apVer)
{
  # Grep for Safari version <= 5.0(5.33.16.0)
  if(version_is_less_equal(version:apVer, test_version:"5.33.16.0")){
    security_message(0);
  }
}

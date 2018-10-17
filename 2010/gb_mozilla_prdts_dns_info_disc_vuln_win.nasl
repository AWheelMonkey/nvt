###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_dns_info_disc_vuln_win.nasl 9911 2018-05-18 13:49:23Z cfischer $
#
# Mozilla Products Information Disclosure Vulnerability (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800454");
  script_version("$Revision: 9911 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:49:23 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2010-02-04 12:53:38 +0100 (Thu, 04 Feb 2010)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2009-4630");
  script_name("Mozilla Products Information Disclosure Vulnerability (Windows)");

  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=453403");
  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=492196");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_seamonkey_detect_win.nasl", "gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : "Successful exploitation will let the attackers obtain the network location of
  the applications user by logging DNS requests.
  Impact Level: Application");
  script_tag(name : "affected" , value : "Mozilla Firefox and Seamonkey with Mozilla Necko version 1.9.0 and prior
  on Windows.");
  script_tag(name : "insight" , value : "The flaw exists when DNS prefetching of domain names contained in links within
  local HTML documents.");
  script_tag(name : "summary" , value : "The host is installed with Firefox/Seamonkey and is prone to
  Information Disclosure vulnerability.");
  script_tag(name : "solution" , value : "Apply the patch or Upgrade to  Mozilla Necko version 1.9.1,
  https://bug453403.bugzilla.mozilla.org/attachment.cgi?id=346274
  http://www.mozilla.com/en-US/products/

  *****
  NOTE: Ignore this warning, if above mentioned patch is already applied.
  *****");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

# Seamonkey Check
smVer = get_kb_item("Seamonkey/Win/Ver");
if(!isnull(smVer))
{

  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                            "\App Paths\seamonkey.exe", item:"path");
  if(!isnull(path))
  {
    path = path + "\seamonkey.exe";
    share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:path);
    file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",  string:path);

    seaVer = GetVer(file:file, share:share);
    if(!isnull(seaVer))
    {
      if(version_is_less(version:seaVer, test_version:"1.9.1"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}


fpVer = get_kb_item("Firefox/Win/Ver");
if(!isnull(fpVer))
{
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion" +
                             "\App Paths\firefox.exe", item:"path");
  if(!isnull(path))
  {
    path = path + "\firefox.exe";
    share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:path);
    file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1",  string:path);

    seaVer = GetVer(file:file, share:share);
    if(!isnull(seaVer))
    {
      if(version_is_less(version:seaVer, test_version:"1.9.1"))
      {
        security_message(0);
        exit(0);
      }
    }
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_advantech_studio_mult_bof_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Advantech Studio Multiple Buffer Overflow Vulnerabilities
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow remote attackers to execute
arbitrary code.

Impact Level: System/Application.";

tag_affected = "Advantech Advantech Studio 6.1 SP6 Build 61.6.0";

tag_insight = "The flaw exists due to a buffer overflow error in the ISSymbol
ActiveX control (ISSymbol.ocx) when processing an overly long 'InternationalOrder',
'InternationalSeparator', 'bstrFileName' or 'LogFileName' property, which
could be exploited by attackers to execute arbitrary code by tricking a user
into visiting a specially crafted web page.";

tag_solution = "Upgrade to hotfix 7.0.01.04 or higher,
For updates refer to http://support.advantech.com.tw/support/DownloadSearchByProduct.aspx?keyword=Advantech+Studio";

tag_summary = "This host is installed with Advantech Studio and is prone multiple
  to buffer overflow vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902370");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-05-26 10:47:46 +0200 (Thu, 26 May 2011)");
  script_cve_id("CVE-2011-0340");
  script_bugtraq_id(47596);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Advantech Studio Multiple Buffer Overflow Vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/42928");
  script_xref(name : "URL" , value : "http://secunia.com/secunia_research/2011-37/");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2011/1116");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Buffer overflow");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  exit(0);
}


include("smb_nt.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";

if(!registry_key_exists(key:key)) {
    exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  ## Check for InduSoft Thin Client DisplayName
  advName = registry_get_sz(key:key + item, item:"DisplayName");
  if("Advantech Studio" >< advName)
  {
    ## Get the installed location
    advPath = registry_get_sz(key:key + item, item:"InstallLocation");
    ocxPath = advPath + "\Redist\Wince 4.0\armv4t\ISSymbolCE.ocx";
    share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:ocxPath);
    file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:ocxPath);

    ocxVer = GetVer(file:file, share:share);
    if(!isnull(ocxVer))
    {
      if(version_is_equal(version:ocxVer, test_version:"301.1009.2904.0") ||
         version_is_equal(version:ocxVer, test_version:"61.6.0.0")){
        security_message(0);
      }
    }
  }
}

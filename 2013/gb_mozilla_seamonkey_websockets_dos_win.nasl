###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_seamonkey_websockets_dos_win.nasl 11887 2018-10-12 13:53:37Z cfischer $
#
# Mozilla Seamonkey 'WebSockets' Denial of Service Vulnerability (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_tag(name:"impact", value:"Successful exploitation will let attackers to cause a denial of service
  (memory corruption and application crash) or possibly execute arbitrary
  code via unspecified vectors.");
  script_tag(name:"affected", value:"SeaMonkey versions before 2.13.1 on Windows");
  script_tag(name:"insight", value:"Error in the WebSockets implementation, allows remote attackers to cause a
  denial of service.");
  script_tag(name:"solution", value:"Upgrade to SeaMonkey version to 2.13.1 or later.");
  script_xref(name:"URL", value:"http://www.mozilla.org/projects/seamonkey");
  script_tag(name:"summary", value:"The host is installed with Mozilla Seamonkey and is prone to multiple
  vulnerabilities.");
  script_oid("1.3.6.1.4.1.25623.1.0.803391");
  script_version("$Revision: 11887 $");
  script_cve_id("CVE-2012-4191");
  script_bugtraq_id(55889);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:53:37 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-10-15 17:43:07 +0530 (Mon, 15 Oct 2012)");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Mozilla Seamonkey 'WebSockets' Denial of Service Vulnerability (Windows)");

  script_xref(name:"URL", value:"http://secunia.com/advisories/50856");
  script_xref(name:"URL", value:"http://secunia.com/advisories/50935");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-88.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Seamonkey/Win/Ver");
  exit(0);
}


include("version_func.inc");

# SeaMonkey Check
seaVer = get_kb_item("Seamonkey/Win/Ver");
if(seaVer)
{
  if(version_is_less(version:seaVer, test_version:"2.13.1"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_sec_bypass_vuln_oct12_macosx.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Mozilla Thunderbird Security Bypass Vulnerabilities - Oct 12 (Mac OS X)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803672");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2012-4192", "CVE-2012-4193");
  script_bugtraq_id(55889);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-07-12 13:21:33 +0530 (Fri, 12 Jul 2013)");
  script_name("Mozilla Thunderbird Security Bypass Vulnerabilities - Oct 12 (Mac OS X)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/50856");
  script_xref(name:"URL", value:"http://secunia.com/advisories/50935");
  script_xref(name:"URL", value:"http://www.mozilla.org/security/announce/2012/mfsa2012-89.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("ThunderBird/MacOSX/Version");
  script_tag(name:"impact", value:"Successful exploitation will let attackers to bypass the Same Origin Policy
  and read the properties of a Location object via a crafted web site.");
  script_tag(name:"affected", value:"Thunderbird versions before 16.0.1 on Mac OS X");
  script_tag(name:"insight", value:"Security wrappers are unwrapped without doing a security check in
  defaultValue(). This can allow for improper access to the Location object.");
  script_tag(name:"solution", value:"Upgrade to Thunderbird version 16.0.1 or later.");
  script_tag(name:"summary", value:"The host is installed with Mozilla Thunderbird and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.mozilla.org/en-US/thunderbird");
  exit(0);
}


include("version_func.inc");

# Thunderbird Check
tbVer = get_kb_item("ThunderBird/MacOSX/Version");
if(tbVer)
{
  if(version_is_less(version:tbVer, test_version:"16.0.1"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

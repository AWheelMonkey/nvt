###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms14-061_macosx.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Microsoft Office Word Remote Code Execution Vulnerability-3000434 (Mac OS X)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804496");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-4117");
  script_bugtraq_id(70360);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-10-15 11:42:29 +0530 (Wed, 15 Oct 2014)");
  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Microsoft Office Word Remote Code Execution Vulnerability-3000434 (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing a important security
  update according to Microsoft Bulletin MS14-061.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an unspecified error when
  handling Microsoft Word files and can be exploited to execute arbitrary code
  via a specially crafted file.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute the arbitrary code, cause memory corruption and
  compromise the system.");

  script_tag(name:"affected", value:"Microsoft Office 2011 on Mac OS X");

  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"http://secunia.com/advisories/60973");
  script_xref(name:"URL", value:"https://technet.microsoft.com/library/security/MS14-061");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms14-061");
  exit(0);
}


include("version_func.inc");

offVer = get_kb_item("MS/Office/MacOSX/Ver");

if(!offVer || !(offVer =~ "^14")){
  exit(0);
}

if(version_in_range(version:offVer, test_version:"14.0", test_version2:"14.4.4"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}

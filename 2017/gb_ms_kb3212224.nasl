###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb3212224.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft Office Remote Code Execution Vulnerability - Mac OS X (KB3212224)
#
# Authors:
# Rinu <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811506");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-8501");
  script_bugtraq_id(99441);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-12 08:54:59 +0530 (Wed, 12 Jul 2017)");
  script_name("Microsoft Office Remote Code Execution Vulnerability - Mac OS X (KB3212224)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB3212224");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists when the Microsoft Office
  software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  an attacker to run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office for Mac 2011

  Microsoft Office 2016 for Mac");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3212224");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  exit(0);
}

include("version_func.inc");


if(!offVer = get_kb_item("MS/Office/MacOSX/Ver")){
  exit(0);
}

if(offVer =~ "^(14\.)" && version_in_range(version:offVer, test_version:"14.1.0", test_version2:"14.7.5"))
{
  report = 'File version:     ' + offVer   + '\n' +
           'Vulnerable range: 14.1.0 - 14.7.5' + '\n' ;
  security_message(data:report);
  exit(0);
}

else if(offVer =~ "^(15\.)" && version_is_less(version:offVer, test_version:"15.36.0"))
{
  report = 'File version:     ' + offVer   + '\n' +
           'Vulnerable range: 15.0 - 15.35.0' + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

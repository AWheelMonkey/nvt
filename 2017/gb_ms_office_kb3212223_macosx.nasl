###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_office_kb3212223_macosx.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Microsoft Office Multiple Remote Code Execution Vulnerabilities-KB3212223 (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.810911");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-8509", "CVE-2017-8511");
  script_bugtraq_id(98812, 98815);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-06-14 10:12:53 +0530 (Wed, 14 Jun 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Multiple Remote Code Execution Vulnerabilities-KB3212223 (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft security update KB3212223.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to multiple errors when
  the software fails to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user.");

  script_tag(name:"affected", value:"Microsoft Office 2011 on Mac OS X");

  script_tag(name:"solution", value:"Apply the patch");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/3212223");
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

if(offVer =~ "^(14\.)" && version_in_range(version:offVer, test_version:"14.1.0", test_version2:"14.7.4"))
{
  report = 'File version:     ' + offVer   + '\n' +
           'Vulnerable range: 14.1.0 - 14.7.4' + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);

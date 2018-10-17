###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_mailListIsPdf_bof_vuln_lin.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Adobe Reader 'mailListIsPdf' Buffer Overflow Vulnerability (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:adobe:acrobat_reader";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804383");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2004-1152");
  script_bugtraq_id(11923);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-04-10 15:00:46 +0530 (Thu, 10 Apr 2014)");
  script_name("Adobe Reader 'mailListIsPdf' Buffer Overflow Vulnerability (Linux)");


  script_tag(name:"summary", value:"This host is installed with Adobe Reader and is prone to buffer overflow
vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaw is due to a boundary error in the 'mailListIsPdf' function when checking
input files.");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary code and
compromise a user's system.");
  script_tag(name:"affected", value:"Adobe Reader version 5.0.9 on Linux.");
  script_tag(name:"solution", value:"Upgrade to Adobe Reader version 5.0.10 or later.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/13474");
  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/253024");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/18477");
  script_xref(name:"URL", value:"http://www.adobe.com/support/techdocs/331153.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_adobe_prdts_detect_lin.nasl");
  script_mandatory_keys("Adobe/Reader/Linux/Version");
  script_xref(name:"URL", value:"http://get.adobe.com/reader");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!readerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(readerVer && readerVer =~ "^5")
{
  if(version_is_equal(version:readerVer, test_version:"5.0.9"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

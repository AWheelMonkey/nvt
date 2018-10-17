###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_mult_unspecified_vuln01_jan14_lin.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# Oracle Java SE Multiple Unspecified Vulnerabilities-01 Jan 2014 (Linux)
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108427");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-5870", "CVE-2013-5893", "CVE-2013-5895", "CVE-2013-5904",
                "CVE-2014-0408", "CVE-2014-0382", "CVE-2014-0385");
  script_bugtraq_id(64929, 64863, 64906, 64890, 64910, 64936, 64901);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-01-22 10:48:04 +0530 (Wed, 22 Jan 2014)");
  script_name("Oracle Java SE Multiple Unspecified Vulnerabilities-01 Jan 2014 (Linux)");

  script_tag(name:"summary", value:"This host is installed with Oracle Java SE and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple unspecified vulnerabilities exists, For more details about the
vulnerabilities refer the reference section.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to affect confidentiality,
integrity and availability via unknown vectors.");
  script_tag(name:"affected", value:"Oracle Java SE 7 update 45 and prior on Linux");
  script_tag(name:"solution", value:"Apply the patch from the referenced advisory.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/56485");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64929");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64936");
  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujan2014-1972949.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_lin.nasl");
  script_mandatory_keys("Sun/Java/JRE/Linux/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!jreVer = get_app_version(cpe:CPE))
{
  CPE = "cpe:/a:sun:jre";
  if(!jreVer = get_app_version(cpe:CPE)){
    exit(0);
  }
}

if(jreVer =~ "^(1\.7)")
{
  if(version_in_range(version:jreVer, test_version:"1.7", test_version2:"1.7.0.45"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

exit(99);
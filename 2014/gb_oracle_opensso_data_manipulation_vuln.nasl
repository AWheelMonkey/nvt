###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_opensso_data_manipulation_vuln.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Oracle OpenSSO Administration Component Data Manipulation Vulnerability
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

CPE = "cpe:/a:oracle:opensso";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804437");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2012-0079");
  script_bugtraq_id(51492);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-04-22 14:57:24 +0530 (Tue, 22 Apr 2014)");
  script_name("Oracle OpenSSO Administration Component Data Manipulation Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("secpod_sun_opensso_detect.nasl");
  script_mandatory_keys("Oracle/OpenSSO/detected");

  script_tag(name:"summary", value:"This host is running Oracle OpenSSO and is prone to data manipulation
  vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an unspecified error in the Administration component.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to update, insert, or delete
  certain Oracle OpenSSO accessible data.");

  script_tag(name:"affected", value:"Oracle OpenSSO version 7.1 and 8.0");

  script_tag(name:"solution", value:"Apply the patch  *****
  NOTE: Ignore this warning, if above mentioned patch is manually applied.
  *****");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable"); # nb: The version check below is completely broken...

  script_xref(name:"URL", value:"http://www.oracle.com/technetwork/topics/security/cpujan2012-366304.html");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!ooPort = get_app_port(cpe:CPE)){
  exit(0);
}

ooVer = get_app_version(cpe:CPE, port:ooPort);
if(!ooVer){
  exit(0);
}

if(version_is_equal(version:ooVer, test_version:"8.0") ||
   version_is_equal(version:ooVer, test_version:"7.1"))
{
  security_message(port:ooPort);
  exit(0);
}

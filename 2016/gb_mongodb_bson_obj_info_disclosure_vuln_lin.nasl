###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mongodb_bson_obj_info_disclosure_vuln_lin.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# MongoDB BSON Object Information Disclosure Vulnerability (Linux)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:mongodb:mongodb";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808148");
  script_version("$Revision: 11516 $");
  script_cve_id("CVE-2012-6619");
  script_bugtraq_id(64687);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-06-07 10:46:58 +0530 (Tue, 07 Jun 2016)");
  script_name("MongoDB BSON Object Information Disclosure Vulnerability (Linux)");

  script_tag(name:"summary", value:"This host is running MongoDB and is
  prone to a denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version of MongoDB
  with the help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"An error exists in the application which
  fails to properly validate incorrect length of an BSON object.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  authenticated users to access sensitive information stored in the server process
  memory.");

  script_tag(name:"affected", value:"MongoDB version prior to 2.3.2 on Linux");

  script_tag(name:"solution", value:"Upgrade to MongoDB version 2.3.2 or later,
  For updates refer to http://www.mongodb.org");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://jira.mongodb.org/browse/SERVER-7769");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_family("Databases");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_mongodb_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/mongodb", 27017);
  script_mandatory_keys("mongodb/installed", "Host/runs_unixoide");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");


if(!mbPort = get_app_port(cpe:CPE))exit(0);

if(!ver = get_app_version(cpe:CPE, port:mbPort))exit(0);

if(version_is_less(version:ver, test_version:"2.3.2"))
{
  report = report_fixed_ver(installed_version:ver, fixed_version:"2.3.2");
  security_message(data:report, port:mbPort);
  exit(0);
}

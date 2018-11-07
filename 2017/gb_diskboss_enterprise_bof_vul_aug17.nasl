##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_diskboss_enterprise_bof_vul_aug17.nasl 11959 2018-10-18 10:33:40Z mmartin $
#
# DiskBoss Enterprise Server 8.3.12 Buffer Overflow Vulnerability (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
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

CPE = "cpe:/a:dboss:diskboss_enterprise";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107185");
  script_version("$Revision: 11959 $");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 12:33:40 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-10-06 16:11:25 +0530 (Fri, 06 Oct 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("DiskBoss Enterprise Server 8.3.12 Buffer Overflow Vulnerability (Windows)");

  script_tag(name:"summary", value:"The host is installed with DiskBoss Enterprise
  and is prone to a buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"The script checks if a vulnerable version is present on the target host.");

  script_tag(name:"impact", value:"Successful exploitation may allow remote
  attackers to elevate privileges from any account type and execute code.");

  script_tag(name:"affected", value:"DiskBoss Enterprise v8.3.12");

  script_tag(name:"solution", value:"Update to version 9.0 or above.");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://packetstormsecurity.com/files/143941/DiskBoss-Enterprise-8.3.12-Buffer-Overflow.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_diskboss_enterprise_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("Disk/Boss/Enterprise/installed", "Host/runs_windows");
  script_require_ports("Services/www", 8080);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

dbossVer = "";
dbossPort = "";
report = "";

if(!dbossPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!dbossVer = get_app_version(cpe:CPE, port:dbossPort)){
  exit(0);
}

if(version_in_range(version:dbossVer, test_version: "8.0.0", test_version2:"8.3.12"))
{
  report = report_fixed_ver(installed_version:dbossVer, fixed_version:"9.0");
  security_message(data:report, port:dbossPort);
  exit(0);
}

exit( 99 );

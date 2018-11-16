###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cybozu_dezie_buffer_overflow_vuln.nasl 12363 2018-11-15 09:51:15Z asteins $
#
# Cybozu Dezie Buffer Overflow Vulnerability Feb16
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:cybozu:dezie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807423");
  script_version("$Revision: 12363 $");
  script_cve_id("CVE-2014-5314");
  script_bugtraq_id(71057);
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-15 10:51:15 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-03-03 18:23:54 +0530 (Thu, 03 Mar 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Cybozu Dezie Buffer Overflow Vulnerability Feb16");

  script_tag(name:"summary", value:"The host is installed with Cybozu Dezie
  and is prone to buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified
  buffer overflow vulnerability.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause denial-of-service, or execute arbitrary code.");

  script_tag(name:"affected", value:"Cybozu Dezie version 8.1.0 and earlier.");
  script_tag(name:"solution", value:"Upgrade to Cybozu Dezie version 8.1.1
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://jvn.jp/en/jp/JVN14691234/index.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_cybozu_products_detect.nasl");
  script_mandatory_keys("CybozuDezie/Installed");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"http://products.cybozu.co.jp/");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!cybPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!cybVer = get_app_version(port:cybPort, cpe:CPE)){
  exit(0);
}

if (version_is_less(version:cybVer ,test_version:"8.1.1"))
{
  report = report_fixed_ver(installed_version:cybVer, fixed_version:"8.1.1");
  security_message(port:cybPort, data:report);
  exit(0);
}

exit(99);

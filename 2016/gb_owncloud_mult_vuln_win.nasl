###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_owncloud_mult_vuln_win.nasl 11961 2018-10-18 10:49:40Z asteins $
#
# ownCloud Multiple Vulnerabilities Mar16 (Windows)
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

CPE = "cpe:/a:owncloud:owncloud";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807445");
  script_version("$Revision: 11961 $");
  script_cve_id("CVE-2016-1500", "CVE-2016-1498");
  script_bugtraq_id(79911, 79907);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 12:49:40 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-03-04 19:49:30 +0530 (Fri, 04 Mar 2016)");
  script_name("ownCloud Multiple Vulnerabilities Mar16 (Windows)");

  script_tag(name:"summary", value:"The host is installed with ownCloud and
  is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The multiple flaw exists due to

  - an incorrect usage of the getOwner function of the ownCloud virtual
    filesystem.

  - an error in the OCS discovery provider");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attacker to inject arbitrary web script and able to access files.");

  script_tag(name:"affected", value:"ownCloud Server 8.2.x before 8.2.2, and
  8.1.x before 8.1.5, and 8.0.x before 8.0.10, and 7.0.x before 7.0.12
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to ownCloud Server 8.2.2 or 8.1.5
  or 8.0.10 or 7.0.12 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://owncloud.org/security/advisory/?id=oc-sa-2016-001");
  script_xref(name:"URL", value:"https://owncloud.org/security/advisory/?id=oc-sa-2016-003");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_owncloud_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("owncloud/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  script_xref(name:"URL", value:"http://owncloud.org");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!ownPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!ownVer = get_app_version(cpe:CPE, port:ownPort)){
  exit(0);
}

if(ownVer =~ "^(8|7)")
{
  if(version_in_range(version:ownVer, test_version:"8.2.0", test_version2:"8.2.1"))
  {
    fix = "8.2.2";
    VULN = TRUE;
  }

  else if(version_in_range(version:ownVer, test_version:"8.1.0", test_version2:"8.1.4"))
  {
    fix = "8.1.5";
    VULN = TRUE;
  }

  else if(version_in_range(version:ownVer, test_version:"8.0.0", test_version2:"8.0.9"))
  {
    fix = "8.0.10";
    VULN = TRUE;
  }

  else if(version_in_range(version:ownVer, test_version:"7.0.0", test_version2:"7.0.11"))
  {
    fix = "7.0.12";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:ownVer, fixed_version:fix);
    security_message(data:report, port:ownPort);
    exit(0);
  }
}

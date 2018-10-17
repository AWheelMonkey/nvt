##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_squid_mult_vuln_may16_lin.nasl 11725 2018-10-02 10:50:50Z asteins $
#
# Squid Multiple Vulnerabilities - May16 (Linux)
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

CPE = "cpe:/a:squid-cache:squid";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807963");
  script_version("$Revision: 11725 $");
  script_cve_id("CVE-2016-4051", "CVE-2016-4052", "CVE-2016-4053", "CVE-2016-4054");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-02 12:50:50 +0200 (Tue, 02 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-05-04 17:46:18 +0530 (Wed, 04 May 2016)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Squid Multiple Vulnerabilities - May16 (Linux)");

  script_tag(name:"summary", value:"This host is running Squid and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - A buffer overflow in the cachemgr.cgi tool.

  - Multiple on-stack buffer overflow from incorrect bounds calculation in
    Squid ESI processing.");

  script_tag(name:"impact", value:"Successful exploitation will allows remote
  attackers to cause a denial of service, execute arbitrary code, or obtain
  sensitive stack layout information.");

  script_tag(name:"affected", value:"Squid version 3.x before 3.5.17 and 4.x
  before 4.0.9 on Linux.");

  script_tag(name:"solution", value:"Upgrade to Squid version 3.5.17 or 4.0.9
  or later, For updates refer to http://www.squid-cache.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www.securitytracker.com/id/1035647");
  script_xref(name:"URL", value:"http://www.squid-cache.org/Advisories/SQUID-2016_6.txt");
  script_xref(name:"URL", value:"http://www.squid-cache.org/Advisories/SQUID-2016_5.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_squid_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("squid_proxy_server/installed", "Host/runs_unixoide");
  script_require_ports("Services/www", 3128, 8080);
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!squidPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!squidVer = get_app_version(cpe:CPE, port:squidPort)){
  exit(0);
}

if(squidVer =~ "^(3|4)")
{
  if(version_in_range(version:squidVer, test_version:"3.0.0", test_version2:"3.5.16"))
  {
    fix = "3.5.17";
    VULN = TRUE ;
  }

  else if(version_in_range(version:squidVer, test_version:"4.0.0", test_version2:"4.0.8"))
  {
    fix = "4.0.9";
    VULN = TRUE ;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:squidVer, fixed_version:fix);
    security_message(data:report, port:squidPort);
    exit(0);
  }
}

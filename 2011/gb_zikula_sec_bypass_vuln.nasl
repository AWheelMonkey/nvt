##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_zikula_sec_bypass_vuln.nasl 12152 2018-10-29 13:35:30Z asteins $
#
# Zikula Security bypass Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801744");
  script_version("$Revision: 12152 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-29 14:35:30 +0100 (Mon, 29 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-02-15 08:14:35 +0100 (Tue, 15 Feb 2011)");
  script_cve_id("CVE-2010-4728");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_name("Zikula Security Bypass Vulnerability");
  script_xref(name:"URL", value:"http://code.zikula.org/core/ticket/2009");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_zikula_detect.nasl");
  script_mandatory_keys("zikula/installed");
  script_require_ports("Services/www", 80);
  script_tag(name:"insight", value:"The flaw exists due to errors in 'rand' and 'srand' PHP functions for random
  number generation.");
  script_tag(name:"solution", value:"Upgrade to the Zikula version 1.3.1.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"This host is running Zikula and is prone to a security bypass
  vulnerability.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to defeat protection
  mechanisms based on randomization by predicting a return value.");
  script_tag(name:"affected", value:"Zikula version prior to 1.3.1.");
  script_xref(name:"URL", value:"http://zikula.org/");
  exit(0);
}

CPE = "cpe:/a:zikula:zikula_application_framework";

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe:CPE)) exit(0);
if(!vers = get_app_version(cpe:CPE, port:port)) exit(0);

if(version_is_less(version:vers, test_version:"1.3.1")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"1.3.1");
  security_message(port:port, data:report);
  exit(0);
}

exit(99);


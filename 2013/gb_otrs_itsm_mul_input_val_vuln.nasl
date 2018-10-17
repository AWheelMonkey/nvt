###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_otrs_itsm_mul_input_val_vuln.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# OTRS ITSM Multiple Input Validation Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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
OTRSCPE = "cpe:/a:otrs:otrs";
ITSMCPE = "cpe:/a:otrs:otrs_itsm";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803944");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-4717", "CVE-2013-4718");
  script_bugtraq_id(61036, 61037);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-27 16:44:31 +0530 (Fri, 27 Sep 2013)");
  script_name("OTRS ITSM Multiple Input Validation Vulnerability");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to gain access steal the
victim's cookie-based authentication credentials or execute SQL query.");
  script_tag(name:"vuldetect", value:"Get the installed version and location of OTRS with the help of detect NVT
and check the OTRS and OTRS:ITSM version is vulnerable or not.");
  script_tag(name:"insight", value:"An error exists in AgentITSMConfigItemSearch which does not sanitize
user-supplied input properly");
  script_tag(name:"solution", value:"Upgrade to OTRS (Open Ticket Request System) version 3.0.22, 3.1.18, 3.2.9
or later, and OTRS::ITSM version 3.0.9, 3.1.10, 3.2.7 or apply the patch from the referenced vendor advisory.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"This host is installed with OTRS (Open Ticket Request System) or OTRS:ITSM
and is prone to multiple input validation vulnerability.");
  script_tag(name:"affected", value:"OTRS (Open Ticket Request System) version 3.0.x up to and including 3.0.21,
3.1.x up to and including 3.1.17 and 3.2.x up to and including 3.2.8
OTRS::ITSM 3.0.x up to and including 3.0.8, 3.1.x up to and including 3.1.9
and 3.2.x up to and including 3.2.6");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/61036");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/61037");
  script_xref(name:"URL", value:"http://secunia.com/advisories/52623/");
  script_xref(name:"URL", value:"http://otrs.org/advisory/OSA-2013-05-en/");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("secpod_otrs_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("OTRS/installed");

  script_xref(name:"URL", value:"http://www.otrs.com/en/");
  exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:OTRSCPE)){
  exit(0);
}

if(vers = get_app_version(cpe:OTRSCPE, port:port))
{
  if(version_in_range(version:vers, test_version:"3.2.0", test_version2:"3.2.8") ||
     version_in_range(version:vers, test_version:"3.0.0", test_version2:"3.0.21") ||
     version_in_range(version:vers, test_version:"3.1.0", test_version2:"3.1.17"))
  {
      security_message(port:port);
      exit(0);
  }

}

if(itsmvers = get_app_version(cpe:ITSMCPE, port:port))
{
  if(version_in_range(version:itsmvers, test_version:"3.1.0", test_version2:"3.1.9") ||
     version_in_range(version:itsmvers, test_version:"3.0.0", test_version2:"3.0.8") ||
     version_in_range(version:itsmvers, test_version:"3.2.0", test_version2:"3.2.6"))
  {
    security_message(port:port);
    exit(0);
  }
}

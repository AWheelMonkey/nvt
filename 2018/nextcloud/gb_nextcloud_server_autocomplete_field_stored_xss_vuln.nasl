###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nextcloud_server_autocomplete_field_stored_xss_vuln.nasl 11897 2018-10-15 05:26:22Z cfischer $
#
# Nextcloud Server 'Autocomplete field' Stored XSS Vulnerability
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:nextcloud:nextcloud";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813916");
  script_version("$Revision: 11897 $");
  script_cve_id("CVE-2018-3780");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-15 07:26:22 +0200 (Mon, 15 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-20 17:29:50 +0530 (Mon, 20 Aug 2018)");
  script_name("Nextcloud Server 'Autocomplete field' Stored XSS Vulnerability");

  script_tag(name:"summary", value:"The host is installed with Nextcloud Server
  and is prone to stored XSS vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exist due to a missing sanitization
  of search results for an autocomplete field.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to craft a specially crafted request that would execute arbitrary script code
  in a user's browser session within the trust relationship between their browser
  and the server.

  Impact Level: Application");

  script_tag(name:"affected", value:"Nextcloud Server before 13.0.5");

  script_tag(name:"solution", value:"Upgrade to Nextcloud Server version 13.0.5
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"https://nextcloud.com/security/advisory/?id=NC-SA-2018-008");
  script_xref(name:"URL", value:"https://nextcloud.com");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_nextcloud_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("nextcloud/installed", "Host/runs_unixoide");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if (!nxport = get_app_port(cpe: CPE))
  exit(0);

infos = get_app_version_and_location(cpe:CPE, port:nxport, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"13.0.5"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"13.0.5", install_path:path);
  security_message(port:nxport, data:report);
  exit(0);
}

exit(99);


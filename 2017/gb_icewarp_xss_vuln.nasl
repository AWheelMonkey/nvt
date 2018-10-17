###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_icewarp_xss_vuln.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# IceWarp XSS Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:icewarp:mail_server";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140331");
  script_version("$Revision: 11863 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-29 10:02:16 +0700 (Tue, 29 Aug 2017)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2017-12844");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"NoneAvailable");

  script_name("IceWarp XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_icewarp_web_detect.nasl");
  script_mandatory_keys("icewarp/installed");

  script_tag(name:"summary", value:"IceWarp is prone to a cross-site scripting vulnerability");

  script_tag(name:"insight", value:"Cross-site scripting (XSS) vulnerability in the admin panel in IceWarp Mail
Server allows remote authenticated domain administrators to inject arbitrary web script or HTML via a crafted
user name.");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"affected", value:"IceWarp version 10.4.4 and maybe prior and later.");

  script_tag(name:"solution", value:"No known solution is available as of 18th May, 2018. Information regarding
this issue will be updated once solution details are available.");

  script_xref(name:"URL", value:"https://youtu.be/MI4dhEia1d4");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE, service: "www"))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "10.4.4")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "No information available");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

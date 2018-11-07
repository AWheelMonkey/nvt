##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_belkin_wemo_switch_auth_bypass_vuln.nasl 12043 2018-10-23 14:16:52Z mmartin $
#
# Belkin WeMo Switch Access Vulnerability
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

CPE = 'cpe:/a:belkin:wemo_home_automation_firmware';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140283");
  script_version("$Revision: 12043 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 16:16:52 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-08 13:57:04 +0700 (Tue, 08 Aug 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Belkin WeMo Switch Access Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_belkin_wemo_detect.nasl");
  script_mandatory_keys("belkin_wemo/detected", "belkin_wemo/model");

  script_tag(name:"summary", value:"It is possible for an unauthenticated remote attacker to switch the Belkin
WeMo Switch on and off.");

  script_tag(name:"vuldetect", value:"Check the firmware version.");

  script_tag(name:"insight", value:"An unauthenticated remote attacker may change the state (ON/OFF) of the WeMo
Switch by sending a crafted SOAP request to '/upnp/control/basicevent1'.");

  script_tag(name:"affected", value:"Belkin WeMo Switch firmware 2.00.10966 and prior.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

model = get_kb_item("belkin_wemo/model");
if (!model || model !~ "^Switch")
  exit(0);

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "2.00.10966")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "None");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_vcs_76326.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Cisco TelePresence Video Communication Server Expressway Information Disclosure Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:cisco:telepresence_video_communication_server_software";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105334");
  script_bugtraq_id(76326);
  script_cve_id("CVE-2015-4314");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_version("$Revision: 11872 $");

  script_name("Cisco TelePresence Video Communication Server Expressway Information Disclosure Vulnerability");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/76326");
  script_xref(name:"URL", value:"https://tools.cisco.com/bugsearch/bug/CSCuv40422");

  script_tag(name:"impact", value:"An attacker can exploit this issue to gain access to sensitive information that may aid in further attacks.");
  script_tag(name:"vuldetect", value:"Check the version");
  script_tag(name:"insight", value:"A vulnerability in the System Snapshot of the Cisco TelePresence Video Communication Server (VCS) Expressway could allow
an authenticated, remote attacker to view sensitive data. The vulnerability is due to insufficient protection of data at rest. An attacker could exploit this
vulnerability by downloading the snapshot file and viewing the password hashes contained. An exploit could allow the attacker to crack the password hashes and
use credentials to launch further attacks.

This issue is being tracked by Cisco BugId CSCuv40422. ");
  script_tag(name:"solution", value:"Update to version X8.7 or later.");
  script_tag(name:"summary", value:"Cisco TelePresence Video Communication Server Expressway is prone to an information-disclosure vulnerability.");
  script_tag(name:"affected", value:"Cisco TelePresence Video Communication Server Expressway X8.5.1");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-08-27 15:44:02 +0200 (Thu, 27 Aug 2015)");
  script_category(ACT_GATHER_INFO);
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_vcs_detect.nasl", "gb_cisco_vcs_ssh_detect.nasl");
  script_mandatory_keys("cisco_vcs/installed");

  exit(0);
}

include("host_details.inc");

if( ! version = get_app_version( cpe:CPE, nofork:TRUE ) ) exit( 0 );

if( version =~ "^8\.5\.1($|[^0-9])" )
{
  report = 'Installed version: ' + version + '\n' +
           'Fixed version:     Ask the vendor\n';
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


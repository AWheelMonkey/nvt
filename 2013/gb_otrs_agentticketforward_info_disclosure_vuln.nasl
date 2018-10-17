###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_otrs_agentticketforward_info_disclosure_vuln.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# OTRS AgentTicketForward Information Disclosure Vulnerability
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
CPE = "cpe:/a:otrs:otrs";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803929");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2010-4766");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-09-22 12:18:31 +0530 (Sun, 22 Sep 2013)");
  script_name("OTRS AgentTicketForward Information Disclosure Vulnerability");


  script_tag(name:"impact", value:"Successful exploitation will allow remote users to obtain potentially sensitive
image information by reading a forwarded message from an e-mail client.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"An error exists in AgentTicketForward feature which fails to remove inline
images from HTML e-mail messages");
  script_tag(name:"solution", value:"Upgrade to OTRS (Open Ticket Request System) version 2.4.7 or later.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"This host is installed with OTRS (Open Ticket Request System) and is prone to
information disclosure vulnerability.");
  script_tag(name:"affected", value:"OTRS (Open Ticket Request System) version before 2.4.7");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("secpod_otrs_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("OTRS/installed");
  script_xref(name:"URL", value:"http://www.otrs.com/en/");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE)){
  exit(0);
}

if(vers = get_app_version(cpe:CPE, port:port))
{
  if(version_is_less(version: vers, test_version: "2.4.7"))
  {
      security_message(port:port);
      exit(0);
  }

}

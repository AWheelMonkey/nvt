# OpenVAS Vulnerability Test
# $Id: bugzilla_remote_exec.nasl 8527 2018-01-25 07:33:25Z ckuersteiner $
# Description: Bugzilla remote arbitrary command execution
#
# Authors:
# David Maciejak <david dot maciejak at kyxar dot fr>
# based on work from (C) Tenable Network Security
#
# Copyright:
# Copyright (C) 2004 David Maciejak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

CPE = "cpe:/a:mozilla:bugzilla";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.15565");
 script_version("$Revision: 8527 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:33:25 +0100 (Thu, 25 Jan 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(1199);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2000-0421", "CVE-2001-0329");
 
 script_name("Bugzilla remote arbitrary command execution");
 
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 
 script_copyright("This script is Copyright (C) 2004 David Maciejak");
 script_family("Web application abuses");
 script_dependencies("bugzilla_detect.nasl");
 script_mandatory_keys("bugzilla/installed");

 script_tag(name: "solution", value: "Upgrade at version 2.12 or newer.");

 script_tag(name: "summary", value: "The remote Bugzilla bug tracking system, according to its version number, is
vulnerable to arbitrary commands execution flaws due to a lack of sanitization of user-supplied data in
process_bug.cgi");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!vers = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: vers, test_version: "2.12")) {
  report = report_fixed_ver(installed_version: vers, fixed_version: "2.12");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

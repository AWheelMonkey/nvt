###############################################################################
# OpenVAS Vulnerability Test
# $Id: boastMachine_37940.nasl 8527 2018-01-25 07:33:25Z ckuersteiner $
#
# boastMachine Arbitrary File Upload Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

CPE = "cpe:/a:kailash_nadh:boastmachine";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100461");
 script_version("$Revision: 8527 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:33:25 +0100 (Thu, 25 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-01-25 18:49:48 +0100 (Mon, 25 Jan 2010)");
 script_bugtraq_id(37940);
 script_tag(name:"cvss_base", value:"6.8");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");

 script_name("boastMachine Arbitrary File Upload Vulnerability");

 script_xref(name: "URL", value: "http://www.securityfocus.com/bid/37940");
 script_xref(name: "URL", value: "http://boastology.com/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("boastMachine_detect.nasl");
 script_mandatory_keys("boastmachine/installed");

 script_tag(name: "summary", value: "boastMachine is prone to a vulnerability that lets attackers upload arbitrary
files because the application fails to adequately sanitize user-supplied input.

An attacker can exploit this vulnerability to upload arbitrary code and run it in the context of the webserver
process. This may facilitate unauthorized access or privilege escalation; other attacks are also possible.

boastMachine 3.1 is affected; other versions may be vulnerable as well.");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "3.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "None");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

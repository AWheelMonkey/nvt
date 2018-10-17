###############################################################################
# OpenVAS Vulnerability Test
# $Id: bugzilla_35916.nasl 8527 2018-01-25 07:33:25Z ckuersteiner $
#
# Bugzilla 'show_bug.cgi' Information Disclosure Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

CPE = "cpe:/a:mozilla:bugzilla";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100263");
 script_version("$Revision: 8527 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-25 08:33:25 +0100 (Thu, 25 Jan 2018) $");
 script_tag(name:"creation_date", value:"2009-08-28 10:47:21 +0200 (Fri, 28 Aug 2009)");
 script_bugtraq_id(35916);
 script_tag(name:"cvss_base", value:"4.4");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");

 script_name("Bugzilla 'show_bug.cgi' Information Disclosure Vulnerability");

 script_xref(name: "URL", value: "http://www.securityfocus.com/bid/35916");
 script_xref(name: "URL", value: "http://www.bugzilla.org");
 script_xref(name: "URL", value: "http://www.bugzilla.org/security/3.4/");

 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("bugzilla_detect.nasl");
 script_mandatory_keys("bugzilla/installed");

 script_tag(name: "solution", value: "Updates are available. Please see the references for details.");

 script_tag(name: "summary", value: "Bugzilla is prone to an information-disclosure vulnerability.

Successful exploits will allow authenticated attackers to obtain potentially sensitive information that may aid in
further attacks.

The following are vulnerable:

Bugzilla 3.3.4, 3.4rc1, and 3.4.");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!Ver = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version:Ver, test_version:"3.3", test_version2:"3.3.4") ||
    version_in_range(version:Ver, test_version:"3.4", test_version2:"3.4.0")) {
  security_message(port:port);
  exit(0);
}

exit(0);

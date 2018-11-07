###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dokeos_46173.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# Dokeos Multiple Remote File Disclosure Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

CPE = 'cpe:/a:dokeos:dokeos';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103069");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-02-08 13:20:01 +0100 (Tue, 08 Feb 2011)");
  script_bugtraq_id(46173);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Dokeos Multiple Remote File Disclosure Vulnerabilities");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/46173");
  script_xref(name:"URL", value:"http://www.chamilo.org");
  script_xref(name:"URL", value:"http://code.google.com/p/chamilo/");
  script_xref(name:"URL", value:"http://www.dokeos.com/");

  script_tag(name:"qod_type", value:"remote_banner");

  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("dokeos_detect.nasl");
  script_mandatory_keys("dokeos/installed");

  script_tag(name:"summary", value:"Dokeos and Chamilo are prone to multiple file-disclosure vulnerabilities
because they fail to properly sanitize user-supplied input.

An attacker can exploit these vulnerabilities to view local files in the context of the webserver process. This
may aid in further attacks.

Dokeos versions 1.8.6.1 through 2.0 and Chamilo 1.8.7.1 are vulnerable, other versions may also be affected.");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "1.8.6.1",  test_version2: "2.0")) {
  security_message(port:port);
  exit(0);
}

exit(99);

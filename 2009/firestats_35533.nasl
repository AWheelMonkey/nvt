###############################################################################
# OpenVAS Vulnerability Test
# $Id: firestats_35533.nasl 9721 2018-05-04 06:43:25Z ckuersteiner $
#
# FireStats Unspecified SQL Injection Vulnerability
#
# Authors
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

CPE = "cpe:/a:firestats:firestat";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100230");
 script_version("$Revision: 9721 $");
 script_tag(name:"last_modification", value:"$Date: 2018-05-04 08:43:25 +0200 (Fri, 04 May 2018) $");
 script_tag(name:"creation_date", value:"2009-07-08 19:01:22 +0200 (Wed, 08 Jul 2009)");
 script_bugtraq_id(35533);
 script_cve_id("CVE-2009-2144");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_tag(name: "solution_type", value: "VendorFix");

 script_name("FireStats Unspecified SQL Injection Vulnerability");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("firestats_detect.nasl");
 script_mandatory_keys("firestats/installed");

 script_tag(name: "solution", value: "The vendor has released an update. See http://firestats.cc/ for more
information.");

 script_tag(name: "summary", value: "FireStats is prone to an SQL-injection vulnerability because it fails to
sufficiently sanitize user-supplied data before using it in an SQL query.

Exploiting this issue could allow an attacker to compromise the application, access or modify data, or exploit
latent vulnerabilities in the underlying database.

Versions prior to FireStats 1.6.2 are vulnerable.");

 script_xref(name: "URL", value: "http://www.securityfocus.com/bid/35533");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "1.6.2")) {
  security_message(port: port);
  exit(0);
}

exit(99);

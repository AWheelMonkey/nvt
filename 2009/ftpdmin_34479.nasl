###############################################################################
# OpenVAS Vulnerability Test
# $Id: ftpdmin_34479.nasl 9927 2018-05-23 04:13:59Z ckuersteiner $
#
# FTPDMIN 'RNFR' Command Buffer Overflow Vulnerability
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

CPE = 'cpe:/a:ftpdmin:ftpdmin';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100132");
 script_version("$Revision: 9927 $");
 script_tag(name:"last_modification", value:"$Date: 2018-05-23 06:13:59 +0200 (Wed, 23 May 2018) $");
 script_tag(name:"creation_date", value:"2009-04-13 18:06:40 +0200 (Mon, 13 Apr 2009)");
 script_bugtraq_id(34479);
 script_tag(name:"cvss_base", value:"9.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");

 script_name("FTPDMIN 'RNFR' Command Buffer Overflow Vulnerability");

 script_tag(name: "solution_type", value: "WillNotFix");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("FTP");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("ftpdmin_detect.nasl");
 script_mandatory_keys("ftpdmin/installed");
 script_require_ports("Services/ftp", 21);

 script_tag(name: "summary", value: "According to its version number, the remote version of Ftpdmin is prone to a
buffer-overflow vulnerability.

A successful exploit may allow attackers to execute arbitrary code in the context of the vulnerable service.
Failed exploit attempts will likely cause denial-of-service conditions.");

 script_tag(name: "solution", value: "No known solution was made available for at least one year since the
disclosure of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to
a newer release, disable respective features, remove the product or replace the product by another one.");

 script_xref(name: "URL", value: "http://www.securityfocus.com/bid/34479");

 exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_equal(version: version, test_version: "0.96")) {
  security_message(port: port);
  exit(0);
}

exit(99);

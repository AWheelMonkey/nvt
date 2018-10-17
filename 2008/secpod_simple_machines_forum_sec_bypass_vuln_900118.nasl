##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_simple_machines_forum_sec_bypass_vuln_900118.nasl 4557 2016-11-17 15:51:20Z teissa $
# Description: Simple Machines Forum Password Reset Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
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
##############################################################################

CPE = 'cpe:/a:simplemachines:smf';

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.900118");
 script_version("$Revision: 4557 $");
 script_tag(name:"last_modification", value:"$Date: 2016-11-17 16:51:20 +0100 (Thu, 17 Nov 2016) $");
 script_tag(name:"creation_date", value:"2008-09-25 09:10:39 +0200 (Thu, 25 Sep 2008)");
 script_cve_id("CVE-2008-6971");
 script_bugtraq_id(31053);
 script_copyright("Copyright (C) 2008 SecPod");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_name("Simple Machines Forum Password Reset Vulnerability");

 script_dependencies("gb_simple_machines_forum_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("SMF/installed");

 script_tag(name : "summary" , value : "The host has Simple Machines Forum, which is prone to security
 bypass vulnerability.");
 script_tag(name : "insight" , value : "The vulnerability exists due to the application generating
 weak validation codes for the password reset functionality which allows for easy validation code
 guessing attack.");
 script_tag(name : "affected" , value : "Simple Machines Forum versions prior to 1.1.6 on");
 script_tag(name : "solution" , value : "Update to version 1.1.6
 http://download.simplemachines.org/");
 script_tag(name : "impact" , value : "Attackers can guess the validation code and reset the user
        password to the one of their choice.

 Impact Level : Application");

 script_xref(name : "URL" , value : "http://milw0rm.com/exploits/6392");
 script_xref(name : "URL" , value : "http://secunia.com/advisories/31750/");
 script_xref(name : "URL" , value : "http://www.simplemachines.org/community/index.php?topic=260145.0");

 script_tag(name:"solution_type", value:"VendorFix");
 script_tag(name:"qod_type", value:"remote_banner");
 exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version: vers, test_version: "1.1.6" ) ) {
    security_message( port:port );
    exit( 0 );
}

exit( 99 );

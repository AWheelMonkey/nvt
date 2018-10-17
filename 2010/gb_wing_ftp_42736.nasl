###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wing_ftp_42736.nasl 7552 2017-10-24 13:00:36Z cfischer $
#
# Wing FTP Server HTTP Request Denial Of Service Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100777");
  script_version("$Revision: 7552 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 15:00:36 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2010-09-02 16:10:00 +0200 (Thu, 02 Sep 2010)");
  script_bugtraq_id(42736);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Wing FTP Server HTTP Request Denial Of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "os_detection.nasl", "ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);
  script_mandatory_keys("Host/runs_windows");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/42736");
  script_xref(name:"URL", value:"http://www.wftpserver.com/");
  script_xref(name:"URL", value:"http://www.wftpserver.com/serverhistory.htm");

  script_tag(name:"summary", value:"Wing FTP Server is prone to a denial-of-service vulnerability.");
  script_tag(name:"impact", value:"An attacker can exploit this issue to cause the server to crash,
  resulting in a denial-of-service condition. Other attacks may also be possible.");
  script_tag(name:"affected", value:"Versions prior to Wing FTP Server 3.6.6 may be affected.

  This issue is reported to be exploitable in the Windows environment only.");
  script_tag(name:"solution", value:"Updates are available. Please see the references for more details.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("ftp_func.inc");
include("version_func.inc");
include("host_details.inc");

port = get_ftp_port( default:21 );
if( ! banner = get_ftp_banner( port:port ) ) exit( 0 );

if( "220 Wing FTP Server" >!< banner ) exit( 0 );

version = eregmatch( pattern:"Wing FTP Server ([^ ]+) ready", string:banner );

if( ! isnull( version[1] ) ) {
  if( version_is_less( version:version[1], test_version:"3.6.6" ) ) {
    report = report_fixed_ver( installed_version:version[1], fixed_version:"3.6.6" );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );

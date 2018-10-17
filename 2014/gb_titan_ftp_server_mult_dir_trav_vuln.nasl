###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_titan_ftp_server_mult_dir_trav_vuln.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Titan FTP Server Multiple Directory Traversal Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:southrivertech:titan_ftp_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804400");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-1841", "CVE-2014-1842", "CVE-2014-1843");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-02-11 16:31:02 +0530 (Tue, 11 Feb 2014)");
  script_name("Titan FTP Server Multiple Directory Traversal Vulnerabilities");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("FTP");
  script_dependencies("gb_titan_ftp_detect.nasl");
  script_mandatory_keys("TitanFTP/installed");
  script_require_ports("Services/ftp", 21);

  script_tag(name:"summary", value:"This host is running Titan FTP Server and is prone to multiple directory
  traversal vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"- It is possible to copy the complete home folder of another user by
   leveraging a vulnerability on the Titan FTP Server Web Interface.

  - It is possible to obtain the complete list of existing users by
   writing '/../' on the search bar.

  - It is possible to observe the 'Properties' for an existing user home
   folder. This also allows for enumeration of existing users on the system.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to read arbitrary files
  and information on the target system.");
  script_tag(name:"affected", value:"Titan FTP Server version 10.32 Build 1816");
  script_tag(name:"solution", value:"Upgrade to Titan FTP Server 10.40 Build 1829 or later.");

  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/125150");
  script_xref(name:"URL", value:"http://seclists.org/fulldisclosure/2014/Feb/92");
  script_xref(name:"URL", value:"http://exploitsdownload.com/exploit/na/titan-ftp-server-1032-build-1816-directory-traversals");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://webdrive.com/products/titan-ftp-server");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! tftpPort = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! tftpVers = get_app_version( cpe:CPE, port:tftpPort ) ) exit( 0 );

if( version_is_less_equal( version:tftpVers, test_version:"10.32.1816" ) ) {
    report = report_fixed_ver( installed_version: tftpVers, fixed_version:"10.40.1829" );
    security_message( port:tftpPort, data:report );
    exit( 0 );
}

exit( 99 );
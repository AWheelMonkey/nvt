###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_samba_49939.nasl 10398 2018-07-04 12:11:48Z cfischer $
#
# Samba 'etc/mtab' File Appending Local Denial of Service Vulnerability
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

CPE = "cpe:/a:samba:samba";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103298");
  script_version("$Revision: 10398 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-04 14:11:48 +0200 (Wed, 04 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-10-13 13:40:58 +0200 (Thu, 13 Oct 2011)");
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:N");
  script_bugtraq_id(49939);
  script_cve_id("CVE-2011-1678");
  script_name("Samba 'etc/mtab' File Appending Local Denial of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("smb_nativelanman.nasl", "gb_samba_detect.nasl");
  script_mandatory_keys("samba/smb_or_ssh/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/49939");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-1678");
  script_xref(name:"URL", value:"http://us1.samba.org/samba/");

  script_tag(name:"summary", value:"Samba is prone to a local denial-of-service vulnerability.");

  script_tag(name:"impact", value:"A local attacker can exploit this issue to cause the computer to stop
  responding, denying service to legitimate users.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! infos = get_app_version_and_location( cpe:CPE, port:port, exit_no_version:TRUE ) ) exit( 0 );
vers = infos['version'];
loc = infos['location'];

if( version_is_less_equal( version:vers, test_version:"3.5.8" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.5.9", install_path:loc );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );

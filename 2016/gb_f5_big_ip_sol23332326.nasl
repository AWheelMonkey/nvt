###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol23332326.nasl 12431 2018-11-20 09:21:00Z asteins $
#
# F5 BIG-IP - SOL23332326 - Apache HTTPD vulnerability CVE-2010-2791
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/h:f5:big-ip";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.105498");
  script_cve_id("CVE-2010-2791", "CVE-2010-2068");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_version("$Revision: 12431 $");

  script_name("F5 BIG-IP - SOL23332326 - Apache HTTPD vulnerability");

  script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/k/23/sol23332326.html");

  script_tag(name:"impact", value:"This vulnerability can allow the unauthorized disclosure of information.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"mod_proxy in httpd in Apache HTTP Server 2.2.9, when running on Unix, does not close the backend connection if a timeout occurs when reading a response from a persistent connection, which allows remote attackers to obtain a potentially sensitive response intended for a different client in opportunistic circumstances via a normal HTTP request. NOTE: this is the same issue as CVE-2010-2068, but for a different OS and set of affected versions.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"The remote host is missing a security patch.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-11-20 10:21:00 +0100 (Tue, 20 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-01-05 14:51:42 +0100 (Tue, 05 Jan 2016)");
  script_category(ACT_GATHER_INFO);
  script_family("F5 Local Security Checks");
  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_f5_big_ip_version.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("f5/big_ip/version", "f5/big_ip/active_modules");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");
include("misc_func.inc");
include("f5.inc");

if( ! version = get_app_version( cpe:CPE ) ) exit( 0 );

check_f5['LTM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '12.0.0;11.0.0-11.6.0;');

check_f5['APM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '12.0.0;11.0.0-11.6.0;');

check_f5['ASM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '12.0.0;11.0.0-11.6.0;');

check_f5['GTM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '11.0.0-11.6.0;');

check_f5['LC'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '12.0.0;11.0.0-11.6.0;');

check_f5['PSM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '11.0.0-11.4.1;');

check_f5['WAM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '11.0.0-11.3.0;');

check_f5['WOM'] = make_array( 'affected',   '10.1.0-10.2.4;',
                              'unaffected', '11.0.0-11.3.0;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


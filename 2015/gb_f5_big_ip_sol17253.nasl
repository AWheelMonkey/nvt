###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol17253.nasl 11274 2018-09-07 06:20:26Z ckuersteiner $
#
# F5 BIG-IP - SOL17253 - BIG-IP Configuration utility vulnerability CVE-2015-4040
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.105362");
  script_cve_id("CVE-2015-4040");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_version("$Revision: 11274 $");

  script_name("F5 BIG-IP - SOL17253 - BIG-IP Configuration utility vulnerability CVE-2015-4040");

  script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/17000/200/sol17253.html?sr=48315211");

  script_tag(name:"impact", value:"An authenticated user is able to traverse the web root to gain access to files located within the web root only.");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"insight", value:"An authenticated user issue a request to the BIG-IP configuration utility that contains a path traversal. (CVE-2015-4040 - pending)");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");

  script_tag(name:"summary", value:"The remote host is missing a security patch.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-09-07 08:20:26 +0200 (Fri, 07 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-09-18 14:41:41 +0200 (Fri, 18 Sep 2015)");
  script_category(ACT_GATHER_INFO);
  script_family("F5 Local Security Checks");
  script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
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

check_f5['LTM'] = make_array( 'affected',   '11.0.0-11.6.3;10.1.0-10.2.4;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['AAM'] = make_array( 'affected',   '11.4.0-11.6.3;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['AFM'] = make_array( 'affected',   '11.4.0-11.6.3;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['AVR'] = make_array( 'affected',   '11.4.0-11.6.3;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['APM'] = make_array( 'affected',   '11.0.0-11.6.3;10.1.0-10.2.4;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['ASM'] = make_array( 'affected',   '11.0.0-11.6.3;10.1.0-10.2.4;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['GTM'] = make_array( 'affected',   '11.0.0-11.6.3;10.1.0-10.2.4;',
                              'unaffected', '11.6.3.2;');

check_f5['LC'] = make_array( 'affected',    '11.0.0-11.6.3;10.1.0-10.2.4;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['PEM'] = make_array( 'affected',   '11.3.0-11.6.3;',
                              'unaffected', '11.6.3.2-14.0.0;');

check_f5['PSM'] = make_array( 'affected',   '11.0.0-11.4.1;10.1.0-10.2.4;',
                              'unaffected', '');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


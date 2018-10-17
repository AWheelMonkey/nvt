###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_K23134279.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# F5 BIG-IP - Article: K23134279 - Node.js vulnerability CVE-2016-2216
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.140205");
  script_cve_id("CVE-2016-2216", "CVE-2016-9244");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_version("$Revision: 11863 $");

  script_name("F5 BIG-IP - Article: K23134279 - Node.js vulnerability CVE-2016-2216");

  script_xref(name:"URL", value:"https://support.f5.com/csp/article/K23134279");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"The HTTP header parsing code in Node.js 0.10.x before 0.10.42, 0.11.6 through 0.11.16, 0.12.x before 0.12.10, 4.x before 4.3.0, and 5.x before 5.6.0 allows remote attackers to bypass an HTTP response-splitting protection mechanism via UTF-8 encoded Unicode characters in the HTTP header, as demonstrated by %c4%8d%c4%8a.");
  script_tag(name:"impact", value:"This vulnerability may allow a remote attacker to bypass an HTTP response-splitting protection mechanism.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-03-22 09:40:01 +0100 (Wed, 22 Mar 2017)");
  script_category(ACT_GATHER_INFO);
  script_family("F5 Local Security Checks");
  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
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

check_f5['LTM'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['AAM'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['AFM'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;');

check_f5['AVR'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['APM'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['ASM'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['GTM'] = make_array( 'affected',   '11.6.0-11.6.1;',
                              'unaffected', '11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['LC'] = make_array( 'affected',    '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;11.2.1;');

check_f5['PEM'] = make_array( 'affected',   '12.0.0-12.1.2;11.6.0-11.6.1;',
                              'unaffected', '13.0.0;12.1.3;11.6.2;11.4.0-11.5.4;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


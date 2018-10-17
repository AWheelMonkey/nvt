###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol19784568.nasl 11702 2018-10-01 07:31:38Z asteins $
#
# F5 BIG-IP - SOL19784568 - TMM vulnerability CVE-2016-5023
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
  script_oid("1.3.6.1.4.1.25623.1.0.140010");
  script_cve_id("CVE-2016-5023");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_version("$Revision: 11702 $");

  script_name("F5 BIG-IP - SOL19784568 - TMM vulnerability CVE-2016-5023");

  script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/k/19/sol19784568.html?sr=58084287");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"summary", value:"An unauthenticated remote attacker may be able to disrupt services on the BIG-IP with maliciously crafted network traffic. This vulnerability affects virtual servers associated with TCP profiles. The management interface is not affected by this vulnerability.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"last_modification", value:"$Date: 2018-10-01 09:31:38 +0200 (Mon, 01 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-10-24 14:19:11 +0200 (Mon, 24 Oct 2016)");
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

check_f5['LTM'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['AAM'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;');

check_f5['AFM'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;');

check_f5['AVR'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;');

check_f5['APM'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['ASM'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['GTM'] = make_array( 'affected',   '11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['LC'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['PEM'] = make_array( 'affected',   '12.0.0;11.6.0_HF5-HF7;11.5.3-11.5.4;11.4.1_HF4-HF10;',
                              'unaffected', '12.1.0;12.0.0_HF3;11.6.1;11.6.0-11.6.0_HF4;11.5.4_HF2;11.5.0-11.5.2;11.4.0-11.4.1_HF3;');

check_f5['PSM'] = make_array( 'affected',   '11.4.1_HF4-HF10;11.2.1_HF11-HF15;',
                              'unaffected', '11.4.0-11.4.1_HF3;11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['WAM'] = make_array( 'affected',   '11.2.1_HF11-HF15;',
                              'unaffected', '11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

check_f5['WOM'] = make_array( 'affected',   '11.2.1_HF11-HF15;',
                              'unaffected', '11.2.1_HF16;11.2.1-11.2.1_HF10;10.2.1-10.2.4;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

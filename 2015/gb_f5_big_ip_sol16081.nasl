###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_ip_sol16081.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# F5 BIG-IP - ASM cross-site scripting (XSS) vulnerability
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
  script_oid("1.3.6.1.4.1.25623.1.0.105229");
  script_cve_id("CVE-2015-1050");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_version("$Revision: 11872 $");

  script_name("F5 BIG-IP - ASM cross-site scripting (XSS) vulnerability");

  script_xref(name:"URL", value:"https://support.f5.com/kb/en-us/solutions/public/16000/000/sol16081.html");

  script_tag(name:"impact", value:"Remote attackers may be able to inject arbitrary web script or HTML by way of the Response Body field.");

  script_tag(name:"vuldetect", value:"Check the version.");

  script_tag(name:"insight", value:"Cross-site scripting (XSS) vulnerability in F5 BIG-IP Application Security Manager (ASM) before 11.6.0
allows an authenticated user to inject arbitrary web script or HTML via the Response Body field.");

  script_tag(name:"solution", value:"See the referenced vendor advisory for a solution.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"F5 BIG-IP is prone to a cross-site scripting (XSS) vulnerability.");
  script_tag(name:"affected", value:"F5 BIG-IP before 11.6.0");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-03-03 11:43:44 +0100 (Tue, 03 Mar 2015)");
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

check_f5['ASM'] = make_array( 'affected',   '11.0.0-11.5.2;10.1.0-10.2.4;',
                              'unaffected', '11.6.0;11.5.3;11.5.2_HF1;');

if( report = is_f5_vulnerable( ca:check_f5, version:version ) )
{
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );


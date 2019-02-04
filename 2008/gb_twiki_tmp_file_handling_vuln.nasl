###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_twiki_tmp_file_handling_vuln.nasl 12952 2019-01-07 06:54:36Z ckuersteiner $
#
# Insecure tempfile handling Vulnerability in TWiki - Sep08
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/a:twiki:twiki';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800130");
  script_version("$Revision: 12952 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-07 07:54:36 +0100 (Mon, 07 Jan 2019) $");
  script_tag(name:"creation_date", value:"2008-11-11 09:14:20 +0100 (Tue, 11 Nov 2008)");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-4998");

  script_name("Insecure tempfile handling Vulnerability in TWiki - Sep08");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_twiki_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("twiki/detected");

  script_tag(name:"impact", value:"Successful attack could lead to rewriting some system file.");

  script_tag(name:"affected", value:"TWiki Version 4.1.2.");

  script_tag(name:"insight", value:"Local users can overwrite arbitrary files via a symlink attack on the
  /tmp/twiki temporary file.");

  script_tag(name:"solution", value:"Upgrade TWiki to higher version.");

  script_tag(name:"summary", value:"The host is running TWiki which is prone to Insecure temp file
  handling Vulnerability.");

  script_xref(name:"URL", value:"http://www.openwall.com/lists/oss-security/2008/10/30/2");
  script_xref(name:"URL", value:"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=494648");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_equal( version:vers, test_version:"4.1.2" ) ) {
   report = report_fixed_ver( installed_version:vers, fixed_version:"4.1.2-4" );
   security_message( port:port, data:report );
   exit( 0 );
}

exit( 99 );

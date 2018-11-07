###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ibm_lotus_domino_rpc_auth_dos_vuln.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# IBM Lotus Domino Notes RPC Authentication Processing Denial of Service Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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

CPE = 'cpe:/a:ibm:lotus_domino';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.2497");
  script_version("$Revision: 11997 $");
  script_cve_id("CVE-2011-1393");
  script_bugtraq_id(51167);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-12-29 10:48:29 +0530 (Thu, 29 Dec 2011)");
  script_name("IBM Lotus Domino Notes RPC Authentication Processing Denial of Service Vulnerability");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Denial of Service");
  script_dependencies("gb_lotus_domino_detect.nasl");
  script_mandatory_keys("Domino/Version");

  script_tag(name:"impact", value:"Successful exploitation may allow remote attackers to cause a denial
  of service via a specially crafted packet.");
  script_tag(name:"affected", value:"IBM Lotus Domino Versions 8.x before 8.5.2 FP4");
  script_tag(name:"insight", value:"The flaw is due to an error when processing certain RPC operations
  related to authentication and can be exploited to crash the Domino server
  via a specially crafted packet.");
  script_tag(name:"solution", value:"Upgrade to IBM Lotus Domino version 8.5.2 FP4 or 8.5.3 or later");
  script_tag(name:"summary", value:"The host is running IBM Lotus Domino Server and is prone to denial
  of service vulnerability.");

  script_xref(name:"URL", value:"http://secunia.com/advisories/47331");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/71805");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21575247");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://www-01.ibm.com/software/lotus/products/domino/");
  exit(0);
}

include("version_func.inc");
include("revisions-lib.inc"); # Used in get_highest_app_version
include("host_details.inc");

if( ! vers = get_highest_app_version( cpe:CPE ) ) exit( 0 );

vers = ereg_replace(pattern:"FP", string:vers, replace: ".FP");

if( version_in_range( version:vers, test_version:"8.0", test_version2:"8.5.2.FP3" ) ) {
  report = report_fixed_ver( installed_version: vers, fixed_version:"8.5.2 FP4" );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );

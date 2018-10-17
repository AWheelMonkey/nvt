##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_hp_openview_nnm_xss_vuln_900403.nasl 7551 2017-10-24 12:24:05Z cfischer $
#
# HP OpenView Network Node Manager XSS Vulnerability
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (C) 2008 SecPod, http://www.secpod.com
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
##############################################################################

CPE = "cpe:/a:hp:openview_network_node_manager";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900403");
  script_version("$Revision: 7551 $");
  script_bugtraq_id(26838,27237);
  script_cve_id("CVE-2007-5000", "CVE-2007-6388");
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 14:24:05 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2008-12-02 11:52:55 +0100 (Tue, 02 Dec 2008)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_name("HP OpenView Network Node Manager XSS Vulnerability");
  script_dependencies("os_detection.nasl", "secpod_hp_openview_nnm_detect.nasl");
  script_require_ports("Services/www", 7510);
  script_mandatory_keys("HP/OVNNM/installed", "Host/runs_unixoide");

  script_xref(name:"URL", value:"http://secunia.com/Advisories/32800");

  tag_impact = "Successful exploitation will allow attacker to execute arbitrary codes.

  Impact Level: Application";

  tag_solution = "Apply patches or upgrade to the latest version.
  http://welcome.hp.com/country/us/en/support.html

  ******
  NOTE: Windows platform is not affected.
  ******";

  tag_affected = "HP OpenView Network Node Manager versions 7.01, 7.51 and 7.53 on HP-UX, Linux,
  and Solaris.";

  tag_insight = "The flaws are due to errors in HP OpenView NNM 'Network Node Manager'
  program.";

  tag_summary = "This host is running HP OpenView Network Node Manager, which is prone to 
  Cross Site Scripting vulnerability.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"impact", value:tag_impact);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
get_app_version( cpe:CPE, port:port, nofork:TRUE );
if( ! vers = get_kb_item( "www/"+ port + "/HP/OVNNM/Ver" ) ) exit( 0 );

if( version_is_equal( version:vers, test_version:"B.07.01" ) ||
    version_is_equal( version:vers, test_version:"B.07.51" ) ||
    version_is_equal( version:vers, test_version:"B.07.53" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"See references" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
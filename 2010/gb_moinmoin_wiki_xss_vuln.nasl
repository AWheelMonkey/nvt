###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_moinmoin_wiki_xss_vuln.nasl 8755 2018-02-12 06:56:14Z cfischer $
#
# MoinMoin 'Despam' Action Cross Site Scripting Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:moinmo:moinmoin";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801307");
  script_version("$Revision: 8755 $");
  script_cve_id("CVE-2010-0828");
  script_bugtraq_id(39110);
  script_tag(name:"last_modification", value:"$Date: 2018-02-12 07:56:14 +0100 (Mon, 12 Feb 2018) $");
  script_tag(name:"creation_date", value:"2010-04-13 16:55:19 +0200 (Tue, 13 Apr 2010)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");
  script_name("MoinMoin 'Despam' Action Cross-Site Scripting Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_moinmoin_wiki_detect.nasl");
  script_require_ports("Services/www", 8080);
  script_mandatory_keys("moinmoinWiki/installed");

  script_xref(name:"URL", value:"http://moinmo.in/SecurityFixes");
  script_xref(name:"URL", value:"http://seclists.org/oss-sec/");
  script_xref(name:"URL", value:"http://secunia.com/advisories/39188");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=578801");
  script_xref(name:"URL", value:"http://comments.gmane.org/gmane.comp.security.oss.general/2773");

  tag_impact = "Successful exploitation will allow attackers to execute arbitrary scripting
  code.

  Impact Level: Application";

  tag_affected = "MoinMoin Wiki version 1.8.7 and 1.9.2";

  tag_insight = "Input passed via the 'page' name which is not properly sanitising before being
  returned to the user in 'Despam.py'. This can be exploited to insert arbitrary
  HTML and script code, when the Despam functionality is used on a page with a
  specially crafted page name.";

  tag_solution = "Upgrade MoinMoin Wiki 1.9.2-3 or latest,

  For updates refer to http://moinmo.in/MoinMoinDownload";

  tag_summary = "This host is running MoinMoin Wiki and is prone to Cross-Site
  Scripting vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

## Check for version 1.8.7
if( version_is_equal( version:vers, test_version:"1.8.7" ) ||
    version_is_equal( version:vers, test_version:"1.9.2" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"1.9.2-3" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
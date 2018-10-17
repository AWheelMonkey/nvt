###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flashchat_sec_bypass_vuln.nasl 4709 2016-12-08 09:44:07Z cfi $
#
# FlashChat Role Filter Security Bypass Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:tufat:flashchat";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800616");
  script_version("$Revision: 4709 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-08 10:44:07 +0100 (Thu, 08 Dec 2016) $");
  script_tag(name:"creation_date", value:"2009-05-13 10:01:19 +0200 (Wed, 13 May 2009)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2008-6799");
  script_bugtraq_id(31800);
  script_name("FlashChat Role Filter Security Bypass Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_flashchat_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("flashchat/installed");

  script_xref(name:"URL", value:"http://secunia.com/advisories/32350");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/45974");

  tag_impact = "Successful exploitation will let the attacker bypass certain
  security restrictions and gain unauthorized administrative access to the
  affected application.";

  tag_affected = "FlashChat Version 5.0.8 and prior";

  tag_insight = "This flaw is due to an error in the connection.php script.
  By setting the 's' parameter to a value of '7' a remote attacker could bypass
  the role filtering mechanism.";

  tag_solution = "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.";

  tag_summary = "This host is installed with FlashChat and is prone to Security
  Bypass Vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"5.0.8" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"None available" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );

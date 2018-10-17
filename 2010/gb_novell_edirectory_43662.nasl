###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_novell_edirectory_43662.nasl 5772 2017-03-29 16:44:30Z mime $
#
# Novell eDirectory Server Malformed Index Denial Of Service Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100834");
  script_version("$Revision: 5772 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-29 18:44:30 +0200 (Wed, 29 Mar 2017) $");
  script_tag(name:"creation_date", value:"2010-10-04 14:08:22 +0200 (Mon, 04 Oct 2010)");
  script_bugtraq_id(43662);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Novell eDirectory Server Malformed Index Denial Of Service Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("novell_edirectory_detect.nasl");
  script_require_ports("Services/ldap", 389, 636);
  script_mandatory_keys("eDirectory/installed");

  script_xref(name:"URL", value:"https://www.securityfocus.com/bid/43662");
  script_xref(name:"URL", value:"http://www.novell.com");
  script_xref(name:"URL", value:"http://www.novell.com/support/viewContent.do?externalId=7006389&sliceId=2");

  tag_summary = "Novell eDirectory is prone to a denial-of-service vulnerability.";

  tag_impact = "Remote attackers can exploit this issue to crash the application,
  denying service to legitimate users.";

  tag_affected = "This vulnerability has been resolved in eDirectory 8.8.5 ftf4.";

  tag_solution = "Updates are available. Please see the references for details.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = make_list( "cpe:/a:novell:edirectory","cpe:/a:netiq:edirectory" );

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! major = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( ! sp = get_kb_item( "ldap/eDirectory/" + port + "/sp" ) )
  sp = "0";

invers = major;

if( sp > 0 )
  invers += ' SP' + sp;

revision = get_kb_item( "ldap/eDirectory/" + port + "/build" );
revision = str_replace( string:revision, find:".", replace:"" );

if( major == "8.8" )
{
  if( sp && sp > 0 )
  {
    if( sp > 5 ) exit( 0 );

    if( sp == 5 )
    {
      if( revision && revision < 2050413 )
      {
        VULN = TRUE;
      }
    }
    else
    {
      VULN = TRUE;
    }
  }
  else
  {
    VULN = TRUE;
  }
}


if(VULN) {
  report =  report_fixed_ver( installed_version:invers, fixed_version:"See advisory" );
  security_message( port:port, data:report );
  exit(0);
}

exit(99);

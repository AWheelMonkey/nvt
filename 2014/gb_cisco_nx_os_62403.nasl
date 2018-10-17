###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_nx_os_62403.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Cisco Open Network Environment Platform Denial of Service Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103878");
  script_bugtraq_id(62403);
  script_cve_id("CVE-2013-5496");
  script_tag(name:"cvss_base", value:"6.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:N/A:C");
  script_version("$Revision: 11867 $");

  script_name("Cisco Open Network Environment Platform  Denial of Service Vulnerability");


  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/62403");
  script_xref(name:"URL", value:"https://tools.cisco.com/bugsearch/bug/CSCui51551");

  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-01-10 12:10:24 +0100 (Fri, 10 Jan 2014)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("CISCO");
  script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_cisco_nx_os_version.nasl");
  script_mandatory_keys("cisco_nx_os/version", "cisco_nx_os/model", "cisco_nx_os/device");

  script_tag(name:"impact", value:"Successful exploits will cause the network element to reload, denying
service to legitimate users.");
  script_tag(name:"vuldetect", value:"Check the NX OS version.");
  script_tag(name:"insight", value:"This issue is being tracked by Cisco Bug ID CSCui51551.");
  script_tag(name:"solution", value:"Updates are available.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Cisco Open Network Environment Platform running on NX-OS is prone to a
denial-of-service vulnerability");
  script_tag(name:"affected", value:"Nexus 3000 Series with NX-OS 6.0(2)U1(2) and 6.0(2)U1(1)");

  exit(0);
}

if( ! device = get_kb_item( "cisco_nx_os/device" ) ) exit( 0 );
if( "Nexus" >!< device ) exit( 0 );

if ( ! nx_model = get_kb_item( "cisco_nx_os/model" ) )   exit( 0 );
if ( ! nx_ver   = get_kb_item( "cisco_nx_os/version" ) ) exit( 0 );

if ( nx_model !~ '^3[0-9][0-9][0-9]') exit(99);

if ( nx_ver  == "6.0(2)U1(1)" || nx_ver == "6.0(2)U1(2)"  )
{
  security_message(port:0, data:'Installed Version: ' + nx_ver + '\nFixed Version:     6.0(2)U1(3)');
  exit(0);
}

exit(99);


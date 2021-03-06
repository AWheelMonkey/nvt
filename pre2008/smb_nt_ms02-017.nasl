###############################################################################
# OpenVAS Vulnerability Test
# $Id: smb_nt_ms02-017.nasl 10213 2018-06-15 10:04:26Z cfischer $
#
# MUP overlong request kernel overflow Patch (Q311967)
#
# Authors:
# Michael Scheidell <scheidell at secnap.net>
#
# Copyright:
# Copyright (C) 2002 Michael Scheidell
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.10944");
  script_version("$Revision: 10213 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 12:04:26 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(4426);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2002-0151");
  script_name("MUP overlong request kernel overflow Patch (Q311967)");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2002 Michael Scheidell");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/registry_enumerated");

  script_tag(name:"summary", value:"Buffer overflow in Multiple UNC Provider (MUP) in Microsoft
  Windows operating systems allows local users to cause a denial of service or possibly gain SYSTEM
  privileges via a long UNC request.");

  script_tag(name:"affected", value:"Microsoft Windows NT 4.0 Workstation

  Microsoft Windows NT 4.0 Server

  Microsoft Windows NT 4.0 Server, Enterprise Edition

  Microsoft Windows NT 4 Terminal Server Edition

  Microsoft Windows 2000 Professional

  Microsoft Windows 2000 Server

  Microsoft Windows 2000 Advanced Server

  Microsoft Windows XP Professional");

  script_tag(name:"solution", value:"The vendor has released updates, please see http://www.microsoft.com/technet/security/bulletin/ms02-017.mspx");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("secpod_reg.inc");

if ( hotfix_check_sp(nt:7, win2k:3, xp:1) <= 0 ) exit(0);
if ( hotfix_missing(name:"Q312895") > 0  )
  security_message(port:0);

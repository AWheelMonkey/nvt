##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms_win_local_dos_vuln_900178.nasl 12602 2018-11-30 14:36:58Z cfischer $
# Description: Microsoft Windows 'UnhookWindowsHookEx' Local DoS Vulnerability
#
# Authors:
# Sharath S <sharaths@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900178");
  script_version("$Revision: 12602 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-30 15:36:58 +0100 (Fri, 30 Nov 2018) $");
  script_tag(name:"creation_date", value:"2008-12-02 11:52:55 +0100 (Tue, 02 Dec 2008)");
  script_cve_id("CVE-2008-5044");
  script_bugtraq_id(32206);
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:N/I:N/A:C");
  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_name("Microsoft Windows 'UnhookWindowsHookEx' Local DoS Vulnerability");

  script_xref(name:"URL", value:"http://killprog.com/whk.zip");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/498165");

  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name:"impact", value:"Attackers may exploit this issue to deny service to legitimate users.");
  script_tag(name:"affected", value:"Microsoft Windows Server 2003 Service Pack 2 and prior.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"This Microsoft Windows host is prone to denial of service
  vulnerability.

  The flaw is due to error in 'UnhookWindowsHookEx' function. This can
  be exploited to cause system hang.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");
  script_xref(name:"URL", value:"http://www.microsoft.com/en-in/default.aspx");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");

if(hotfix_check_sp(win2003:3) <= 0){
  exit(0);
}
security_message( port: 0, data: "The target host was found to be vulnerable" );

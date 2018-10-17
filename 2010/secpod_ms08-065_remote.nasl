###############################################################################
## OpenVAS Vulnerability Test
## $Id: secpod_ms08-065_remote.nasl 8187 2017-12-20 07:30:09Z teissa $
##
## Message Queuing Remote Code Execution Vulnerability (951071) - Remote
##
## Authors:
## Veerendra GG <veerendragg@secpod.com>
##
## Copyright:
## Copyright (c) 2010 SecPod, http://www.secpod.com
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License version 2
## (or any later version), as published by the Free Software Foundation.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
################################################################################

tag_impact = "Successful exploitation could allow remote code execution by
  sending a specially crafted RPC request and can take complete control
  of an affected system.
  Impact Level: System";
tag_affected = "Microsoft Windows 2000 Service Pack 4 and prior.";
tag_insight = "The flaw exists due to a boundary error when parsing RPC requests to the
  Message Queuing (MSMQ).";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link.
  http://www.microsoft.com/technet/security/Bulletin/MS08-065.mspx";
tag_summary = "This host is missing important security update according to
  Microsoft Bulletin MS08-065.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900244");
  script_version("$Revision: 8187 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-20 08:30:09 +0100 (Wed, 20 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-06-09 17:27:19 +0200 (Wed, 09 Jun 2010)");
  script_bugtraq_id(31637);
  script_cve_id("CVE-2008-3479");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Message Queuing Remote Code Execution Vulnerability (951071) - Remote");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("find_service.nasl");
  script_require_ports(2103);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"remote_app");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/Bulletin/MS08-065.mspx");
  exit(0);
}


## Check Message Queue port state
port = 2103;
if (!get_port_state(port)){
  exit(0);
}

## Open TCP Socket
soc = open_sock_tcp(port);
if (!soc){
  exit(0);
}

## Construct first raw DCERPC packet to bind to Specific UUID
## i.e fdb3a030-065f-11d1-bb9b-00a024ea5525 (MS-MQQM)
req = raw_string(
                   0x05, 0x00, 0x0b, 0x03, 0x10, 0x00, 0x00, 0x00,
                   0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                   0xd0, 0x16, 0xd0, 0x16, 0x00, 0x00, 0x00, 0x00,
                   0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
                   0x30, 0xa0, 0xb3, 0xfd, 0x5f, 0x06, 0xd1, 0x11,
                   0xbb, 0x9b, 0x00, 0xa0, 0x24, 0xea, 0x55, 0x25,
                   0x01, 0x00, 0x00, 0x00, 0x04, 0x5d, 0x88, 0x8a,
                   0xeb, 0x1c, 0xc9, 0x11, 0x9f, 0xe8, 0x08, 0x00,
                   0x2b, 0x10, 0x48, 0x60, 0x02, 0x00, 0x00, 0x00
                );
send(socket:soc, data:req);
resp = recv(socket: soc, length: 1024);

## Check the response for specific fields
## Packet type: 12 (Bind_ack) @ offset 2 - 1 byte
## Auth Length: 00 @ Offset 10 - 2 bytes
## Call ID : 00 @ Offset 12 - 4 bytes
if(!(resp[2] && ord(resp[2]) == 12 && resp[10] && ord(resp[10]) == 00 &&
   resp[11] && ord(resp[11]) == 00 && resp[12] && ord(resp[12]) == 00 &&
   resp[13] && ord(resp[13]) == 00 && resp[14] && ord(resp[14]) == 00 &&
   resp[15] && ord(resp[15]) == 00)){
  exit(0);
}

## Construct a DCERPC packet with Packet Type:request and opnum 28
req = raw_string(0x05, 0x00, 0x00, 0x03, 0x10, 0x00, 0x00, 0x00,
                 0x1c, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
                 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00,
                 0x04, 0x00, 0x00, 0x00
                );
send(socket:soc, data:req);
resp = recv(socket: soc, length: 1024);

## Check the response for specific fields
## Packet Type : 2 (Response) @ offset 2
## Check for specific fields in Stub Data, which differs
## After applying the pactch
if(resp && strlen(resp) >= 55)
{
  if(ord(resp[2]) == 02 && ord(resp[40]) == 50 && ord(resp[41]) == 00 &&
     ord(resp[42]) == 44 && ord(resp[43]) == 00 && ord(resp[44]) == 48 &&
     ord(resp[45]) == 00 && ord(resp[46]) == 44 && ord(resp[47]) == 00 &&
     (ord(resp[48]) == 54 || ord(resp[48]) == 55)){
    security_message(port);
  }
}

## Close the socket
close(soc);

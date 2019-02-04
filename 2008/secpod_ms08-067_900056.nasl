##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms08-067_900056.nasl 13210 2019-01-22 09:14:04Z cfischer $
# Description: Vulnerability in Server Service Could Allow Remote Code Execution (958644)
#
# Authors:
# Chandan S <schandan@secpod.com>
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

#############################################################################
#  Based on the work of Tim Brown <timb@nth-dimension.org.uk> as published
#  here, http://www.nth-dimension.org.uk/blog.php?id=72
############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900056");
  script_version("$Revision: 13210 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-22 10:14:04 +0100 (Tue, 22 Jan 2019) $");
  script_tag(name:"creation_date", value:"2008-10-30 14:46:44 +0100 (Thu, 30 Oct 2008)");
  script_bugtraq_id(31874);
  script_cve_id("CVE-2008-4250");
  script_copyright("Copyright (C) 2008 SecPod");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_category(ACT_DENIAL);
  script_family("Windows : Microsoft Bulletins");
  script_name("Vulnerability in Server Service Could Allow Remote Code Execution (958644)");
  script_dependencies("os_detection.nasl", "smb_nativelanman.nasl", "netbios_name_get.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("Host/runs_windows");
  script_exclude_keys("SMB/samba");

  script_xref(name:"URL", value:"http://secunia.com/advisories/32326");
  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/827267");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/46040");
  script_xref(name:"URL", value:"http://www.securitytracker.com/id?1021091");
  script_xref(name:"URL", value:"http://blogs.securiteam.com/index.php/archives/1150");
  script_xref(name:"URL", value:"http://www.microsoft.com/technet/security/bulletin/ms08-067.mspx");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/dd452420.aspx");

  script_tag(name:"affected", value:"Microsoft Windows 2K Service Pack 4 and prior.

  Microsoft Windows XP Service Pack 3 and prior.

  Microsoft Windows 2003 Service Pack 2 and prior.");

  script_tag(name:"insight", value:"Flaw is due to an error in the Server Service, that does not properly
  handle specially crafted RPC requests.");

  script_tag(name:"solution", value:"Run Windows Update and update the listed hotfixes or download
  and update mentioned hotfixes in the advisory");

  script_tag(name:"summary", value:"This host is missing a critical security update according to
  Microsoft Bulletin MS08-067.");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to take
  complete control of an affected system.

  Variants of Conficker worm are based on the above described vulnerability.
  More details regarding the worm and means to resolve this can be found at,
  the linked references.");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");

if( kb_smb_is_samba() ) exit( 0 );

name = kb_smb_name();
login = kb_smb_login();
pass  = kb_smb_password();
domain = kb_smb_domain();
port = kb_smb_transport();

soc = open_sock_tcp(port);
if(!soc){
 exit(0);
}

if(!login)login = "";
if(!pass) pass = "";

r = smb_session_request(soc:soc, remote:name);
if(!r) { close(soc); exit(0); }

prot = smb_neg_prot(soc:soc);
if(!prot){ close(soc); exit(0); }

r = smb_session_setup(soc:soc, login:login, password:pass, domain:domain, prot:prot);
if(!r)
{
  close(soc);
  exit(0);
}

uid = session_extract_uid(reply:r);
if(!uid)
{
  close(soc);
  exit(0);
}

r = smb_tconx(soc:soc, uid:uid, share:"IPC$", name:name);
if(!r)
{
  close(soc);
  exit(0);
}

tid = tconx_extract_tid(reply:r);
if(!tid)
{
  close(soc);
  exit(0);
}

tid_high = tid / 256;
tid_low  = tid % 256;
uid_high = uid / 256;
uid_low  = uid % 256;

## SMB NT Create AndX Request, Path: \browser
smb_nt_andx_req = raw_string(0x00, 0x00, 0x00, 0x66, 0xff, 0x53, 0x4d, 0x42,
                             0xa2, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, tid_low, tid_high, 0xd9,
                             0x46, uid_low, uid_high, 0x00, 0x01, 0x18, 0xff,
                             0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x16, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9f, 0x01,
                             0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00,
                             0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00,
                             0x40, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x13,
                             0x00, 0x00, 0x5c, 0x00, 0x62, 0x00, 0x72, 0x00,
                             0x6f, 0x00, 0x77, 0x00, 0x73, 0x00, 0x65, 0x00,
                             0x72, 0x00, 0x00, 0x00);

send(socket:soc, data:smb_nt_andx_req);

smb_nt_andx_resp = smb_recv(socket:soc);
if(smb_nt_andx_resp && strlen(smb_nt_andx_resp) < 107)
{
  close(soc);
  exit(0);
}

fid_low = ord(smb_nt_andx_resp[42]);
fid_high = ord(smb_nt_andx_resp[43]);

## DCERPC Bind: call_id: 0 SRVSVC V3.0
dcerpc_bind_srvsvc_req = raw_string(0x00, 0x00, 0x00, 0x88, 0xff, 0x53, 0x4d,
                                    0x42, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x18,
                                    0x03, 0xc8, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    tid_low, tid_high, 0xd9, 0x46, uid_low,
                                    uid_high, 0x40, 0x01, 0x0e, 0xff, 0x00,
                                    0x00, 0x00, fid_low, fid_high, 0x00, 0x00,
                                    0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x08,
                                    0x00, 0x48, 0x00, 0x00, 0x00, 0x48, 0x00,
                                    0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x49,
                                    0x00, 0x00, 0x05, 0x00, 0x0b, 0x03, 0x10,
                                    0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00,
                                    0x00, 0x00, 0x00, 0x00, 0xb8, 0x10, 0xb8,
                                    0x10, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
                                    0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0xc8,
                                    0x4f, 0x32, 0x4b, 0x70, 0x16, 0xd3, 0x01,
                                    0x12, 0x78, 0x5a, 0x47, 0xbf, 0x6e, 0xe1,
                                    0x88, 0x03, 0x00, 0x00, 0x00, 0x04, 0x5d,
                                    0x88, 0x8a, 0xeb, 0x1c, 0xc9, 0x11, 0x9f,
                                    0xe8, 0x08, 0x00, 0x2b, 0x10, 0x48, 0x60,
                                    0x02, 0x00, 0x00, 0x00);

send(socket:soc, data:dcerpc_bind_srvsvc_req);

dcerpc_bind_srvsvc_resp = smb_recv(socket:soc);
if(!dcerpc_bind_srvsvc_resp)
{
  close(soc);
  exit(0);
}

## SMB Read AndX Request
smb_andx_req = raw_string(0x00, 0x00, 0x00, 0x3c, 0xff, 0x53, 0x4d, 0x42,
                          0x2e, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                          0x00, 0x00, 0x00, 0x00, tid_low, tid_high, 0xd9,
                          0x46, uid_low, uid_high, 0x80, 0x01, 0x0c, 0xff,
                          0x00, 0x00, 0x00, fid_low, fid_high, 0x00, 0x00,
                          0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0xff, 0xff,
                          0xff, 0xff, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
                          0x00, 0x00, 0x00);

send(socket:soc, data:smb_andx_req);

smb_andx_resp = smb_recv(socket:soc);
if(!smb_andx_resp)
{
  close(soc);
  exit(0);
}

## SMB NT Create AndX Request, Path: \browser
smb_nt_andx_req1 = raw_string(0x00, 0x00, 0x00, 0x66, 0xff, 0x53, 0x4d, 0x42,
                              0xa2, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, tid_low, tid_high, 0xd9,
                              0x46, uid_low, uid_high, 0x00, 0x01, 0x18, 0xff,
                              0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x16, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9f, 0x01,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00,
                              0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00,
                              0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x13,
                              0x00, 0x00, 0x5c, 0x00, 0x62, 0x00, 0x72, 0x00,
                              0x6f, 0x00, 0x77, 0x00, 0x73, 0x00, 0x65, 0x00,
                              0x72, 0x00, 0x00, 0x00);

send(socket:soc, data:smb_nt_andx_req1);

smb_nt_andx_resp1 = smb_recv(socket:soc);
if(smb_nt_andx_resp1 && strlen(smb_nt_andx_resp1) < 107)
{
  close(soc);
  exit(0);
}

fid2_low = ord(smb_nt_andx_resp1[42]);
fid2_high = ord(smb_nt_andx_resp1[43]);

## DCERPC Bind: call_id: 1 WKSSVC V1.0
dcerpc_bind_wkssvc_req = raw_string(0x00, 0x00, 0x00, 0x88, 0xff, 0x53, 0x4d,
                                    0x42, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x18,
                                    0x03, 0xc8, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    tid_low, tid_high, 0xd9, 0x46, uid_low,
                                    uid_high, 0x00, 0x02, 0x0e, 0xff, 0x00,
                                    0x00, 0x00, fid2_low, fid2_high, 0x00,
                                    0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
                                    0x08, 0x00, 0x48, 0x00, 0x00, 0x00, 0x48,
                                    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    0x49, 0x00, 0x00, 0x05, 0x00, 0x0b, 0x03,
                                    0x10, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00,
                                    0x00, 0x01, 0x00, 0x00, 0x00, 0xb8, 0x10,
                                    0xb8, 0x10, 0x00, 0x00, 0x00, 0x00, 0x01,
                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
                                    0x98, 0xd0, 0xff, 0x6b, 0x12, 0xa1, 0x10,
                                    0x36, 0x98, 0x33, 0x46, 0xc3, 0xf8, 0x7e,
                                    0x34, 0x5a, 0x01, 0x00, 0x00, 0x00, 0x04,
                                    0x5d, 0x88, 0x8a, 0xeb, 0x1c, 0xc9, 0x11,
                                    0x9f, 0xe8, 0x08, 0x00, 0x2b, 0x10, 0x48,
                                    0x60, 0x02, 0x00, 0x00, 0x00);

send(socket:soc, data:dcerpc_bind_wkssvc_req);

dcerpc_bind_wkssvc_resp = smb_recv(socket:soc);
if(!dcerpc_bind_wkssvc_resp)
{
  close(soc);
  exit(0);
}

## SMB Read AndX Request
smb_andx_req1 = raw_string(0x00, 0x00, 0x00, 0x3c, 0xff, 0x53, 0x4d, 0x42,
                           0x2e, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                           0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                           0x00, 0x00, 0x00, 0x00, tid_low, tid_high, 0xd9,
                           0x46, uid_low, uid_high, 0x40, 0x02, 0x0c, 0xff,
                           0x00, 0x00, 0x00, fid2_low, fid2_high, 0x00, 0x00,
                           0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0xff, 0xff,
                           0xff, 0xff, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
                           0x00, 0x00, 0x00);

send(socket:soc, data:smb_andx_req1);

smb_andx_resp1 = smb_recv(socket:soc);
if(!smb_andx_resp1)
{
  close(soc);
  exit(0);
}

## SRVSVC NetPathCompare request
netpath_cmp_req= raw_string(0x00, 0x00, 0x01, 0x10, 0xff, 0x53, 0x4d, 0x42,
                            0x25, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            0x00, 0x00, 0x00, 0x00, tid_low, tid_high, 0xd9,
                            0x46, uid_low, uid_high, 0xc0, 0x02, 0x10, 0x00,
                            0x00, 0xbc, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            0x00, 0x00, 0x00, 0x54, 0x00, 0xbc, 0x00, 0x54,
                            0x00, 0x02, 0x00, 0x26, 0x00, fid_low, fid_high,
                            0xcd, 0x00, 0x00, 0x5c, 0x00, 0x50, 0x00, 0x49,
                            0x00, 0x50, 0x00, 0x45, 0x00, 0x5c, 0x00, 0x00,
                            0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x03, 0x10,
                            0x00, 0x00, 0x00, 0xbc, 0x00, 0x00, 0x00, 0x03,
                            0x00, 0x00, 0x00, 0xa4, 0x00, 0x00, 0x00, 0x00,
                            0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2f,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2f,
                            0x00, 0x00, 0x00, 0x5c, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x41, 0x00, 0x41, 0x00, 0x41,
                            0x00, 0x41, 0x00, 0x5c, 0x00, 0x2e, 0x00, 0x2e,
                            0x00, 0x5c, 0x00, 0x4f, 0x00, 0x70, 0x00, 0x65,
                            0x00, 0x6e, 0x00, 0x56, 0x41, 0x53, 0x00, 0x00,
                            0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00,
                            0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x5c,
                            0x00, 0x4f, 0x00, 0x70, 0x00, 0x65, 0x00, 0x6e,
                            0x00, 0x56, 0x41, 0x53, 0x00, 0x00, 0x00, 0x01,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

send(socket:soc, data:netpath_cmp_req);

netpath_cmp_resp = smb_recv(socket:soc);
if(!netpath_cmp_resp)
{
  close(soc);
  exit(0);
}

## SMB Tree Disconnect Request
smb_tree_dis_req = raw_string(0x00, 0x00, 0x00, 0x23, 0xff, 0x53, 0x4d, 0x42,
                              0x71, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, tid_low, tid_high, 0xd9,
                              0x46, uid_low, uid_high, 0x00, 0x03, 0x00, 0x00,
                              0x00);

send(socket:soc, data:smb_tree_dis_req);

smb_tree_dis_resp = smb_recv(socket:soc);
if(!smb_tree_dis_resp)
{
  close(soc);
  exit(0);
}

## SMB Logoff AndX Request
smb_logoff_req = raw_string(0x00, 0x00, 0x00, 0x27, 0xff, 0x53, 0x4d, 0x42,
                            0x74, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0xc8,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd9, 0x46,
                            uid_low, uid_high, 0x40, 0x03, 0x02, 0xff, 0x00,
                            0x00, 0x00, 0x00, 0x00);

send(socket:soc, data:smb_logoff_req);

smb_logoff_resp = smb_recv(socket:soc);
if(!smb_logoff_resp)
{
  close(soc);
  exit(0);
}

## nb: Checking netpath_cmp_resp, to confirm the vuln. After applying the patch, netpath_cmp_resp contains Windows Error: WERR_INVALID_NAME (0x0000007b)
if(ord(netpath_cmp_resp[84]) == 00 && ord(netpath_cmp_resp[85]) == 00 &&
   ord(netpath_cmp_resp[86]) == 00 && ord(netpath_cmp_resp[87]) == 00){
  security_message(port);
}

close(soc);

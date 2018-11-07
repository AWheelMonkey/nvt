###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ciscokits_tftp_server_dir_trav_vuln.nasl 11997 2018-10-20 11:59:41Z mmartin $
#
# CiscoKits TFTP Server Directory Traversal Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801965");
  script_version("$Revision: 11997 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-20 13:59:41 +0200 (Sat, 20 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-08-10 13:49:51 +0200 (Wed, 10 Aug 2011)");
  script_bugtraq_id(49053);
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_name("CiscoKits TFTP Server Directory Traversal Vulnerability");

  script_xref(name:"URL", value:"http://secpod.org/blog/?p=301");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/17619/");
  script_xref(name:"URL", value:"http://secpod.org/SECPOD_CiscoKits_TFTP_Server_Dir_Trav_POC.py");
  script_xref(name:"URL", value:"http://secpod.org/advisories/SECPOD_CiscoKits_TFTP_Server_Dir_Trav.txt");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_dependencies("tftpd_detect.nasl", "os_detection.nasl");
  script_family("Remote file access");
  script_require_udp_ports("Services/udp/tftp", 69);

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to read arbitrary
  files on the affected application.");
  script_tag(name:"affected", value:"CiscoKits TFTP Server Version 1.0 and prior.");
  script_tag(name:"insight", value:"The flaw is due to an error while handling certain requests
  containing 'dot dot' sequences (..), which can be exploited to download
  arbitrary files from the host system.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"The host is running CiscoKits TFTP Server and is prone to
  directory traversal vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("misc_func.inc");
include("tftp.inc");

port = get_kb_item("Services/udp/tftp");
if(!port){
  port = 69;
}

if(!get_port_state(port)){
  exit(0);
}

files = traversal_files("windows");

foreach file(keys(files)) {

  response = tftp_get(port:port, path:"../../../../../../../../../" +
                                      "../../../" + files[file]);
  if (egrep(pattern:file, string:response, icase:TRUE)) {
    security_message(port: port, proto: "udp");
    exit(0);
  }
}

exit(99);

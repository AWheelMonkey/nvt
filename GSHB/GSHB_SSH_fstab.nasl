###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_SSH_fstab.nasl 10612 2018-07-25 12:26:01Z cfischer $
#
# Read /etc/fstab and search for Volumes with reiserfs
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.96094");
  script_version("$Revision: 10612 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-25 14:26:01 +0200 (Wed, 25 Jul 2018) $");
  script_tag(name:"creation_date", value:"2010-06-21 10:39:50 +0200 (Mon, 21 Jun 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Read /etc/fstab and search for Volumes with reiserfs");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
  script_dependencies("compliance_tests.nasl", "find_service.nasl", "gather-package-list.nasl");

  script_tag(name:"summary", value:"This plugin uses ssh to Read /etc/fstab and search for Volumes with reiserfs.");

  exit(0);
}

cmdline = 0;
include("ssh_func.inc");

port = get_preference("auth_port_ssh");
if(!port) port = get_kb_item("Services/ssh");
if(!port) {
    port = 22;
}
sock = ssh_login_or_reuse_connection();
if(!sock) {
    error = get_ssh_error();
    if (!error) error = "No SSH Port or Connection!";
    log_message(port:port, data:error);
    set_kb_item(name: "GSHB/FSTAB/reiserfs", value:"error");
    set_kb_item(name: "GSHB/FSTAB/log", value:error);
    exit(0);
}

windowstest = ssh_cmd(socket:sock, cmd:"cmd /?");
if (("windows" >< windowstest && "interpreter" >< windowstest) || ("Windows" >< windowstest && "interpreter" >< windowstest)){
  set_kb_item(name: "GSHB/FSTAB/reiserfs", value:"windows");
  exit(0);
}


fstab = ssh_cmd(socket:sock, cmd:"grep -v '^#' /etc/fstab");
if (fstab =~ ".*Datei oder Verzeichnis nicht gefunden.*" ||  fstab =~ ".*No such file or directory.*") fstab = "none";

if (fstab != "none" && "reiserfs" >< fstab){
  Lst = split(fstab, keep:0);
  for(i=0; i<max_index(Lst); i++){
    if ("reiserfs" >!< Lst[i])continue;
    val += Lst[i] + '\n';
  }
  fstab = val;
}
else fstab = "noreiserfs";


set_kb_item(name: "GSHB/FSTAB/reiserfs", value:fstab);

exit(0);

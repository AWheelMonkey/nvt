###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_nfs_showmount.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Wrapper for Nmap NFS Show Mount NSE script.
#
# Authors:
# NSE-Script: Patrik Karlsson <patrik@cqure.net>
# NASL-Wrapper: Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# NASL-Wrapper: Copyright (c) 2010 Greenbone Networks GmbH (http://www.greenbone.net)
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
  script_oid("1.3.6.1.4.1.25623.1.0.801632");
  script_version("$Revision: 10579 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2010-11-25 08:32:22 +0100 (Thu, 25 Nov 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE: NFS Show Mount");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_tag(name:"summary", value:"This script attempts to show NFS exports.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) nfs-showmount.nse");

  exit(0);
}

if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
  exit(0);
}

res = pread(cmd: "nmap", argv: make_list("nmap", "--script=nfs-showmount.nse", get_host_ip()));
if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:0);
    }
  }

  if("nfs-showmount" >< result) {
    msg = string('Result found by Nmap Security Scanner (nfs-showmount.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:0);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:0);
}

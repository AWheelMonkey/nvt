###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_citrix_enum_apps.nasl 10595 2018-07-24 13:51:36Z cfischer $
#
# Wrapper for Nmap Citrix Enum Apps NSE script.
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
  script_oid("1.3.6.1.4.1.25623.1.0.801819");
  script_version("$Revision: 10595 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-24 15:51:36 +0200 (Tue, 24 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-01-21 13:17:02 +0100 (Fri, 21 Jan 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Nmap NSE: Citrix Enum Apps");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_require_udp_ports(1604);
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_tag(name:"summary", value:"This script attempts to extract a list of published applications
  from the ICA Browser service.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) citrix-enum-apps.nse.");

  exit(0);
}

if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

port = 1604;
if(!get_udp_port_state(port)) exit(0);

res = pread(cmd: "nmap", argv: make_list("nmap", "-sU", "--script=citrix-enum-apps.nse", "-p", port, get_host_ip()));
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
      log_message(data : msg, port:port);
    }
  }

  if("citrix-enum-apps" >< result) {
    msg = string('Result found by Nmap Security Scanner (citrix-enum-apps.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}

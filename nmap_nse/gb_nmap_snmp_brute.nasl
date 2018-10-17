###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_snmp_brute.nasl 10595 2018-07-24 13:51:36Z cfischer $
#
# Wrapper for Nmap SNMP Brute NSE script.
#
# Authors:
# NSE-Script: Philip Pickering
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
  script_oid("1.3.6.1.4.1.25623.1.0.801802");
  script_version("$Revision: 10595 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-24 15:51:36 +0200 (Tue, 24 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-01-20 07:52:11 +0100 (Thu, 20 Jan 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Nmap NSE: SNMP Brute");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_tag(name:"solution_type", value:"Mitigation");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("snmp_detect.nasl", "nmap_nse.nasl");
  script_require_udp_ports("Services/udp/snmp", 161);
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_add_preference(name:"snmplist :", value:"", type:"entry");
  script_add_preference(name:"snmpcommunity :", value:"", type:"entry");

  script_tag(name:"summary", value:"This script attempts to find an SNMP community string by brute force guessing.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) snmp-brute.nse.");

  exit(0);
}

if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

include("snmp_func.inc");

i = 0;
if( pref = script_get_preference("snmplist :")){
  args[i++] = "snmplist=" + pref;
}

if( pref = script_get_preference("snmpcommunity :")){
  args[i++] = "snmpcommunity=" + pref;
}

port = get_snmp_port(default:161);

argv =  make_list("nmap", "-sU", "--script=snmp-brute.nse", "-p", port, get_host_ip());

if(i > 0)
{
  scriptArgs= "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv,scriptArgs);
}

res = pread(cmd: "nmap", argv: argv);
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

  if("snmp-brute" >< result) {
    msg = string('Result found by Nmap Security Scanner (snmp-brute.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}

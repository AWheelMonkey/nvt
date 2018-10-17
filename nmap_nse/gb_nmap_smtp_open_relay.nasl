###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_smtp_open_relay.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Wrapper for Nmap SMTP Open Relay NSE script.
#
# Authors:
# NSE-Script: Arturo 'Buanzo' Busleiman <buanzo@buanzo.com.ar>
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
  script_oid("1.3.6.1.4.1.25623.1.0.801601");
  script_version("$Revision: 10579 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2010-10-08 10:33:58 +0200 (Fri, 08 Oct 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Nmap NSE: SMTP Open Relay");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("find_service_3digits.nasl", "smtpserver_detect.nasl", "nmap_nse.nasl");
  script_require_ports("Services/smtp", 25);
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_add_preference(name:"smtp-open-relay.ip :", value:"", type:"entry");
  script_add_preference(name:"smtp-open-relay.to :", value:"", type:"entry");
  script_add_preference(name:"smtp-open-relay.domain :", value:"", type:"entry");
  script_add_preference(name:"smtp-open-relay.from :", value:"", type:"entry");

  script_tag(name:"summary", value:"This script attempts to check if a SMTP server is vulnerable to mail relaying.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) smtp-open-relay.nse");

  exit(0);
}

if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

include("smtp_func.inc");

i = 0;
if( pref = script_get_preference("smtp-open-relay.ip :")){
  args[i++] = "smtp-open-relay.ip="+pref;
}

if( pref = script_get_preference("smtp-open-relay.to :")){
  args[i++] = "smtp-open-relay.to="+pref;
}

if( pref = script_get_preference("smtp-open-relay.domain :")){
  args[i++] = "smtp-open-relay.domain="+pref;
}

if( pref = script_get_preference("smtp-open-relay.from :")){
  args[i++] = "smtp-open-relay.from="+pref;
}

port = get_smtp_port(default:25);

argv = make_list("nmap", "--script=smtp-open-relay.nse", "-p", port, get_host_ip());

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

  if("smtp-open-relay" >< result) {
    msg = string('Result found by Nmap Security Scanner (smtp-open-relay.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}

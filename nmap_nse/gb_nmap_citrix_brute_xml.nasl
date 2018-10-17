###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_citrix_brute_xml.nasl 10579 2018-07-23 13:27:53Z cfischer $
#
# Wrapper for Nmap Citrix Brute XML NSE script
#
# Authors:
# NSE-Script: Patrik Karlsson <patrik@cqure.net>
# NASL-Wrapper: Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# NSE-Script: Copyright (c) The Nmap Security Scanner (http://nmap.org)
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
  script_oid("1.3.6.1.4.1.25623.1.0.801818");
  script_version("$Revision: 10579 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 15:27:53 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-01-21 13:17:02 +0100 (Fri, 21 Jan 2011)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("Nmap NSE: Citrix Brute XML");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_mandatory_keys("Tools/Launch/nmap_nse", "Tools/Present/nmap");

  script_add_preference(name:"userdb :", value:"", type:"entry");
  script_add_preference(name:"passdb :", value:"", type:"entry");
  script_add_preference(name:"ntdomain :", value:"", type:"entry");
  script_add_preference(name:"unpwdb.passlimit :", value:"", type:"entry");
  script_add_preference(name:"unpwdb.timelimit :", value:"", type:"entry");
  script_add_preference(name:"unpwdb.userlimit :", value:"", type:"entry");
  script_add_preference(name:"http-max-cache-size :", value:"", type:"entry");
  script_add_preference(name:"http.useragent :", value:"", type:"entry");
  script_add_preference(name:"http.pipeline :", value:"", type:"entry");

  script_tag(name:"summary", value:"This script attempts to guess valid credentials for the Citrix PN
  Web Agent XML Service.

  This is a wrapper on the Nmap Security Scanner's (http://nmap.org) citrix-brute-xml.nse.");

  exit(0);
}

include ("http_func.inc");

if((! get_kb_item("Tools/Present/nmap5.21") &&
   ! get_kb_item("Tools/Present/nmap5.51")) ||
   ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

port = get_http_port(default:80);

argv = make_list("nmap","--script=citrix-brute-xml.nse","-p",port,get_host_ip());

i = 0;
if( pref = script_get_preference("userdb :")){
  args[i++] = "userdb="+pref;
}

if( pref = script_get_preference("passdb :")){
  args[i++] = "passdb="+pref;
}

if( pref = script_get_preference("ntdomain :")){
  args[i++] = "ntdomain="+pref;
}

if( pref = script_get_preference("unpwdb.passlimit :")){
  args[i++] = "unpwdb.passlimit="+pref;
}

if( pref = script_get_preference("unpwdb.timelimit :")){
  args[i++] = "unpwdb.timelimit="+pref;
}

if( pref = script_get_preference("unpwdb.userlimit :")){
  args[i++] = "unpwdb.userlimit="+pref;
}

if( pref = script_get_preference("http-max-cache-size :")){
  args[i++] = "http-max-cache-size="+pref;
}

if( pref = script_get_preference("http.useragent :")){
  args[i++] = "http.useragent="+pref;
}

if( pref = script_get_preference("http.pipeline :")){
  args[i++] = "http.pipeline="+pref;
}

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

  if("citrix-brute-xml" >< result) {
    msg = string('Result found by Nmap Security Scanner (citrix-brute-xml.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}

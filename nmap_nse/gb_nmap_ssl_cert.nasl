###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_ssl_cert.nasl 11966 2018-10-18 13:56:21Z cfischer $
#
# Wrapper for Nmap SSL Certificate NSE script
#
# Authors:
# NSE-Script: David Fifield
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
  script_oid("1.3.6.1.4.1.25623.1.0.801665");
  script_version("$Revision: 11966 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 15:56:21 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2010-12-27 14:48:59 +0100 (Mon, 27 Dec 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE: SSL Cert");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "find_service.nasl", "gb_tls_version_get.nasl");
  script_require_ports("Services/www", 443);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_mandatory_keys("Tools/Launch/nmap_nse", "Tools/Present/nmap", "ssl_tls/port");

  script_tag(name:"summary", value:"This script attempts to retrieve a server's SSL certificate.

  This is a wrapper on the Nmap Security Scanner's ssl-cert.nse");

  exit(0);
}

include("http_func.inc");

if((! get_kb_item("Tools/Present/nmap5.21") &&
    ! get_kb_item("Tools/Present/nmap5.51")) ||
    ! get_kb_item("Tools/Launch/nmap_nse")) {
 exit(0);
}

port = get_http_port(default:443);

argv = make_list("nmap", "--script=ssl-cert.nse", "-p", port, get_host_ip());

if(TARGET_IS_IPV6())
  argv = make_list(argv, "-6");

timing_policy = get_kb_item("Tools/nmap/timing_policy");
if(timing_policy =~ '^-T[0-5]$')
  argv = make_list(argv, timing_policy);

source_iface = get_preference("source_iface");
if(source_iface =~ '^[0-9a-zA-Z:_]+$') {
  argv = make_list(argv, "-e");
  argv = make_list(argv, source_iface);
}

res = pread(cmd:"nmap", argv:argv);

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

  if("ssl-cert" >< result) {

    result_lines = split(result,keep:FALSE);
    foreach line (result_lines) {

      if(egrep(pattern:"Issuer:", string:line)) {
        issuer = eregmatch(pattern:"Issuer: (.*)$", string:line);
      }

      if(egrep(pattern:"Subject:", string:line)) {
        subject = eregmatch(pattern:"Subject: (.*)$", string:line);
      }

    }

    if(!isnull(issuer[1]) && !isnull(subject[1])) {
      set_kb_item(name:string("ssl/nmap/",port,"/issuer"),value:issuer[1]);
      set_kb_item(name:string("ssl/nmap/",port,"/subject"),value:subject[1]);
    }

    msg = string('Result found by Nmap Security Scanner (ssl-cert.nse) ',
                'http://nmap.org:\n\n', result);
    log_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n');
  log_message(data : msg, port:port);
}

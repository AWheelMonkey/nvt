###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_pyftpd_multiple_vulnerabilities_96_10.nasl 8269 2018-01-02 07:28:22Z teissa $
#
# pyftpd Multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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
###############################################################################

tag_summary = "pyftpd is prone to multiple vulnerabilities.

1.
pyftpd is prone to multiple default-account vulnerabilities. These
issues stem from a design flaw that makes several accounts available
to remote attackers.

Successful exploits allow remote attackers to gain unauthorized access
to a vulnerable application.

2.
pyftpd creates temporary files in an insecure manner.

An attacker with local access could potentially exploit this issue to
perform symbolic-link attacks, overwriting arbitrary files in the
context of the affected application.

Successfully mounting a symlink attack may allow the attacker to
delete or corrupt sensitive files, which may result in a denial of
service. Other attacks may also be possible.

pyftpd prior to 0.8.5 are affected.";

tag_solution = "Vendor updates are available. Please see the references for more
information.";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100679");
 script_version("$Revision: 8269 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-02 08:28:22 +0100 (Tue, 02 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-06-15 13:44:31 +0200 (Tue, 15 Jun 2010)");
 script_cve_id("CVE-2010-2072", "CVE-2010-2073");
 script_bugtraq_id(40839,40842);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

 script_name("pyftpd Multiple Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/40839");
 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/40842");
 script_xref(name : "URL" , value : "http://comments.gmane.org/gmane.comp.security.oss.general/3038");
 script_xref(name : "URL" , value : "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=585776");
 script_xref(name : "URL" , value : "http://freshmeat.net/projects/pyftpd/");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("FTP");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl","secpod_ftp_anonymous.nasl","ftpserver_detect_type_nd_version.nasl");
 script_require_ports("Services/ftp", 21);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("ftp_func.inc");

ftpPort = get_kb_item("Services/ftp");
if(!ftpPort){
  ftpPort = 2121;
}

if(get_kb_item('ftp/'+ftpPort+'/broken'))exit(0);

if(!get_port_state(ftpPort)){
  exit(0);
}

domain = get_kb_item("Settings/third_party_domain");
if(isnull(domain)) {
 domain = this_host_name();;
}    

users = files = make_list("test","user","huddel");
success = 0;
failed = 0;

foreach user (users) {

  soc1 = open_sock_tcp(ftpPort);
  if(!soc1){
      exit(0);
  }

  login_details = ftp_log_in(socket:soc1, user:user, pass:user);

  if(login_details)
  {
    success++;
    ftp_close(socket:soc1);
  } else {
    failed++;
    ftp_close(socket:soc1);
  }  
}

if(success == 2 && failed == 1) {
  security_message(port:ftpPort);
  exit(0);
}  


exit(0); 

     

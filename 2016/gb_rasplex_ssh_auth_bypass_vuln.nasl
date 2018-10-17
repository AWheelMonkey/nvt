###############################################################################
# $Id: gb_rasplex_ssh_auth_bypass_vuln.nasl 11772 2018-10-08 07:20:02Z asteins $
#
# Rasplex Authentication Bypass Vulnerability
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807609");
  script_version("$Revision: 11772 $");
  script_cve_id("CVE-2016-2230");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-08 09:20:02 +0200 (Mon, 08 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-03-11 15:05:52 +0530 (Fri, 11 Mar 2016)");
  script_tag(name:"qod_type", value:"remote_vul");
  script_name("Rasplex Authentication Bypass Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Rasplex device and
  is prone authentication bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Check if it is possible to login into
  the remote Rasplex device.");

  script_tag(name:"insight", value:"The flaw is due to

  - The 'root' account has a password of 'rasplex', which is
    publicly known and documented.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to gain unauthorized root access to affected devices and completely
  compromise the devices..");

  script_tag(name:"affected", value:"Rasplex Devices.");

  script_tag(name:"solution", value:"Information is available about a
  configuration or deployment scenario that helps to reduce the risk of the
  vulnerability.
  For updates refer to http://openelec.tv");

  script_tag(name:"solution_type", value:"Mitigation");

  script_xref(name:"URL", value:"http://www.kb.cert.org/vuls/id/544527");
  script_xref(name:"URL", value:"https://github.com/RasPlex/RasPlex/issues/453");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Default Accounts");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/ssh", 22);
  exit(0);
}


include("ssh_func.inc");

ras_port = get_kb_item("Services/ssh");
if(!ras_port){
  exit(0);
}

if(!get_port_state(ras_port)){
  exit(0);
}

if(!soc = open_sock_tcp(ras_port)){
  exit(0);
}

login = ssh_login (socket:soc, login:'root', password:'rasplex', pub:NULL, priv:NULL, passphrase:NULL);
if(login == 0)
{
  cmd = ssh_cmd(socket:soc, cmd:"id");
  if(ereg(pattern:"uid=[0-9]+.*gid=[0-9]+", string:cmd))
  {
    security_message(port:ras_port);
    close(soc);
    exit(0);
  }
}

close(soc);

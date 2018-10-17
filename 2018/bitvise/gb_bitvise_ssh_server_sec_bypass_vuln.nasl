################################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bitvise_ssh_server_sec_bypass_vuln.nasl 10182 2018-06-14 07:00:55Z santu $
#
# Bitvise SSH Server Security Bypass Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
################################################################################

CPE = "cpe:/a:bitvise:winsshd";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813387");
  script_version("$Revision: 10182 $");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-14 09:00:55 +0200 (Thu, 14 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-04 13:54:02 +0530 (Mon, 04 Jun 2018)");
  script_name("Bitvise SSH Server Security Bypass Vulnerability");

  script_tag(name:"summary", value:"This host is running Bitvise SSH Server
  Suite and is prone to a security bypass vulnerability.");
  
  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of the detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an incorrect delayed 
  initialization in a compression library used by Bitvise software.");

  script_tag(name: "impact" , value:"Successful exploitation will allow an
  attacker to corrupt decompressed data in SSH session and bypass security
  restrictions.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Bitvise SSH Server before 7.41");

  script_tag(name: "solution" , value: "Upgrade to version 7.41 or later. 
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value :"https://www.bitvise.com/flowssh-version-history#security-notification-741");
  script_xref(name : "URL" , value :"https://www.bitvise.com");

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_bitvise_ssh_server_detect.nasl");
  script_mandatory_keys("BitviseSSH/Server/Version");
  script_require_ports("Services/ssh", 22);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sshport = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:sshport, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"7.41"))
{
  report = report_fixed_ver(installed_version:vers, fixed_version:"7.41", install_path:path);
  security_message(data:report, port:sshport);
  exit(0);
}
exit(0);

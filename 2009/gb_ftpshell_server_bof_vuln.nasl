###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ftpshell_server_bof_vuln.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# FTPShell Server Buffer Overflow Vulnerability
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800226");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-02-06 13:48:17 +0100 (Fri, 06 Feb 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0349");
  script_bugtraq_id(33403);
  script_name("FTPShell Server Buffer Overflow Vulnerability");
  script_xref(name:"URL", value:"http://secunia.com/advisories/33597");
  script_xref(name:"URL", value:"http://www.milw0rm.com/exploits/7852");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("find_service.nasl", "gb_ftpshell_server_detect.nasl");
  script_mandatory_keys("FTPShell/Version");
  script_require_ports("Services/ftp", 21);
  script_tag(name:"impact", value:"Successful exploitation will let the attacker craft a malicious license
  registry key file and can cause arbitrary code execution by tricking user
  to install the crafted malicious license registry file and may cause
  denial-of-service to the application.");
  script_tag(name:"affected", value:"FTPShell Server version 4.3.0 or prior on Windows.");
  script_tag(name:"insight", value:"This flaw is due to a boundary error in the FTPShell server application
  when processing certain Windows registry keys.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");
  script_tag(name:"summary", value:"This host is running FTPshell Server and is prone to Buffer
  Overflow Vulnerability.");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("version_func.inc");

ftpPort = get_kb_item("Services/ftp");
if(!ftpPort){
  ftpPort = 21;
}

ftpShellVer = get_kb_item("FTPShell/Version");
if(!ftpShellVer){
  exit(0);
}

if(version_is_less_equal(version:ftpShellVer, test_version:"4.3.0")){
  security_message(ftpPort);
}

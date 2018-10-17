###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_robo_ftp_client_bof_vuln.nasl 9350 2018-04-06 07:03:33Z cfischer $
#
# Robo-FTP Response Processing Buffer Overflow Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

tag_impact = "Successful exploitation will let the user execute arbitrary code
in the context of the vulnerable application. Failed exploit attempts will
likely result in a denial-of-service condition.";

tag_affected = "Robo-FTP Client version 3.6.17 and prior.";

tag_insight = "The flaw is due to a boundary error when processing certain
responses from the FTP server. This can be exploited to overflow a global buffer
by tricking a user into connecting to a malicious FTP server.";

tag_solution = "Upgrade to version 3.7.0 or later,
For updates refer to http://www.robo-ftp.com/download";

tag_summary = "This host has installed Robo-FTP and is prone to  Buffer Overflow
Vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801054");
  script_version("$Revision: 9350 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:03:33 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-02 13:54:57 +0100 (Wed, 02 Dec 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_bugtraq_id(37143);
  script_cve_id("CVE-2009-4103");
  script_name("Robo-FTP Response Processing Buffer Overflow Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/37452");
  script_xref(name : "URL" , value : "http://en.securitylab.ru/nvd/388275.php");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C)Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_robo_ftp_client_detect.nasl");
  script_mandatory_keys("Robo/FTP/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

roboftpVer = get_kb_item("Robo/FTP/Ver");
if(roboftpVer != NULL)
{
  # Robo-FTP 3.6.17 (3.6.17.13)
  if(version_is_less_equal(version:roboftpVer, test_version:"3.6.17.13")){
   security_message(0);
  }
}


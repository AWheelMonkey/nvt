###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_server_webaccess_mult_vuln_lin.nasl 8510 2018-01-24 07:57:42Z teissa $
#
# VMware WebAccess Multiple Vulnerabilities (Linux)
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

tag_solution = "Apply workaround,
  http://www.vmware.com/resources/techresources/726

  *****
  NOTE: Ignore this warning, if above mentioned workaround is manually applied.
  *****";

tag_impact = "Successful exploitation will let attackers to spoof the origin of requests
  via unspecified vectors and execution of JavaScript.
  Impact Level: Application";
tag_affected = "VMware Server version 2.0 on Linux.";
tag_insight = "The flaws are due to:
  - An error in handling of 'proxy-server' functionality, allows to leverage
    proxy-server functionality to spoof the origin of requests via unspecified
    vectors.
  - An insufficient checking on the 'names' of virtual machines, allows for
    execution of JavaScript in the Web browser's security context for WebAccess.";
tag_summary = "This host is installed with VMWare Server and is prone to
  multiple Vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801309");
  script_version("$Revision: 8510 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-24 08:57:42 +0100 (Wed, 24 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-04-13 16:55:19 +0200 (Tue, 13 Apr 2010)");
  script_cve_id("CVE-2010-0686", "CVE-2010-1193");
  script_bugtraq_id(39037, 39105);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("VMware WebAccess Multiple Vulnerabilities (Linux)");

  script_xref(name : "URL" , value : "http://www.vmware.com/security/advisories/VMSA-2010-0005.html");
  script_xref(name : "URL" , value : "http://lists.vmware.com/pipermail/security-announce/2010/000086.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_vmware_prdts_detect_lin.nasl");
  script_mandatory_keys("VMware/Server/Linux/Ver", "VMware/Linux/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

if(!get_kb_item("VMware/Linux/Installed")){
  exit(0);
}

# VMware Server
vmserVer = get_kb_item("VMware/Server/Linux/Ver");
if(vmserVer)
{
  if(version_is_equal(version:vmserVer, test_version:"2.0")){
    security_message(0);
  }
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_ovm_tools_file_corruption_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# VMware Open Virtual Machine Tools File Corruption Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allows local users to trigger
corruption of this file via a process with a small RLIMIT_FSIZE value.";

tag_affected = "VMware Open Virtual Machine Tools version 8.4.2-261024 and
prior.";

tag_insight = "The flaw is due to an error in 'vmware-hgfsmounter', which
attempts to append to the '/etc/mtab' file without first checking whether
resource limits would interfere.";

tag_solution = "Upgrade to version 2011.05.27 or later,
For updates refer to http://sourceforge.net/projects/open-vm-tools/files/open-vm-tools";

tag_summary = "This host is installed with VMware Open Virtual Machine Tools
and is prone to file corruption vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801917");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-04-13 15:50:09 +0200 (Wed, 13 Apr 2011)");
  script_cve_id("CVE-2011-1681");
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:N");
  script_name("VMware Open Virtual Machine Tools File Corruption Vulnerability");
  script_xref(name : "URL" , value : "http://openwall.com/lists/oss-security/2011/03/31/4");
  script_xref(name : "URL" , value : "http://openwall.com/lists/oss-security/2011/03/22/6");
  script_xref(name : "URL" , value : "http://openwall.com/lists/oss-security/2011/03/05/7");
  script_xref(name : "URL" , value : "http://openwall.com/lists/oss-security/2011/03/04/10");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_vmware_ovm_tools_detect_lin.nasl");
  script_mandatory_keys("VMware/OVM/Tools/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("version_func.inc");

## Get the version from kb
vmVer = get_kb_item("VMware/OVM/Tools/Ver");
if(!vmVer){
  exit(0);
}

## match the version without build
version = eregmatch(pattern:"([0-9]+\.[0-9]+\.[0-9]+)", string:vmVer);
if(version[1])
{
  ## Get the build version
  buildVer = eregmatch(pattern:"build ([0-9]+)", string:vmVer);
  if(buildVer[1]){
    ver = version[1] +"." + buildVer[1];
  }
  else {
    ver = version[1];
  }

  ## Check the version is less or equal to 8.4.2.261024
  if(version_is_less_equal(version:ver, test_version:"8.4.2.261024")){
    security_message(0);
  }
}

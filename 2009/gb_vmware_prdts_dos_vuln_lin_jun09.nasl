###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_prdts_dos_vuln_lin_jun09.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# VMware Products Descheduled Time Accounting Driver DoS Vulnerability (Linux)
#
# Authors:
# Sharath S <sharaths@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.800806");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-06-09 08:37:33 +0200 (Tue, 09 Jun 2009)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:N/I:N/A:C");
  script_cve_id("CVE-2009-1805");
  script_bugtraq_id(35141);
  script_name("VMware Products Descheduled Time Accounting Driver DoS Vulnerability (Linux)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/35269");
  script_xref(name:"URL", value:"http://securitytracker.com/alerts/2009/May/1022300.html");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/archive/1/503912/100/0/threaded");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("gb_vmware_prdts_detect_lin.nasl");
  script_mandatory_keys("VMware/Linux/Installed");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to cause denial of
  service to local users.");
  script_tag(name:"affected", value:"VMware Server version prior to 2.0.1 build 156745,
  VMware Server version prior to 1.0.9 build 156507,
  VMware Player version prior to 2.5.2 build 156735,
  VMware Workstation version prior to 6.5.2 build 156735 on Windows.");
  script_tag(name:"insight", value:"The vulnerability is due to an unspecified error within the VMware
  Descheduled Time Accounting driver.");
  script_tag(name:"solution", value:"Upgrade your VMWares according to the below link,
  http://www.vmware.com/security/advisories/VMSA-2009-0007.html");
  script_tag(name:"summary", value:"The host is installed with VMWare product(s) and is prone to
  Denial of Service vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

if(!get_kb_item("VMware/Linux/Installed")){
  exit(0);
}

# VMware Player
vmplayerVer = get_kb_item("VMware/Player/Linux/Ver");
if(vmplayerVer != NULL)
{
  if(version_is_less(version:vmplayerVer, test_version:"2.5.2"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

# VMware Workstation
vmworkstnVer = get_kb_item("VMware/Workstation/Linux/Ver");
if(vmworkstnVer != NULL)
{
  if(version_is_less(version:vmworkstnVer, test_version:"6.5.2"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

vmserverVer = get_kb_item("VMware/Server/Linux/Ver");
if(vmserverVer != NULL)
{
  if(version_in_range(version:vmserverVer, test_version:"1.0", test_version2:"1.0.8") ||
     version_in_range(version:vmserverVer, test_version:"2.0", test_version2:"2.0.0")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}

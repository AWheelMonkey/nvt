###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_reflection_secureit_unix_mult_vuln_lin.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Reflection for Secure IT Multiple Vulnerabilities (Linux)
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
  script_oid("1.3.6.1.4.1.25623.1.0.800228");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-02-06 13:48:17 +0100 (Fri, 06 Feb 2009)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2008-6021");
  script_bugtraq_id(30723);
  script_name("Reflection for Secure IT Multiple Vulnerabilities (Linux)");
  script_xref(name:"URL", value:"http://support.attachmate.com/techdocs/2288.html");
  script_xref(name:"URL", value:"http://support.attachmate.com/techdocs/2374.html#Security_Updates_in_7.0_SP1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_reflection_secureit_unix_detect_lin.nasl");
  script_mandatory_keys("Reflection/SecureIT/Linux/Ver");
  script_require_ports("Services/ssh", 22);
  script_tag(name:"affected", value:"Reflections for Secure IT version prior to 7.0 SP1 on Linux.");
  script_tag(name:"insight", value:"Unknown Vector.");
  script_tag(name:"solution", value:"Apply the security update SP1.
  http://www.attachmate.com/Evals/Evaluate.htm");
  script_tag(name:"summary", value:"This host is installed with Reflections for Secure IT and is prone
  to Multiple vulnerabilities.");
  script_tag(name:"impact", value:"Attacker can get admin privileges.");
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

sshPort = get_kb_item("Services/ssh");
if(!sshPort){
  sshPort = 22;
}

secureItVer = get_kb_item("Reflection/SecureIT/Linux/Ver");
if(!secureItVer){
  exit(0);
}

if(version_is_less(version:secureItVer, test_version:"7.0.1.575")){
  security_message(sshPort);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ibm_db2_mult_dos_vuln_lin01.nasl 9992 2018-05-29 05:51:26Z cfischer $
#
# IBM DB2 Multiple Vulnerabilities (Linux)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated KB Name
# Antu Sanadi <santu@secpod.com> on 2009-12-21
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.900678");
  script_version("$Revision: 9992 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-29 07:51:26 +0200 (Tue, 29 May 2018) $");
  script_tag(name:"creation_date", value:"2009-06-30 16:55:49 +0200 (Tue, 30 Jun 2009)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2009-1905","CVE-2009-1906");
  script_bugtraq_id(35171);
  script_name("IBM DB2 Multiple Vulnerabilities (Linux)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/35235");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/50909");
  script_xref(name : "URL" , value : "http://www-01.ibm.com/support/docview.wss?uid=swg1IZ38874");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Databases");
  script_dependencies("secpod_ibm_db2_detect_linux_900217.nasl");
  script_mandatory_keys("Linux/IBM_db2/Ver");
  script_tag(name : "impact" , value : "Successful exploitation will let the attacker bypass security restrictions,
  cause a denial of service or gain elevated privileges.

  Impact Level: System/Application");
  script_tag(name : "affected" , value : "IBM DB2 version 8 prior to Fixpak 17

  IBM DB2 version 9.1 prior to Fixpak 7

  IBM DB2 version 9.5 prior to Fixpak 4");
  script_tag(name : "insight" , value : "- An error in DRDA Services component can be exploited via an IPv6 address
    in the correlation token in the APPID string.

  - An unspecified error can be exploited to connect to DB2 databases without
    a valid password if ldap-based authentication is used and the LDAP server
    allows anonymous binds.");
  script_tag(name : "solution" , value : "Update DB2 8 Fixpak 17 or 9.1 Fixpak 7 or 9.5 Fixpak 4 or later.

  http://www-01.ibm.com/support/docview.wss?rs=0&uid=swg24022678");
  script_tag(name : "summary" , value : "The host is installed with IBM DB2 and is prone to multiple
  vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");

ibmVer = get_kb_item("Linux/IBM_db2/Ver");
if(!ibmVer){
  exit(0);
}

# IBM DB2 9.1 FP6a => 9.1.0.6a
# IBM DB2 9.5 FP3b => 9.5.0.3b

if(version_in_range(version:ibmVer, test_version:"8.0", test_version2:"8.1.16") ||
   version_in_range(version:ibmVer, test_version:"9.1", test_version2:"9.1.0.6a") ||
   version_in_range(version:ibmVer, test_version:"9.5", test_version2:"9.5.0.3b")){
  security_message(port:0);
}

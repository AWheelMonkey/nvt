###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_security_essentials_mal_prot_eng_rce_vuln.nasl 10967 2018-08-15 05:53:29Z cfischer $
#
# Microsoft Malware Protection Engine on Security Essentials Multiple Remote Code Execution Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.812239");
  script_version("$Revision: 10967 $");
  script_cve_id("CVE-2017-11937", "CVE-2017-11940");
  script_bugtraq_id(102070, 102104);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 07:53:29 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2017-12-08 11:55:19 +0530 (Fri, 08 Dec 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Malware Protection Engine on Security Essentials Multiple Remote Code Execution Vulnerabilities");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Security Updates released for Microsoft Malware
  Protection Engine dated 12/06/2017");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws exists when the Microsoft
  Malware Protection Engine does not properly scan a specially crafted file,
  leading to memory corruption.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to execute arbitrary code in the security context of the LocalSystem account
  and take control of the system. An attacker could then:

  - install programs

  - view, change, or delete data

  - create new accounts with full user rights.

  Impact Level: System");

  script_tag(name:"affected", value:"Microsoft Security Essentials");

  script_tag(name:"solution", value:"Run Windows update and update the malware
  protection engine to the latest version available. Typically, no action is
  required as the built-in mechanism for the automatic detection and deployment
  of updates will apply the update itself.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-11937");
  script_xref(name:"URL", value:"https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-11940");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows");
  script_dependencies("smb_reg_service_pack.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

key = "SOFTWARE\Microsoft\Microsoft Antimalware";
if(!registry_key_exists(key:key)){
  exit(0);
}

def_version = registry_get_sz(key:"SOFTWARE\Microsoft\Microsoft Antimalware\Signature Updates",
                              item:"EngineVersion");
if(!def_version){
  exit(0);
}

##Last version of the Microsoft Malware Protection Engine affected by this vulnerability Version 1.1.14306.0
##First version of the Microsoft Malware Protection Engine with this vulnerability addressed 1.1.14405.2
if(version_is_less(version:def_version, test_version:"1.1.14405.2"))
{
  report = report_fixed_ver(installed_version: def_version, fixed_version: "1.1.14405.2");
  security_message(data:report);
  exit(0);
}
exit(0);
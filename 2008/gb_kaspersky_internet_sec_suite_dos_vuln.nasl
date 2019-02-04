###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_kaspersky_internet_sec_suite_dos_vuln.nasl 12602 2018-11-30 14:36:58Z cfischer $
#
# Kaspersky Internet Security Suite Malformed MIME Message DoS Vulnerability
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800086");
  script_version("$Revision: 12602 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-30 15:36:58 +0100 (Fri, 30 Nov 2018) $");
  script_tag(name:"creation_date", value:"2008-12-18 14:07:48 +0100 (Thu, 18 Dec 2008)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2008-5426");
  script_name("Kaspersky Internet Security Suite Malformed MIME Message DoS Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);

  script_tag(name:"impact", value:"Successful exploitation could result in application crash.");

  script_tag(name:"affected", value:"Kaspersky Internet Security Suite 2009 on Windows.");

  script_tag(name:"insight", value:"Flaw is due to improper handling of multipart/mixed e-mail messages
  with many MIME parts and e-mail messages with many Content-type: message/rfc822 headers.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"solution", value:"Upgrade to latest version of Kaspersky Internet Security Suite.");

  script_tag(name:"summary", value:"This host has Kaspersky Internet Security Suite installed and is
  prone to denial of service vulnerability.");

  exit(0);
}

include("smb_nt.inc");
include("secpod_smb_func.inc");

if(!(get_kb_item("SMB/WindowsVersion"))){
  exit(0);
}

uninstall = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";

if(!registry_key_exists(key:uninstall)){
    exit(0);
}

foreach key (registry_enum_keys(key:uninstall))
{
  kisName = registry_get_sz(key:uninstall + key, item:"DisplayName");
  if("Kaspersky Internet Security" >< kisName)
  {
    # Kaspersky Internet Security 2009
    if("Kaspersky Internet Security 2009" >< kisName){
      security_message( port: 0, data: "The target host was found to be vulnerable" );
    }
    exit(0);
  }
}

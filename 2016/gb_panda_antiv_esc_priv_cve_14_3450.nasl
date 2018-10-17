###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_panda_antiv_esc_priv_cve_14_3450.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# Privilege Escalation in Panda Antivirus Pro 2014 CVE-2014-3450 (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:pandasecurity:panda_av_pro_2014";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107089");
  script_version("$Revision: 11516 $");
  script_cve_id("CVE-2014-3450");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-11-21 09:18:47 +0100 (Mon, 21 Nov 2016)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Privilege Escalation in Panda Antivirus Pro 2014 CVE-2014-3450 (Windows)");
  script_xref(name:"URL", value:"http://www.anti-reversing.com/cve-2014-3450-privilege-escalation-in-panda-security/");
  script_xref(name:"URL", value:"https://www.portcullis-security.com/security-research-and-downloads/security-advisories/cve-2014-3450/");
  script_tag(name:"qod", value:"30");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Privilege escalation");
  script_dependencies("gb_panda_prdts_detect.nasl");
  script_mandatory_keys("Panda/Antivirus/Ver");
  script_tag(name:"affected", value:"Panda Antivirus Pro 2014 v13.01.01");
  script_tag(name:"insight", value:"As the USERS group has write permissions over the folder where the PSEvents.exe
process is located, it is possible to execute malicious code as Local System.");
  script_tag(name:"solution", value:"Install Panda Hotfix for this vulnerability, see the vendor advisory.");
  script_tag(name:"summary", value:"This host is running Panda Products and is prone to a Privilege
Escalation Vulnerability.");
  script_tag(name:"impact", value:"This vulnerability allows for privilege escalation on the local system..");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers  = infos['version'];
path  = infos['location'];

if( version_is_equal( version:vers, test_version:"13.01.01" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"See references", install_path:path );
  security_message( data:report );
  exit( 0 );
}

exit( 99 );

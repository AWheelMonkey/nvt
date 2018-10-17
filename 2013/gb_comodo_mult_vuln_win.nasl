###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_comodo_mult_vuln_win.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Comodo Internet Security Multiple Vulnerabilities
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803693");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2011-5121", "CVE-2011-5122", "CVE-2011-5123");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-07-05 16:49:06 +0530 (Fri, 05 Jul 2013)");
  script_name("Comodo Internet Security Multiple Vulnerabilities");
  script_xref(name:"URL", value:"http://personalfirewall.comodo.com/release_notes.html");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_comodo_internet_security_detect_win.nasl");
  script_mandatory_keys("Comodo/InternetSecurity/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation allow attackers to execute arbitrary code or cause
  denial of service condition.");
  script_tag(name:"affected", value:"Comodo Internet Security versions before 5.3.175888.1227");
  script_tag(name:"insight", value:"Multiple flaws due to error in antivirus component,

  - Triggered when a user opens a malformed compressed file.

  - Does not validate if X.509 certificate in the signed binaries have been
    revoked.");
  script_tag(name:"solution", value:"Upgrade to Comodo Internet Security version 5.3.175888.1227 or later.");
  script_tag(name:"summary", value:"The host is installed with Comodo Internet Security and is prone
  to multiple vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

Ver = get_kb_item("Comodo/InternetSecurity/Win/Ver");

if(Ver)
{
  if(version_is_less(version:Ver, test_version:"5.3.175888.1227")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}

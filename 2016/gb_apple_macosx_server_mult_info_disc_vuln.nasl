###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_server_mult_info_disc_vuln.nasl 12391 2018-11-16 16:12:15Z cfischer $
#
# Apple OS X Server Information Disclosure And Security Bypass Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/o:apple:os_x_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810233");
  script_version("$Revision: 12391 $");
  script_cve_id("CVE-2014-3566", "CVE-2015-1150", "CVE-2015-1151");
  script_bugtraq_id(70574, 74356, 74355);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 17:12:15 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-12-05 14:52:33 +0530 (Mon, 05 Dec 2016)");
  script_name("Apple OS X Server Information Disclosure And Security Bypass Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with Apple OS X Server
  and is prone to information disclosure and security bypass vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - The SSL protocol 3.0 uses nondeterministic CBC padding.

  - The Firewall component uses an incorrect pathname in configuration files.

  - The access controls for the Activity and People wiki pages were not enforced
    on iPad clients");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to obtain sensitive information and to bypass security restrictions.");

  script_tag(name:"affected", value:"Apple OS X Server before 4.1");

  script_tag(name:"solution", value:"Upgrade to Apple OS X Server 4.1 or
  later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.apple.com/en-us/HT204201");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_apple_macosx_server_detect.nasl");
  script_mandatory_keys("Apple/OSX/Server/Version");
  script_xref(name:"URL", value:"http://www.apple.com");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!serVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:serVer, test_version:"4.1"))
{
  report = report_fixed_ver(installed_version:serVer, fixed_version:"4.1");
  security_message(data:report);
  exit(0);
}

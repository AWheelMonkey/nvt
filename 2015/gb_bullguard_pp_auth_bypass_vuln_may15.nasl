###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bullguard_pp_auth_bypass_vuln_may15.nasl 11424 2018-09-17 08:03:52Z mmartin $
#
# BullGuard Premium Protection Authentication Bypass Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:bullguard:premium_protection";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805624");
  script_version("$Revision: 11424 $");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-17 10:03:52 +0200 (Mon, 17 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-05-20 12:26:57 +0530 (Wed, 20 May 2015)");
  script_name("BullGuard Premium Protection Authentication Bypass Vulnerability");

  script_tag(name:"summary", value:"This host is installed with BullGuard
  Premium Protection and is prone to authentication bypass vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to poor password-based
  authentication of the implemented password protection.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  attacker to bypass implemented password protection mechanism in the applications
  management console.");

  script_tag(name:"affected", value:"BullGuard Premium Protection version
  15.0.297");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure of this vulnerability.
Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://packetstormsecurity.com/files/131810");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_bullguard_premium_protection_detect.nasl");
  script_mandatory_keys("BullGuard/Premium/Protection/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!bullVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_equal(version:bullVer, test_version:"15.0.297"))
{
  report = 'Installed version: ' + bullVer + '\n' +
           'Fixed version:     ' + 'WillNotFix' + '\n';
  security_message(data:report);
  exit(0);
}

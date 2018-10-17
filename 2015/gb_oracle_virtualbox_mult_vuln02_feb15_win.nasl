###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_mult_vuln02_feb15_win.nasl 11872 2018-10-12 11:22:41Z cfischer $
#
# Oracle Virtualbox Multiple Vulnerabilities - Feb15 (Windows)
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

CPE = "cpe:/a:oracle:vm_virtualbox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805431");
  script_version("$Revision: 11872 $");
  script_cve_id("CVE-2015-0427", "CVE-2014-6595", "CVE-2014-6590", "CVE-2014-6589",
                "CVE-2014-6588");
  script_bugtraq_id(72216, 72206, 72213, 72202, 72196);
  script_tag(name:"cvss_base", value:"3.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:N/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 13:22:41 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2015-02-02 10:11:39 +0530 (Mon, 02 Feb 2015)");
  script_name("Oracle Virtualbox Multiple Vulnerabilities - Feb15 (Windows)");

  script_tag(name:"summary", value:"The host is installed with Oracle VM
  virtualBox and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  unspecified vulnerabilities.");

  script_tag(name:"impact", value:"Successful exploitation will allow local
  users to affect integrity and availability.");

  script_tag(name:"affected", value:"VirtualBox versions 4.3.x before 4.3.20
  on Windows.");

  script_tag(name:"solution", value:"Upgrade to Oracle VirtualBox version
  4.3.20 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://www.virtualbox.org");
  script_xref(name:"URL", value:"http://www.scip.ch/en/?vuldb.68800");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_family("General");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_mandatory_keys("Oracle/VirtualBox/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!virtualVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(virtualVer =~ "^(4\.3)")
{
  if(version_is_less(version:virtualVer, test_version:"4.3.20"))
  {
    report = 'Installed version: ' + virtualVer + '\n' +
             'Fixed version:     ' + "4.3.20"  + '\n';
    security_message(data:report );
    exit(0);
  }
}

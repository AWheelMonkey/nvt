###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cybozu_garoon_dos_vuln.nasl 11863 2018-10-12 09:42:02Z mmartin $
#
# Cybozu Garoon Denial of Service Vulnerability
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

CPE = 'cpe:/a:cybozu:garoon';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811591");
  script_version("$Revision: 11863 $");
  script_cve_id("CVE-2017-2254");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 11:42:02 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-09-01 11:50:27 +0530 (Fri, 01 Sep 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Cybozu Garoon Denial of Service Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Cybozu Garoon
  and is prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation
  of user supplied input in the application menu's edit function.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct a denial-of-service attack.");

  script_tag(name:"affected", value:"Cybozu Garoon 3.5.0 to 4.2.5");

  script_tag(name:"solution", value:"Update to the Cybozu Garoon version 4.2.6
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://jvn.jp/en/jp/JVN63564682/index.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_cybozu_products_detect.nasl");
  script_mandatory_keys("CybozuGaroon/Installed");
  script_xref(name:"URL", value:"https://cs.cybozu.co.jp/2017/006442.html");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!cyPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!cyVer = get_app_version(cpe:CPE, port:cyPort)){
  exit(0);
}

if(version_in_range(version:cyVer, test_version:"3.5.0", test_version2:"4.2.5"))
{
  report = report_fixed_ver(installed_version:cyVer, fixed_version:"4.2.6 or later");
  security_message(data:report, port:cyPort);
  exit(0);
}
exit(0);

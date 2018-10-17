###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_spip_rac_parameter_xss_vuln.nasl 11523 2018-09-21 13:37:35Z asteins $
#
# SPIP 'rac' Parameter Cross-Site Scripting Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:spip:spip";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809745");
  script_version("$Revision: 11523 $");
  script_cve_id("CVE-2016-9152");
  script_bugtraq_id(94658);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 15:37:35 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-12-08 18:16:57 +0530 (Thu, 08 Dec 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("SPIP 'rac' Parameter Cross-Site Scripting Vulnerability");

  script_tag(name:"summary", value:"This host is installed with SPIP
  and is prone to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an insufficient
  validation of input passed via 'rac' parameter to 'ecrire/exec/plonger.php'
  script.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary script code in a user's browser session within
  the trust relationship between their browser and the server.");

  script_tag(name:"affected", value:"SPIP version 3.1.3");

  script_tag(name: "solution", value:"A solution was patched in Revision 23290. For updates refer to http://www.spip.net");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://core.spip.net/projects/spip/repository/revisions/23290");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_spip_detect.nasl");
  script_mandatory_keys("spip/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!sp_port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!sp_Ver = get_app_version(cpe:CPE, port:sp_port)){
  exit(0);
}

if(version_is_equal(version:sp_Ver, test_version:"3.1.3"))
{
  report = report_fixed_ver(installed_version:sp_Ver, fixed_version:"See Vendor");
  security_message(port:sp_port, data:report);
  exit(0);
}

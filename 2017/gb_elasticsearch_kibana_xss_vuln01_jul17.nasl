###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_kibana_xss_vuln01_jul17.nasl 11816 2018-10-10 10:42:56Z mmartin $
#
# Elasticsearch Kibana Cross Site Scripting Vulnerability01 - Jul17
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:elasticsearch:kibana";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811417");
  script_version("$Revision: 11816 $");
  script_cve_id("CVE-2015-9056");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-10 12:42:56 +0200 (Wed, 10 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-07-03 20:28:56 +0530 (Mon, 03 Jul 2017)");
  script_name("Elasticsearch Kibana Cross Site Scripting Vulnerability01 - Jul17");

  script_tag(name:"summary", value:"This host is running Elasticsearch Kibana
  and is prone to cross site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation
  of user's input.");

  script_tag(name:"impact", value:"Successful exploitation will lead an attacker to
  execute arbitrary JavaScript in users' browsers.");

  script_tag(name:"affected", value:"Elasticsearch Kibana version prior to 4.1.3
  and 4.2.1.");

  script_tag(name:"solution", value:"Upgrade to Elasticsearch Kibana version
  4.1.3 or 4.2.1 or later. ");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"https://www.elastic.co/community/security");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_elasticsearch_kibana_detect.nasl");
  script_mandatory_keys("Elasticsearch/Kibana/Installed");
  script_require_ports("Services/www", 5601);
  script_xref(name:"URL", value:"https://www.elastic.co");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!kibanaPort = get_app_port(cpe:CPE)){
 exit(0);
}

if(!kibanaVer = get_app_version(cpe:CPE, port:kibanaPort)){
 exit(0);
}

if(version_is_less(version:kibanaVer, test_version:"4.1.3")){
    fix = "4.1.3";
}
else if(kibanaVer =~ "(^4\.2)")
{
  if(version_is_less(version:kibanaVer, test_version:"4.2.1")){
    fix = "4.2.1";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:kibanaVer, fixed_version:fix);
  security_message(data:report, port:kibanaPort);
  exit(0);
}
exit(0);

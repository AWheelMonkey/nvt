###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_solr_xxe_vuln_aug18.nasl 11388 2018-09-14 13:45:12Z cfischer $
#
# Apache Solr XML External Entity Multiple Information Disclosure Vulnerabilities
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
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

CPE = "cpe:/a:apache:solr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813555");
  script_version("$Revision: 11388 $");
  script_cve_id("CVE-2018-8026");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-09-14 15:45:12 +0200 (Fri, 14 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-02 13:16:18 +0530 (Thu, 02 Aug 2018)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Apache Solr XML External Entity Multiple Information Disclosure Vulnerabilities");

  script_tag(name:"summary", value:"This host is installed with Apache Solr and
  is prone to XML External Entity multiple information disclosure
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws are due to improper
  sanitization of user input in currency.xml, enumsConfig.xml referred from
  schema.xml, TIKA parsecontext configuration files.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to gain access to sensitive information that may lead to further attacks.

  Impact Level: Application");

  script_tag(name:"affected", value:"Apache Solr versions from 6.0.0 to 6.6.4
  and 7.0.0 to 7.3.1");

  script_tag(name:"solution", value:"Upgrade to Apache Solr version 6.6.5 or
  7.4.0 or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"https://mail-archives.apache.org/mod_mbox/lucene-solr-user/201807.mbox/%3C0cdc01d413b7%24f97ba580%24ec72f080%24%40apache.org%3E");
  script_xref(name:"URL", value:"http://lucene.apache.org/solr");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_apache_solr_detect.nasl");
  script_mandatory_keys("Apache/Solr/Installed");
  script_require_ports("Services/www", 8983);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!solrPort = get_app_port(cpe:CPE)){
  exit(0);
}

infos = get_app_version_and_location(cpe:CPE, port:solrPort, exit_no_version:TRUE);
solrVer = infos['version'];
solrPath = infos['location'];

if(version_in_range(version:solrVer, test_version:"6.0.0", test_version2:"6.6.4")){
  fix = "6.6.5";
}

if(version_in_range(version:solrVer, test_version:"7.0.0", test_version2:"7.3.1")){
  fix = "7.4.0";
}

if(fix)
{
  report = report_fixed_ver(installed_version:solrVer, fixed_version:fix, install_path:solrPath);
  security_message(data:report, port:solrPort);
  exit(0);
}

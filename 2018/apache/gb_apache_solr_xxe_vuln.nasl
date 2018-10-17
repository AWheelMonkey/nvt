###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apache_solr_xxe_vuln.nasl 9903 2018-05-18 09:08:09Z asteins $
#
# Apache Solr XXE Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:apache:solr";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140954");
  script_version("$Revision: 9903 $");
  script_tag(name: "last_modification", value: "$Date: 2018-05-18 11:08:09 +0200 (Fri, 18 May 2018) $");
  script_tag(name: "creation_date", value: "2018-04-09 13:39:11 +0700 (Mon, 09 Apr 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2018-1308"); 

  script_tag(name: "qod_type", value: "remote_banner_unreliable");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Apache Solr XXE Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_apache_solr_detect.nasl");
  script_mandatory_keys("Apache/Solr/Installed");

  script_tag(name: "summary", value: "Apache Solr is prone to a XXE vulnerability");

  script_tag(name: "insight", value: "This vulnerability relates to an XML external entity expansion (XXE) in the
'&dataConfig=<inlinexml>' parameter of Solr's DataImportHandler. It can be used as XXE using file/ftp/http
protocols in order to read arbitrary local files from the Solr server or the internal network.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "Apache Solr before 1.2 to 6.6.2 and 7.0.0 to 7.2.1.");

  script_tag(name: "solution", value: "Upgrade to version 6.6.3, 7.3.0 or later.");

  script_xref(name: "URL", value: "https://issues.apache.org/jira/browse/SOLR-11971");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "1.2", test_version2: "6.6.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "6.6.3");
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "7.0.0", test_version2: "7.2.1")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.3.0");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

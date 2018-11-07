###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cms_made_simple_upload_vuln.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# CMS Made Simple Upload Vulnerabililty
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:cmsmadesimple:cms_made_simple";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140299");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-08-15 14:22:16 +0700 (Tue, 15 Aug 2017)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2017-11404", "CVE-2017-11405");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("CMS Made Simple Upload Vulnerabililty");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("cms_made_simple_detect.nasl");
  script_mandatory_keys("cmsmadesimple/installed");

  script_tag(name:"summary", value:"In CMS Made Simple remote authenticated administrators can upload a .php
file via a FileManager action to admin/moduleinterface.php.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"CMS Made Simple version 2.2.2 and prior.");

  script_tag(name:"solution", value:"Update to version 2.2.3");

  script_xref(name:"URL", value:"http://www.yuesec.com/img/cccccve/CMSMadeSimple/upl0advul123/images/upload_vulnerability_yuesec.html");
  script_xref(name:"URL", value:"https://www.cmsmadesimple.org/2017/08/Announcing-CMSMS-2.2.3-Happy-Adventure");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less_equal(version: version, test_version: "2.2.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.2.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);

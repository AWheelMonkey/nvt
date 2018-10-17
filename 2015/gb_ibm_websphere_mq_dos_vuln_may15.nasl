###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_mq_dos_vuln_may15.nasl 11452 2018-09-18 11:24:16Z mmartin $
#
# IBM WebSphere MQ Denial of Service Vulnerability - May 2015
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:ibm:websphere_mq";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805577");
  script_version("$Revision: 11452 $");
  script_cve_id("CVE-2015-0189");
  script_bugtraq_id(74706);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-18 13:24:16 +0200 (Tue, 18 Sep 2018) $");
  script_tag(name:"creation_date", value:"2015-05-29 12:42:21 +0530 (Fri, 29 May 2015)");
  script_name("IBM WebSphere MQ Denial of Service Vulnerability - May 2015");

  script_tag(name:"summary", value:"This host is installed with IBM WebSphere MQ
  and is prone to denial-of-service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an unspecified error
  in the repository manager.");

  script_tag(name:"impact", value:"Successful exploitation will allow a remote
  attackers to overwrite memory and cause a denial of service condition.");

  script_tag(name:"affected", value:"IBM WebSphere MQ version 7.5 before 7.5.0.5
  and 8.0 before 8.0.0.2");

  script_tag(name:"solution", value:"Upgrade to IBM WebSphere MQ version 7.5.0.5
  or 8.0.0.2 or later. For updates refer
  http://www-03.ibm.com/software/products/en/ibm-mq");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21883457");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_ibm_websphere_mq_detect.nasl");
  script_mandatory_keys("IBM/Websphere/MQ/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!mqVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_in_range(version:mqVer, test_version:"7.5", test_version2:"7.5.0.4"))
{
  fix = "7.5.0.5";
  VULN = TRUE;
}

if(version_in_range(version:mqVer, test_version:"8.0", test_version2:"8.0.0.1"))
{
  fix = "8.0.0.2";
  VULN = TRUE;
}

if(VULN)
{
  report = 'Installed version: ' + mqVer + '\n' +
           'Fixed version:     ' + fix + '\n';
  security_message(data:report);
  exit(0);
}

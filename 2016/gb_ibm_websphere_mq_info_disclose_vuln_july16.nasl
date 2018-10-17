###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_websphere_mq_info_disclose_vuln_july16.nasl 11922 2018-10-16 10:24:25Z asteins $
#
# IBM WebSphere MQ Information Disclosure Vulnerability - July16
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:ibm:websphere_mq";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808619");
  script_version("$Revision: 11922 $");
  script_cve_id("CVE-2015-7462");
  script_bugtraq_id(91073);
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 12:24:25 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-07-15 18:17:58 +0530 (Fri, 15 Jul 2016)");
  script_name("IBM WebSphere MQ Information Disclosure Vulnerability - July16");

  script_tag(name:"summary", value:"This host is installed with IBM WebSphere MQ
  and is prone to an information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to the mqcertck tool
  which was newly added in MQ could trace certificate keystore passwords.");

  script_tag(name:"impact", value:"Successful exploitation will allows local users
  to discover cleartext certificate-keystore passwords within MQ trace output by
  leveraging administrator privileges to execute the mqcertck program.");

  script_tag(name:"affected", value:"IBM WebSphere MQ version 8.0.0.4");

  script_tag(name:"solution", value:"Upgrade to IBM WebSphere MQ version 8.0.0.5
  or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21984557");

  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_ibm_websphere_mq_detect.nasl");
  script_mandatory_keys("IBM/Websphere/MQ/Win/Ver");
  script_xref(name:"URL", value:"http://www-03.ibm.com/software/products/en/ibm-mq");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!mqVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_equal(version:mqVer, test_version:"8.0.0.4"))
{
  report = report_fixed_ver(installed_version:mqVer, fixed_version:"8.0.0.5");
  security_message(data:report);
  exit(0);
}

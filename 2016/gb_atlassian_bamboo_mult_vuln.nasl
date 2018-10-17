###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_atlassian_bamboo_mult_vuln.nasl 11516 2018-09-21 11:15:17Z asteins $
#
# Atlassian Bamboo Multiple Vulnerabilities Feb16
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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
##############################################################################

CPE = "cpe:/a:atlassian:bamboo";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807266");
  script_version("$Revision: 11516 $");
  script_cve_id("CVE-2015-8361", "CVE-2014-9757");
  script_bugtraq_id(83104, 83107);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-09-21 13:15:17 +0200 (Fri, 21 Sep 2018) $");
  script_tag(name:"creation_date", value:"2016-02-19 10:03:11 +0530 (Fri, 19 Feb 2016)");
  script_name("Atlassian Bamboo Multiple Vulnerabilities Feb16");

  script_tag(name:"summary", value:"The host is installed with Atlassian Bamboo
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exist due to,

  - The Ignite Realtime Smack XMPP API does not validate serialized data
    in an XMPP message.

  - The multiple unspecified services do not require authentication.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to execute arbitrary java code, and to obtain sensitive information,
  modify settings, or manage build agents.");

  script_tag(name:"affected", value:"Atlassian Bamboo 2.4 through 5.9.9");

  script_tag(name:"solution", value:"Upgrade to version 5.9.9 or later
  For updates refer to https://www.atlassian.com/software/bamboo");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"https://jira.atlassian.com/browse/BAM-17102");
  script_xref(name:"URL", value:"https://jira.atlassian.com/browse/BAM-17099");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_atlassian_bamboo_detect.nasl");
  script_mandatory_keys("AtlassianBamboo/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!bambooPort = get_app_port(cpe:CPE)){
  exit(0);
}

if(!bambooVer = get_app_version(cpe:CPE, port:bambooPort)){
  exit(0);
}

if(version_in_range(version:bambooVer, test_version:"2.4", test_version2:"5.9.8"))
{
  report = report_fixed_ver(installed_version:bambooVer, fixed_version:"5.9.9");
  security_message(data:report, port:bambooPort);
  exit(0);
}

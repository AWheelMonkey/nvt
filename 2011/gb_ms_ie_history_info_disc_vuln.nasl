###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_ie_history_info_disc_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Microsoft Internet Explorer Cache Objects History Information Disclosure Vulnerability
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to gain access to
sensitive information and launch other attacks.

Impact Level: Application";

tag_affected = "Internet Explorer Versions 6 through 9.";

tag_insight = "The flaw is due to an error when handling cache objects and can
be exploited to enumerate visited sites.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "The host is installed with Internet Explorer and is prone to
information disclosure vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802287");
  script_version("$Revision: 9351 $");
  script_cve_id("CVE-2011-4689");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-12-09 13:13:13 +0530 (Fri, 09 Dec 2011)");
  script_name("Microsoft Internet Explorer Cache Objects History Information Disclosure Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/47129");
  script_xref(name : "URL" , value : "http://lcamtuf.coredump.cx/cachetime/");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_mandatory_keys("MS/IE/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("version_func.inc");

ieVer = get_kb_item("MS/IE/Version");
if(!ieVer){
  exit(0);
}

## Check for MS IE version 6.x, 7.x, 8.x and 9.x
if(version_in_range(version:ieVer, test_version:"6.0", test_version2:"6.0.3790.4904")  ||
   version_in_range(version:ieVer, test_version:"7.0", test_version2:"7.0.6002.18510") ||
   version_in_range(version:ieVer, test_version:"8.0", test_version2:"8.0.7600.16891") ||
   version_in_range(version:ieVer, test_version:"9.0", test_version2:"9.0.8112.16437")){
  security_message(0);
}

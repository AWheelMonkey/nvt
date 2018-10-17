###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_domino_inotes_xss_vuln.nasl 11878 2018-10-12 12:40:08Z cfischer $
#
# IBM Lotus Domino iNotes Cross Site Scripting Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
CPE = "cpe:/a:ibm:lotus_domino";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803975");
  script_version("$Revision: 11878 $");
  script_cve_id("CVE-2013-5389", "CVE-2013-5388");
  script_bugtraq_id(63265, 63266);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 14:40:08 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-12-09 15:25:56 +0530 (Mon, 09 Dec 2013)");
  script_name("IBM Lotus Domino iNotes Cross Site Scripting Vulnerability");


  script_tag(name:"summary", value:"The host is installed with IBM Lotus Domino and is prone to cross site
scripting vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"solution", value:"Upgrade to IBM Lotus Domino version 8.5.3 FP5 IF2 or 9.0 IF5 or later.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"insight", value:"The flaw is in the iNotes. No much information is publicly available about
this issue.");
  script_tag(name:"affected", value:"IBM Lotus Domino 8.5.3 before FP5 IF2 and 9.0 before IF5.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to inject arbitrary
web script.");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/87123");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/87125");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21653149");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_lotus_domino_detect.nasl");
  script_mandatory_keys("Domino/Version");
  exit(0);
}

include("version_func.inc");
include("revisions-lib.inc"); # Used in get_highest_app_version
include("host_details.inc");

if(!domVer = get_highest_app_version(cpe:CPE)){
  exit(0);
}

domVer = ereg_replace(pattern:"FP", string:domVer, replace: ".");

if(version_is_less(version:domVer, test_version:"8.5.3.5") ||
   version_is_equal(version:domVer, test_version:"9.0.0.0"))
{
  security_message(port:0);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_lotus_symphony_mult_vuln_win.nasl 11552 2018-09-22 13:45:08Z cfischer $
#
# IBM Lotus Symphony Multiple Vulnerabilities (Windows)
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802227");
  script_version("$Revision: 11552 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 15:45:08 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2011-08-05 09:04:20 +0200 (Fri, 05 Aug 2011)");
  script_cve_id("CVE-2011-2884", "CVE-2011-2885", "CVE-2011-2886",
                "CVE-2011-2888", "CVE-2011-2893");
  script_bugtraq_id(48936);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("IBM Lotus Symphony Multiple Vulnerabilities (Windows)");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_ibm_lotus_symphony_detect_win.nasl");
  script_mandatory_keys("IBM/Lotus/Symphony/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow attacker to cause a denial of service.");
  script_tag(name:"affected", value:"IBM Lotus Symphony Version 3 before FP3.");
  script_tag(name:"insight", value:"Multiple flaws are due to unspecified errors related to,

  - critical security vulnerability issues.

  - sample .doc document that incorporates a user-defined toolbar.

  - a .docx document with empty bullet styles for parent bullets.

  - complex graphics in a presentation.

  - a large .xls spreadsheet with an invalid Value reference.");
  script_tag(name:"summary", value:"This host is installed with IBM Lotus Symphony and is prone to
  multiple unspecified vulnerabilities.");
  script_tag(name:"solution", value:"Upgrade to IBM Lotus Symphony version 3 FP3 or later,
  For updates refer to http://www.ibm.com/software/lotus/symphony/home.nsf/home

  *****
  NOTE: Ignore this warning, if above mentioned patch is already applied.
  *****");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://secunia.com/advisories/45271");
  script_xref(name:"URL", value:"https://www-304.ibm.com/support/docview.wss?uid=swg21505448");
  script_xref(name:"URL", value:"http://www-03.ibm.com/software/lotus/symphony/idcontents/releasenotes/en/readme_fixpack3_standalone_long.htm");
  script_xref(name:"URL", value:"https://www-304.ibm.com/jct03001c/software/lotus/symphony/idcontents/releasenotes/en/readme_embedded_in_fixpack3_long.htm");
  script_xref(name:"URL", value:"http://www-03.ibm.com/software/lotus/symphony/buzz.nsf/web_DisPlayPlugin?open&unid=9717F6F587AAA939852578D300404BCF&category=announcements");
  exit(0);
}


include("version_func.inc");

version = get_kb_item("IBM/Lotus/Symphony/Win/Ver");
if(version =~ "^3\..*")
{
  if(version_is_less_equal(version:version, test_version:"3.0.10289")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
}

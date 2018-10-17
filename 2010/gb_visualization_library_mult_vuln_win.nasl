###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_visualization_library_mult_vuln_win.nasl 11553 2018-09-22 14:22:01Z cfischer $
#
# Visualization Library Multiple Unspecified Vulnerabilities (Windows)
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801000");
  script_version("$Revision: 11553 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 16:22:01 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2010-03-18 15:44:57 +0100 (Thu, 18 Mar 2010)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2010-0937");
  script_bugtraq_id(37644);
  script_name("Visualization Library Multiple Unspecified Vulnerabilities (Windows)");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/55478");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2010/0050");
  script_xref(name:"URL", value:"http://visualizationlibrary.com/documentation/pagchangelog.html");

  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_visualization_library_detect_win.nasl");
  script_mandatory_keys("VisualizationLibrary/Win/Ver");
  script_tag(name:"impact", value:"Unknown impacts and unknown attack vectors.");
  script_tag(name:"affected", value:"Visualization Library versions prior to 2009.08.812 on Windows");
  script_tag(name:"insight", value:"The flaws are caused by multiple unspecified errors with unknown impact and
  unknown attack vectors.");
  script_tag(name:"solution", value:"Update to version 2009.08.812 or above,
  For updates refer to http://www.visualizationlibrary.com/downloads.php");
  script_tag(name:"summary", value:"The host is running Visualization Library and is prone to multiple
  vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

vslVer = get_kb_item("VisualizationLibrary/Win/Ver");
if(isnull(vslVer)){
  exit(0);
}

if(version_is_less(version:vslVer, test_version:"2009.08.812")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}

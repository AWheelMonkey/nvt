###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_firefox_ftp_clnt_xss_vuln_win.nasl 9910 2018-05-18 13:37:53Z cfischer $
#
# Firefox Web Browser FTP Client XSS Vulnerability (Windows)
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800042");
  script_version("$Revision: 9910 $");
  script_tag(name:"last_modification", value:"$Date: 2018-05-18 15:37:53 +0200 (Fri, 18 May 2018) $");
  script_tag(name:"creation_date", value:"2008-10-24 15:11:55 +0200 (Fri, 24 Oct 2008)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2008-4723");
  script_bugtraq_id(31855);
  script_name("Firefox Web Browser FTP Client XSS Vulnerability (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_portable_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/31855/exploit");

  script_tag(name:"impact", value:"Successful remote attack result in injection of arbitrary web
  script or HTML code.

  Impact Level: Application");
  script_tag(name:"affected", value:"Firefox version 3.0.1 to 3.0.3 on Windows.");
  script_tag(name:"insight", value:"The flaw is due to the way browser handles web script or html via
  ftp://URL for an html document within a JPG, PDF, or TXT files.");
  script_tag(name:"solution", value:"No known solution was made available for at least one year
  since the disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.
  For updates refer to http://www.mozilla.org/en-US");
  script_tag(name:"summary", value:"The host is installed with Mozilla Firefox browser and is prone
  to Cross Site Scripting (XSS) Vulnerability.");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}


include("version_func.inc");

if(!ver = get_kb_item("Firefox/Win/Ver")) exit(0);

if(version_in_range(version:ver, test_version:"3.0.1", test_version2:"3.0.3")){
  report = report_fixed_ver(installed_version:ver, fixed_version:"N/A");
  security_message(data:report);
  exit(0);
}

exit(99);
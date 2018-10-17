##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mega_extension_trojan_macosx.nasl 11350 2018-09-12 08:17:35Z santu $
#
# Google Chrome MEGA Extension Trojan-Mac OS X
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813791");
  script_version("$Revision: 11350 $");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 10:17:35 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-09-10 12:21:10 +0530 (Mon, 10 Sep 2018)");
  script_name("Google Chrome MEGA Extension Trojan-Mac OS X");

  script_tag(name:"summary", value:"This host is installed with MEGA extension
  for Google Chrome and tries to detect the trojaned MEGA extension.");

  script_tag(name:"vuldetect", value:"Check if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists as a trojaned version of
  MEGA extension was available in google-chrome webstore for installation and
  update.");

  script_tag(name:"impact", value:"Upon installation or auto update to trojaned
  version, extension would exfiltrate credentials for sites including amazon.com,
  live.com, github.com, google.com (or webstore login), myetherwallet.com,
  mymonero.com, idex.market and HTTP POST requests to any other sites. Then it
  will send them to a server located in Ukraine.

  Impact Level: Application");

  script_tag(name:"affected", value:"MEGA extension version 3.39.4 for Chrome on Mac OS X");

  script_tag(name:"solution", value:"Upgrade to MEGA extension version 3.39.5
  or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");

  # Version information available under path to mega.html
  script_tag(name:"qod", value:"75");

  script_xref(name:"URL", value:"https://thehackernews.com/2018/09/mega-file-upload-chrome-extension.html");
  script_xref(name:"URL", value:"https://mega.nz");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("GoogleChrome/MacOSX/Version");
  exit(0);
}

include("ssh_func.inc");
include("version_func.inc");
include("host_details.inc");

sock = ssh_login_or_reuse_connection();
if(!sock) {
  exit(0);
}

filePath = find_file(file_name:"Mega.html", file_path:"/", useregex:TRUE,
                  regexpar:"$", sock:sock);
if((!filePath) || ("does not exist" >< filePath))
{
  filePath = chomp(ssh_cmd(socket:sock, cmd:"mdfind Mega.html"));
  if((!filePath) || ("does not exist" >< filePath)){
    exit(0);
  }
}

log_message(data: "filePath:: " + filePath);
foreach file(split(filePath))
{
  ver = eregmatch(pattern:"(.*(g|G)oogle.(c|C)hrome.*(e|E)xtensions.*[A-za-z]+/([0-9._]+).*)(M|m)ega/html/mega.html", string:file );
  if(!ver[5]){
    continue;
  }
  version = ver[5];
  filePath = ver[0];

  if(version_is_equal(version:version, test_version:"3.39.4"))
  {
    report = report_fixed_ver(installed_version:version, fixed_version:"3.39.5", install_path:filePath);
    security_message(data:report);
    exit(0);
  }
}
exit(0);

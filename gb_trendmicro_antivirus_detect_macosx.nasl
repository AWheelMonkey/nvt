###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trendmicro_antivirus_detect_macosx.nasl 12688 2018-12-06 13:59:18Z santu $
#
# Trend Micro Antivirus Version Detection (Mac OS X)
#
# Authors:
# Vidita V Koushik <vidita@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.814360");
  script_version("$Revision: 12688 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-06 14:59:18 +0100 (Thu, 06 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-05 18:17:59 +0530 (Wed, 05 Dec 2018)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Trend Micro Antivirus Version Detection (Mac OS X)");

  script_tag(name:"summary", value:"Detects the installed version of Trend Micro
  Antivirus on Mac OS X.

  The script logs in via ssh, searches for folder 'PackageSelector.app' and
  queries the related 'info.plist' file for string 'CFBundleShortVersionString'
  via command line option 'defaults read'.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name");
  exit(0);
}

include("version_func.inc");
include("ssh_func.inc");
include("cpe.inc");
include("host_details.inc");

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

appname = chomp(ssh_cmd(socket:sock, cmd:"defaults read /Applications/" +
                      "PackageSelector.app/Contents/Info CFBundleIdentifier"));

if("com.trendmicro.iTIS.PackageSelector">< appname){

  tmVer = chomp(ssh_cmd(socket:sock, cmd:"defaults read /Applications/" +
                        "PackageSelector.app/Contents/Info CFBundleShortVersionString"));
}

close(sock);

if(isnull(tmVer) || "does not exist" >< tmVer){
  exit(0);
}

set_kb_item(name:"TrendMicro/Antivirus/Macosx/Ver", value:tmVer);

#created cpe for this product
cpe = build_cpe(value:tmVer, exp:"^([0-9.]+)", base:"cpe:/a:trend_micro:antivirus:");
if(isnull(cpe))
  cpe = "cpe:/a:trend_micro:antivirus";

register_product(cpe: cpe, location:'/Applications/PackageSelector.app', service:"ssh-login", port:0);

report =  build_detection_report(app: "Trend Micro Antivirus",
                             version: tmVer,
                             install: "/Applications/PackageSelector.app",
                                 cpe: cpe,
                           concluded: tmVer);
if(report){
  log_message( port:0, data:report );
}

exit(99);

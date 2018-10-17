##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_typsoft_ftp_detect.nasl 9536 2018-04-19 11:20:50Z cfischer $
#
# TYPSoft FTP Server Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801057");
  script_version("$Revision: 9536 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-19 13:20:50 +0200 (Thu, 19 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-12-02 13:54:57 +0100 (Wed, 02 Dec 2009)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("TYPSoft FTP Server Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("ftpserver_detect_type_nd_version.nasl");
  script_require_ports("Services/ftp", 21);
  script_mandatory_keys("ftp_banner/available");

  script_tag(name:"summary", value:"Detection of TYPSoft FTP Server.

  This script determines the TYPSoft FTP server version on the remote host and sets the result in the KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("ftp_func.inc");
include("cpe.inc");
include("host_details.inc");

port = get_ftp_port(default:21);
banner = get_ftp_banner(port:port);

if("TYPSoft FTP" >< banner) {

  version = "unknown";

  tsVer = eregmatch(pattern:"TYPSoft FTP Server ([0-9.]+)", string:banner);
  if(!isnull(tsVer[1])) {
    version = tsVer[1];
    set_kb_item(name:"TYPSoft/FTP/Ver", value:version);
  }

  set_kb_item(name:"TYPSoft/FTP/installed", value:TRUE);

  cpe = build_cpe(value:version, exp:"^([0-9.]+\.[0-9]+)\.?([a-z0-9]+)?", base:"cpe:/a:typsoft:typsoft_ftp_server:");
  if (!cpe)
    cpe = 'cpe:/a:typsoft:typsoft_ftp_server';

  register_product(cpe:cpe, location:port + '/tcp', port:port);

  log_message(data:build_detection_report(app:"TYPSoft FTP Server", version:version, install:port + '/tcp',
                                          cpe:cpe, concluded:banner),
              port:port);
}

exit(0);

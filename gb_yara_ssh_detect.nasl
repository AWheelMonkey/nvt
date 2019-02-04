###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_yara_ssh_detect.nasl 13058 2019-01-14 09:19:05Z cfischer $
#
# YARA Detection (SSH)
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright (C) 2019 Greenbone Networks GmbH
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
  script_oid("1.3.6.1.4.1.25623.1.0.112478");
  script_version("$Revision: 13058 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-14 10:19:05 +0100 (Mon, 14 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-08 09:26:12 +0100 (Tue, 08 Jan 2019)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("YARA Detection (SSH)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/success");
  script_exclude_keys("ssh/no_linux_shell");

  script_tag(name:"summary", value:"Detects via SSH if YARA is installed on the target
  host.");

  script_tag(name:"qod_type", value:"executable_version");

  exit(0);
}

include("ssh_func.inc");
include("cpe.inc");
include("host_details.inc");

sock = ssh_login_or_reuse_connection();
if( ! sock )
  exit( 0 );

full_path_list = find_file( file_name:"yara", sock:sock, useregex:TRUE, regexpar:"yara$", file_path:"/" );
if( ! full_path_list ) {
  ssh_close_connection();
  exit( 0 );
}

foreach full_path( full_path_list ) {

  full_path = chomp( full_path );

  #exclude hidden directories
  if( ! full_path || "/." >< full_path )
    continue;

  vers = get_bin_version( full_prog_name:full_path, sock:sock, version_argv:"-v", ver_pattern:"([0-9.]+)" );

  if( vers[1] ) {
    version = vers[1];
    set_kb_item( name:"yara/detected", value:TRUE );
    set_kb_item( name:"yara/ssh/detected", value:TRUE );
    register_and_report_cpe( app:"YARA", ver:version, base:"cpe:/a:virustotal:yara:", expr:"([0-9.]+)", regPort:0, insloc:full_path, concluded:vers[0], regService:"ssh-login" );
  }
}

ssh_close_connection();
exit( 0 );

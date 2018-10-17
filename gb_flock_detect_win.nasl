##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_flock_detect_win.nasl 11015 2018-08-17 06:31:19Z cfischer $
#
# Flock Version Detection (Windows)
#
# Authors:
# Sharath S <sharaths@secpod.com>
#
# Updated By: Madhuri D <dmadhuri@secpod.com> on 2010-09-10
#          - To Detect recent versions
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800877");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11015 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 08:31:19 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2009-09-02 11:50:45 +0200 (Wed, 02 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Flock Version Detection (Windows)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name:"summary", value:"This script detects the installed version of Flock Browser and
  sets the result in KB.");
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

SCRIPT_DESC = "Flock Version Detection (Windows)";

if(!get_kb_item("SMB/WindowsVersion"))
{
  exit(0);
}

if(registry_key_exists(key:"SOFTWARE\Flock\Flock"))
{
  foreach item (registry_enum_keys(key:"SOFTWARE\Flock\Flock"))
  {
    flockVer = eregmatch(pattern:"([0-9]\.[0-9.]+((b|rc)[0-9])?)", string:item);

    if(!isnull(flockVer[1])){
      version = flockVer[1];
    }
  }
}

if(version == NULL)
{
  path = "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\flock.exe";
  flockPath = registry_get_sz(key:path, item:"Path");
  if(!isnull(flockPath))
  {
    share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:flockPath);
    file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:flockPath + "\flock.exe");

    name   =  kb_smb_name();
    login  =  kb_smb_login();
    pass   =  kb_smb_password();
    domain =  kb_smb_domain();
    port   =  kb_smb_transport();

    soc = open_sock_tcp(port);
    if(!soc){
     exit(0);
    }

    r = smb_session_request(soc:soc, remote:name);
    if(!r)
    {
      close(soc);
      exit(0);
    }

    prot = smb_neg_prot(soc:soc);
    if(!prot)
    {
      close(soc);
      exit(0);
    }

    r = smb_session_setup(soc:soc, login:login, password:pass,
                        domain:domain, prot:prot);
    if(!r)
    {
      close(soc);
      exit(0);
    }

    uid = session_extract_uid(reply:r);
    if(!uid)
    {
      close(soc);
      exit(0);
    }

    r = smb_tconx(soc:soc, name:name, uid:uid, share:share);
    if(!r)
    {
      close(soc);
      exit(0);
    }

    tid = tconx_extract_tid(reply:r);
    if(!tid)
    {
      close(soc);
      exit(0);
    }

    fid = OpenAndX(socket:soc, uid:uid, tid:tid, file:file);
    if(!fid)
    {
      close(soc);
      exit(0);
    }

    version = GetVersion(socket:soc, uid:uid, tid:tid, fid:fid, verstr:"prod");
    close(soc);
  }
}

if(version != NULL){
  set_kb_item(name:"Flock/Win/Ver", value:version);
  log_message(data:"Flock version " + version + " was detected on the host");

  cpe = build_cpe(value:version, exp:"^([0-9.]+)", base:"cpe:/a:flock:flock:");
  if(!isnull(cpe))
     register_host_detail(name:"App", value:cpe, desc:SCRIPT_DESC);

}


###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_017.nasl 10646 2018-07-27 07:00:22Z cfischer $
#
# IT-Grundschutz, 14. EL, Ma�nahme 4.017
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.94184");
  script_version("$Revision: 10646 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-27 09:00:22 +0200 (Fri, 27 Jul 2018) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("IT-Grundschutz M4.017: Sperren und L�schen nicht ben�tigter Accounts und Terminals");
  script_xref(name:"URL", value:"http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04017.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-15");
  script_mandatory_keys("Compliance/Launch/GSHB-15");
  script_dependencies("GSHB/GSHB_SSH_lastlogin.nasl", "GSHB/GSHB_WMI_OSInfo.nasl");

  script_tag(name:"summary", value:"IT-Grundschutz M4.017: Sperren und L�schen nicht ben�tigter Accounts und Terminals.

  Stand: 14. Erg�nzungslieferung (14. EL).");

  exit(0);
}

include("itg.inc");

name = 'IT-Grundschutz M4.017: Sperren und L�schen nicht ben�tigter Accounts und Terminals\n';

gshbm =  "IT-Grundschutz M4.017: ";

lastlogin = get_kb_item("GSHB/lastlogin");
LockedUser = get_kb_item("GSHB/LockedUser");
UserShell = get_kb_item("GSHB/UserShell");
log = get_kb_item("GSHB/lastlogin/log");

ldapuser = get_kb_item("GSHB/lastLogonTimestamp/Userlist");
ldaplastlogin = get_kb_item("GSHB/lastLogonTimestamp");
ldaplog = get_kb_item("GSHB/lastLogonTimestamp/log");
WindowsDomainrole = get_kb_item("WMI/WMI_WindowsDomainrole");
OSNAME = get_kb_item("WMI/WMI_OSNAME");

maxnologindays = 84;

if(!find_in_path("perl"))perl = "notfound";


if(OSNAME >!< "none"){
  if(WindowsDomainrole < 4){
    result = string("nicht zutreffend");
    desc = string('Dieser Test kann bei Windows Systemen nur am\nDomaincontroller ausgef�hrt werden.');
    if (ldaplog) desc += '\n' + ldaplog;
  }else{
    if (ldaplastlogin == "error"){
      result = string("Fehler");
      if (!ldaplog)desc = string('Beim Testen des Systems trat ein\nunbekannter Fehler auf.');
      if (ldaplog)desc = string('Beim Testen des Systems trat ein Fehler auf:\n' + ldaplog);
    }else{
      if (perl == "notfound"){
        result = string("Fehler");
        desc = string('Perl konnte im Suchpfad nicht gefunden werden. Es ist\naber zur Berechnung des letzten Logins notwendig.');
      }
      else{
        val = split(ldapuser, sep:";", keep:0);
        for(i=0; i<max_index(val); i++){
          userval = split(val[i], sep:",", keep:0);
          v=0;
          argv[v++] = "perl";
          argv[v++] = "-X";
          argv[v++] = "-e";
          argv[v++] = 'print ((' + userval[1] + '/864000000000) - 134773);';
          argv[v++] = '2>/dev/null';

          day1 = pread(cmd:"perl", argv:argv, cd:0);

          seconds = split(gettimeofday(), sep:".", keep:0);
          day2 = seconds[0] / 86400;
          day1 = split(day1, sep:".", keep:0);
          diffdays = int(day2) - int(day1[0]);
          if (diffdays > maxnologindays){
            Userlst += userval[0] + ' hat sich vor ' + diffdays + ' Tagen\nzum letzten mal angemeldet.\n';
          }
        }
        if (Userlst){
          result = string("nicht erf�llt");
          desc = string('Nachfolgende Benutzer haben sich seit mehr als\n12 Wochen nicht mehr angemeldet. Sie sollten den/die\nBenutzer sperren oder l�schen. Sollte der Benutzer\nein Dienst/Daemon sein, pr�fen Sie bitte ob er noch\nnotwendig ist.\n' + Userlst);
        }else{
          result = string("erf�llt");
          desc = string('Es konnten keine Benutzer gefunden werden, die sich\nseit mehr als 12 Wochen nicht angemeldet haben.');
        }
      }
    }
  }
}else if(lastlogin == "windows") {
    result = string("Fehler");
    desc = string('Das System scheint ein Windows-System zu sein wurde aber nicht richtig erkannt.');
}else if(lastlogin >< "error"){
  result = string("Fehler");
  if (!log)desc = string('Beim Testen des Systems trat ein unbekannter Fehler auf.');
  if (log)desc = string('Beim Testen des Systems trat ein Fehler auf:\n' + log);
}else{

  lastloginLst = split(lastlogin, keep:0);
  LockedUserLst = split(LockedUser, keep:0);
  UserShellLst = split(UserShell, keep:0);

  for(i=1; i<max_index(lastloginLst); i++){
    for(a=0; a<max_index(LockedUserLst); a++){
      lastloginUserLst = ereg_replace(string:lastloginLst[i], pattern:" {2,}", replace:":");
      lastloginUserLst = split(lastloginUserLst, sep:":", keep:0);
      if (lastloginUserLst[0] == LockedUserLst[a]) continue;
      failuser += lastloginLst[i] + '\n';
    }
  }
  failuserLst = split(failuser, keep:0);
  for(i=1; i<max_index(failuserLst); i++){
    for(a=0; a<max_index(UserShellLst); a++){
      UserShellLstA = split(UserShellLst[a], sep:":", keep:0);
      failuserLstUserLst = ereg_replace(string:failuserLst[i], pattern:" {2,}", replace:":");
      failuserLstUserLst = split(failuserLstUserLst, sep:":", keep:0);
      if (UserShellLstA[0] >!< failuserLstUserLst[0]) continue;
      failuser = ereg_replace(string:failuserLst[i], pattern:"( ){2,}", replace:" ");
      resultuser += "Login-Shell: " + UserShellLstA[1] + " User: " + failuser + '\n';
    }
  }
  if(!resultuser){
    result = string("erf�llt");
    desc = string('Es konnten keine Benutzer gefunden werden, die sich\nseit mehr als 12 Wochen nicht angemeldet haben.');
  }else{
    result = string("nicht erf�llt");
    desc = string('Nachfolgende Benutzer haben sich seit mehr als\n12 Wochen nicht mehr angemeldet. Sie sollten den/die\nBenutzer sperren oder l�schen. Sollte der Benutzer ein\nDienst/Daemon sein, pr�fen Sie bitte ob die vorge-\nfundene Login-Shell notwendig ist.\n' + resultuser);
  }
}

set_kb_item(name:"GSHB/M4_017/result", value:result);
set_kb_item(name:"GSHB/M4_017/desc", value:desc);
set_kb_item(name:"GSHB/M4_017/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M4_017');

exit(0);

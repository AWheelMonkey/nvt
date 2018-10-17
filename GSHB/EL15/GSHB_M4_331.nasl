##############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_331.nasl 10396 2018-07-04 09:13:46Z cfischer $
#
# IT-Grundschutz, 14. EL, Ma�nahme 4.331
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
  script_oid("1.3.6.1.4.1.25623.1.0.94237");
  script_version("$Revision: 10396 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-04 11:13:46 +0200 (Wed, 04 Jul 2018) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz M4.331: Sichere Konfiguration des Betriebssystems f�r einen Samba-Server");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-15");
  script_dependencies("GSHB/GSHB_SSH_fstab.nasl", "GSHB/GSHB_SSH_SAMBA_ntfs_ACL_ADS.nasl", "smb_nativelanman.nasl", "netbios_name_get.nasl");
  script_mandatory_keys("Compliance/Launch/GSHB-15");

  script_xref(name:"URL", value:"http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04331.html");

  script_tag(name:"summary", value:"IT-Grundschutz M4.331: Sichere Konfiguration des Betriebssystems f�r einen Samba-Server

  Stand: 14. Erg�nzungslieferung (14. EL).");

  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("itg.inc");
include("smb_nt.inc");

name = 'IT-Grundschutz M4.331: Sichere Konfiguration des Betriebssystems f�r einen Samba-Server\n';

samba = kb_smb_is_samba();
NTFSADS = get_kb_item("GSHB/SAMBA/NTFSADS");
ACL = get_kb_item("GSHB/SAMBA/ACL");
ACLSUPP = get_kb_item("GSHB/SAMBA/ACLSUPP");
VER = get_kb_item("GSHB/SAMBA/VER");
reiserfs = get_kb_item("GSHB/FSTAB/reiserfs");
log = get_kb_item("GSHB/FSTAB/log");

if(!samba){
    result = string("nicht zutreffend");
    desc = string('Auf dem System l�uft kein Samba-Dateiserver.');
}else if(reiserfs == "error"){
  result = string("Fehler");
  if (!log) desc = string("Beim Testen des Systems trat ein Fehler auf.");
  if (log) desc = string("Beim Testen des Systems trat ein Fehler auf:\n" + log);
}else if(reiserfs == "noreiserfs" && ACL != "no" && ACLSUPP != "no" && NTFSADS != "no"){
    result = string("erf�llt");
    desc = string('Auf dem System l�uft keine Partition mit ReiserFS.\nNTFS Access Control Lists und NTFS Alternate Data\nStreams wurde richtig konfiguriert.\nBitte pr�fen Sie\nob bei den aufgef�hrten Mountpoints noch welche\nfehlen. Wenn ja, aktivieren Sie auch dort den ACL\nSupport.\n' + ACL + '\n \n');
    desc += string('Bitte pr�fen Sie auch, ob am lokalen Paketfilter nur\ndie TCP und UDP Ports frei geschaltet, die f�r den\nBetrieb des Samba-Servers n�tig sind.');
}else if (reiserfs != "noreiserfs" || ACL == "no" || ACLSUPP == "no" || NTFSADS == "no"){
    result = string("nicht erf�llt");
    if (reiserfs != "noreiserfs") desc = string('Auf dem System l�uft folgende Partition mit ReiserFS:\n' + reiserfs +'\nS�mtliche Samba-Datenbanken im TDB-Format sollten auf\neiner Partition gespeichert werden, die nicht ReiserFS\nals Dateisystem verwendet.\n \n');
    if (ACLSUPP == "no")desc += string('Der Konfigurationsparameter -nt acl support- in der\nKonfigurationsdatei smb.conf steht nicht auf -yes-.\n \n');
    if (ACL == "no")desc += string('Es wurde in /etc/fstab keine Unterst�tzung f�r ACL\ngefunden. Sie m�ssen die ACL-Unterst�tzung explizit\naktivieren.\n \n');
    if (NTFSADS == "no")desc += string('Sie setzen Samba Version ' + VER + ' ein.\nSamba 3.0.x bietet keine M�glichkeit NTFS ADS\nabzubilden. Samba 3.2.x und h�her kann NTFS ADS direkt\nber POSIX Extended Attributes (xattr) abbilden.\n \n');
    desc += string('Bitte pr�fen Sie auch, ob am lokalen Paketfilter nur\ndie TCP und UDP Ports frei geschaltet, die f�r den\nBetrieb des Samba-Servers n�tig sind.');
}



if (!result){
  result = string("Fehler");
  desc = string('Beim Testen des Systems trat ein unbekannter Fehler\nauf bzw. es konnte kein Ergebnis ermittelt werden.');
}

set_kb_item(name:"GSHB/M4_331/result", value:result);
set_kb_item(name:"GSHB/M4_331/desc", value:desc);
set_kb_item(name:"GSHB/M4_331/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M4_331');

exit(0);

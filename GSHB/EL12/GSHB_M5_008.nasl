###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M5_008.nasl 10611 2018-07-25 11:49:26Z cfischer $
#
# IT-Grundschutz, 12. EL, Ma�nahme 5.008
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.95001");
  script_version("$Revision: 10611 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-25 13:49:26 +0200 (Wed, 25 Jul 2018) $");
  script_tag(name:"creation_date", value:"2011-11-07 13:38:53 +0100 (Mon, 07 Nov 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz M5.008: Regelm��iger Sicherheitscheck des Netzes");
  script_xref(name:"URL", value:"http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m05/m05008.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"general_note");
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-12");
  script_dependencies("compliance_tests.nasl");
  script_mandatory_keys("Compliance/Launch/GSHB-12", "Tools/Present/wmi");

  script_tag(name:"summary", value:"IT-Grundschutz M5.008: Regelm��iger Sicherheitscheck des Netzes.

ACHTUNG: Dieser Test wird nicht mehr unterst�tzt. Er wurde ersetzt durch
den entsprechenden Test der nun permanent and die aktuelle EL angepasst
wird: OID 1.3.6.1.4.1.25623.1.0.95050

Diese Pr�fung bezieht sich auf die 12. Erg�nzungslieferung (12. EL) des IT-
Grundschutz. Die detaillierte Beschreibung zu dieser Ma�nahme findet sich unter
nachfolgendem Verweis. Es ist zu beachten, dass der dortige Text sich immer auf
die aktuellste Erg�nzungslieferung bezieht. Titel und Inhalt k�nnen sich bei einer
Aktualisierung �ndern, allerdings nicht die Kernthematik.

Hinweis:

Es wird lediglich ein Meldung ausgegeben, dass mit aktuelleten Plugins getestet werden soll.");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);

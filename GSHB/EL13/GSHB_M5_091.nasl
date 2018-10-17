###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M5_091.nasl 10625 2018-07-25 15:24:35Z cfischer $
#
# IT-Grundschutz, 13. EL, Ma�nahme 5.091
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.95044");
  script_version("$Revision: 10625 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-25 17:24:35 +0200 (Wed, 25 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-11-20 16:16:01 +0100 (Wed, 20 Nov 2013)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz M5.091: Einsatz von Personal Firewalls f�r Clients");
  script_xref(name:"URL", value:"http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m05/m05091.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-13");
  script_mandatory_keys("Compliance/Launch/GSHB-13", "Tools/Present/wmi");
  script_dependencies("GSHB/GSHB_WMI_OSInfo.nasl", "GSHB/GSHB_WMI_WinFirewallStat.nasl", "GSHB/GSHB_SSH_iptables.nasl");

  script_tag(name:"summary", value:"IT-Grundschutz M5.091: Einsatz von Personal Firewalls f�r Clients.

ACHTUNG: Dieser Test wird nicht mehr unterst�tzt. Er wurde ersetzt durch
den entsprechenden Test der nun permanent and die aktuelle EL angepasst
wird: OID 1.3.6.1.4.1.25623.1.0.95070

Stand: 13. Erg�nzungslieferung (13. EL).

Hinweis:
Getestet wird auf die Microsoft Windows Firewall. F�r Vista und Windows 7
auf jegliche Firewall die sich systemkonform installiert.
Auf Linux, soweit m�glich, anzeige der iptables Regeln.");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);

##############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB-13.nasl 12815 2018-12-18 09:04:52Z cfischer $
#
# IT-Grundschutz, 13. Erg�nzungslieferung
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
  script_oid("1.3.6.1.4.1.25623.1.0.94999");
  script_version("$Revision: 12815 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-18 10:04:52 +0100 (Tue, 18 Dec 2018) $");
  script_tag(name:"creation_date", value:"2013-11-20 12:24:13 +0100 (Wed, 20 Nov 2013)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz, 13. EL");
  # Dependency GSHB_M4_007.nasl is running in ACT_ATTACK because it depends on
  # GSHB_SSH_TELNET_BruteForce.nasl which is in ACT_ATTACK as well.
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"general_note");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Compliance");
  script_mandatory_keys("Compliance/Launch/GSHB-13");
  script_require_keys("GSHB-13/silence");
  script_dependencies("compliance_tests.nasl");

  script_tag(name:"summary", value:"Zusammenfassung von Tests gem�� IT-Grundschutz
(in 13. Erg�nzungslieferung).

ACHTUNG: Dieser Test wird nicht mehr unterst�tzt. Er wurde ersetzt durch
den entsprechenden Test der nun permanent and die aktuelle EL angepasst
wird: OID 1.3.6.1.4.1.25623.1.0.94171

Diese Routinen pr�fen s�mtliche Ma�nahmen des
IT-Grundschutz des Bundesamts f�r Sicherheit
in der Informationstechnik (BSI) auf den
Zielsystemen soweit die Ma�nahmen auf automatisierte
Weise abgepr�ft werden k�nnen.");

  script_tag(name:"deprecated", value:TRUE);

  exit(0);
}

exit(66);
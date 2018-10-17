###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_junos_cve_2013_4685.nasl 11082 2018-08-22 15:05:47Z mmartin $
#
# Junos Buffer Overflow when Processing HTTP Messages
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103961");
  script_version("$Revision: 11082 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-22 17:05:47 +0200 (Wed, 22 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-12-09 22:07:11 +0700 (Mon, 09 Dec 2013)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"package");

  script_tag(name:"solution_type", value:"VendorFix");

  script_cve_id("CVE-2013-4685");
  script_bugtraq_id(61125);

  script_name("Junos Buffer Overflow when Processing HTTP Messages");


  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("JunOS Local Security Checks");
  script_dependencies("gb_ssh_junos_get_version.nasl", "gb_junos_snmp_version.nasl");
  script_mandatory_keys("Junos/Build", "Junos/Version");

  script_tag(name:"summary", value:"Buffer Overflow in flowd when processing HTTP protocol messages");

  script_tag(name:"vuldetect", value:"Check the OS build.");

  script_tag(name:"insight", value:"A buffer overflow vulnerability affects the flowd process while
processing HTTP protocol messages. This issue can be triggered when the SRX Series device is acting as a
Unified Access Control (UAC) enforcer in a UAC network with Captive Portal enabled.");

  script_tag(name:"impact", value:"A remote attacker may execute arbitrary code using crafted HTTP
requests.");

  script_tag(name:"affected", value:"Junos OS on SRX Series running 10.4, 11.4 12.1, or 12.1X44.");

  script_tag(name:"solution", value:"New builds of Junos OS software are available from Juniper.");

  script_xref(name:"URL", value:"http://kb.juniper.net/JSA10574");
  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/61125");

  exit(0);
}

include("revisions-lib.inc");

version = get_kb_item("Junos/Version");
if (!version)
  exit(0);

build = get_kb_item("Junos/Build");
if (!build)
  exit(0);

desc += "Version/Build-Date:
" + version + " / " + build;

build2check = str_replace(string:build, find:"-", replace:"");

if (revcomp(a:build2check, b:"20130620") >= 0) {
  exit(99);
}

if (revcomp(a:version, b:"10.4R15") < 0) {
  security_message(port:0, data:desc);
  exit(0);
}

if (version =~ "10.4S") {
  if (revcomp(a:version, b:"10.4S14") < 0) {
    security_message(port:0, data:desc);
    exit(0);
  }
}

if (version =~ "^11") {
  if (revcomp(a:version, b:"11.4R7") < 0) {
    security_message(port:0, data:desc);
    exit(0);
  }
}

if (version =~ "^12") {
  if (revcomp(a:version, b:"12.1R6") < 0) {
    security_message(port:0, data:desc);
    exit(0);
  } else if ((revcomp(a:version, b:"12.1X44-D15") < 0) &&
             (revcomp(a:version, b:"12.1X") >= 0)) {
    security_message(port:0, data:desc);
    exit(0);
  }
}

exit(99);

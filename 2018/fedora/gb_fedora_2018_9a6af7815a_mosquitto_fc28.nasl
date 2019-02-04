###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_9a6af7815a_mosquitto_fc28.nasl 12889 2018-12-28 07:52:20Z mmartin $
#
# Fedora Update for mosquitto FEDORA-2018-9a6af7815a
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.875218");
  script_version("$Revision: 12889 $");
  script_tag(name:"last_modification", value:"$Date: 2018-12-28 08:52:20 +0100 (Fri, 28 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-10-23 12:17:05 +0200 (Tue, 23 Oct 2018)");
  script_cve_id("CVE-2018-12543");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for mosquitto FEDORA-2018-9a6af7815a");
  script_tag(name:"summary", value:"Check the version of mosquitto");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");
  script_tag(name:"insight", value:"Mosquitto is an open source message broker
  that implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1 MQTT
  provides a lightweight method of carrying out messaging using a publish/subscribe
  model. This makes it suitable for 'machine to machine' messaging such as with
  low power sensors or mobile devices such as phones, embedded computers or
  micro-controllers like the Arduino.
");
  script_tag(name:"affected", value:"mosquitto on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-9a6af7815a");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ETRJBGA6L5NLAGK4UZTUB2F6GMAXXCIS");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"mosquitto", rpm:"mosquitto~1.5.3~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

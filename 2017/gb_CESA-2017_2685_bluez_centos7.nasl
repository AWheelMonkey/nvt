###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2017_2685_bluez_centos7.nasl 7260 2017-09-26 06:48:48Z asteins $
#
# CentOS Update for bluez CESA-2017:2685 centos7 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882767");
  script_version("$Revision: 7260 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-26 08:48:48 +0200 (Tue, 26 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-14 07:16:10 +0200 (Thu, 14 Sep 2017)");
  script_cve_id("CVE-2017-1000250");
  script_tag(name:"cvss_base", value:"3.3");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for bluez CESA-2017:2685 centos7 ");
  script_tag(name: "summary", value: "Check the version of bluez");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The bluez packages contain the following 
utilities for use in Bluetooth applications: hcitool, hciattach, hciconfig, 
bluetoothd, l2ping, start scripts (Red Hat), and pcmcia configuration files.

Security Fix(es):

* An information-disclosure flaw was found in the bluetoothd implementation
of the Service Discovery Protocol (SDP). A specially crafted Bluetooth
device could, without prior pairing or user interaction, retrieve portions
of the bluetoothd process memory, including potentially sensitive
information such as Bluetooth encryption keys. (CVE-2017-1000250)

Red Hat would like to thank Armis Labs for reporting this issue.
");
  script_tag(name: "affected", value: "bluez on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2017:2685");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2017-September/022535.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"bluez", rpm:"bluez~5.44~4.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-cups", rpm:"bluez-cups~5.44~4.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-hid2hci", rpm:"bluez-hid2hci~5.44~4.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-libs", rpm:"bluez-libs~5.44~4.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"bluez-libs-devel", rpm:"bluez-libs-devel~5.44~4.el7_4", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

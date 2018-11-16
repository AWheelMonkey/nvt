###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2907-01_wpa_supplicant.nasl 12370 2018-11-16 07:56:29Z cfischer $
#
# RedHat Update for wpa_supplicant RHSA-2017:2907-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.812042");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-10-18 16:52:51 +0200 (Wed, 18 Oct 2017)");
  script_cve_id("CVE-2017-13077", "CVE-2017-13078", "CVE-2017-13080", "CVE-2017-13082",
                "CVE-2017-13086", "CVE-2017-13087", "CVE-2017-13088");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for wpa_supplicant RHSA-2017:2907-01");
  script_tag(name: "summary", value: "Check the version of wpa_supplicant");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of
  detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The wpa_supplicant packages contain an 802.1X
  Supplicant with support for WEP, WPA, WPA2 (IEEE 802.11i / RSN), and various EAP
  authentication methods. They implement key negotiation with a WPA Authenticator
  for client stations and controls the roaming and IEEE 802.11 authentication and
  association of the WLAN driver.

Security Fix(es):

* A new exploitation technique called key reinstallation attacks (KRACK)
affecting WPA2 has been discovered. A remote attacker within Wi-Fi range
could exploit these attacks to decrypt Wi-Fi traffic or possibly inject
forged Wi-Fi packets by manipulating cryptographic handshakes used by the
WPA2 protocol. (CVE-2017-13077, CVE-2017-13078, CVE-2017-13080,
CVE-2017-13082, CVE-2017-13086, CVE-2017-13087, CVE-2017-13088)

Red Hat would like to thank CERT for reporting these issues. Upstream
acknowledges Mathy Vanhoef (University of Leuven) as the original reporter
of these issues.
");
  script_tag(name: "affected", value: "wpa_supplicant on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "RHSA", value: "2017:2907-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2017-October/msg00019.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"wpa_supplicant", rpm:"wpa_supplicant~2.6~5.el7_4.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wpa_supplicant-debuginfo", rpm:"wpa_supplicant-debuginfo~2.6~5.el7_4.1", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

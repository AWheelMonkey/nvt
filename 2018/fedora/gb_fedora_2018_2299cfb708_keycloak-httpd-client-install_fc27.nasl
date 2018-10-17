###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_2299cfb708_keycloak-httpd-client-install_fc27.nasl 8731 2018-02-09 07:50:57Z asteins $
#
# Fedora Update for keycloak-httpd-client-install FEDORA-2018-2299cfb708
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
  script_oid("1.3.6.1.4.1.25623.1.0.874034");
  script_version("$Revision: 8731 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-09 08:50:57 +0100 (Fri, 09 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-01-19 07:45:32 +0100 (Fri, 19 Jan 2018)");
  script_cve_id("CVE-2017-15111", "CVE-2017-15112");
  script_tag(name:"cvss_base", value:"3.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for keycloak-httpd-client-install FEDORA-2018-2299cfb708");
  script_tag(name: "summary", value: "Check the version of keycloak-httpd-client-install");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Keycloak is a federated Identity Provider (IdP). 
Apache HTTPD supports a variety of authentication modules which can be 
configured to utilize a Keycloak IdP to perform authentication. This package 
contains libraries and tools which can automate and simplify configuring an
Apache HTTPD authentication module and registering as a client of a Keycloak 
IdP.");
  script_tag(name: "affected", value: "keycloak-httpd-client-install on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-2299cfb708");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/SHXMNT4EU3CBMQZXXQZ5DYXSUQHUS5I2");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"keycloak-httpd-client-install", rpm:"keycloak-httpd-client-install~0.8~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

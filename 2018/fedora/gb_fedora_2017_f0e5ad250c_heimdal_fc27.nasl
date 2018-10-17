###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_f0e5ad250c_heimdal_fc27.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# Fedora Update for heimdal FEDORA-2017-f0e5ad250c
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
  script_oid("1.3.6.1.4.1.25623.1.0.873993");
  script_version("$Revision: 8493 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-10 07:43:10 +0100 (Wed, 10 Jan 2018)");
  script_cve_id("CVE-2017-17439");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for heimdal FEDORA-2017-f0e5ad250c");
  script_tag(name: "summary", value: "Check the version of heimdal");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Kerberos 5 is a network authentication 
and single sign-on system. Heimdal is a free Kerberos 5 implementation without 
export restrictions written from the spec (rfc1510 and successors) including 
advanced features like thread safety, IPv6, master-slave replication of Kerberos 
Key Distribution Center server and support for ticket delegation (S4U2Self,
S4U2Proxy).
This package can coexist with MIT Kerberos 5 packages. Hesiod is disabled
by default since it is deemed too big a security risk by the packager.
");
  script_tag(name: "affected", value: "heimdal on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-f0e5ad250c");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YWC25VXGQDBBVSCTKFZUB4CD3GQO5VX4");
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

  if ((res = isrpmvuln(pkg:"heimdal", rpm:"heimdal~7.5.0~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

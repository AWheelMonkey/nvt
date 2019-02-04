###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_2575edf8d3_nss_fc28.nasl 12808 2018-12-17 13:20:13Z santu $
#
# Fedora Update for nss FEDORA-2018-2575edf8d3
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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
  script_oid("1.3.6.1.4.1.25623.1.0.875358");
  script_version("$Revision: 12808 $");
  script_cve_id("CVE-2018-12404");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-17 14:20:13 +0100 (Mon, 17 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-13 08:03:44 +0100 (Thu, 13 Dec 2018)");
  script_name("Fedora Update for nss FEDORA-2018-2575edf8d3");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-2575edf8d3");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PBWADQ5X6KOYBZHIYLMHSUYGCJ3IZNW6");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'nss'
  package(s) announced via the FEDORA-2018-2575edf8d3 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Network Security Services (NSS) is a set of libraries designed to
support cross-platform development of security-enabled client and
server applications. Applications built with NSS can support SSL v2
and v3, TLS, PKCS #5, PKCS #7, PKCS #11, PKCS #12, S/MIME, X.509
v3 certificates, and other security standards.
");

  script_tag(name:"affected", value:"nss on Fedora 28.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.40.1~1.0.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

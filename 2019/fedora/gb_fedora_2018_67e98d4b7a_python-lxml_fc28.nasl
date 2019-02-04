###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_67e98d4b7a_python-lxml_fc28.nasl 13147 2019-01-18 11:35:50Z mmartin $
#
# Fedora Update for python-lxml FEDORA-2018-67e98d4b7a
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2019 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.875391");
  script_version("$Revision: 13147 $");
  script_cve_id("CVE-2018-19787");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-18 12:35:50 +0100 (Fri, 18 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-07 04:01:51 +0100 (Mon, 07 Jan 2019)");
  script_name("Fedora Update for python-lxml FEDORA-2018-67e98d4b7a");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");

  script_xref(name:"FEDORA", value:"2018-67e98d4b7a");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PONVYPWDMAHEDLPHJ34PHRHDJMBJQNVV");

  script_tag(name:"summary", value:"The remote host is missing an update for
  the 'python-lxml' package(s) announced via the FEDORA-2018-67e98d4b7a advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"lxml is a Pythonic, mature binding for the
  libxml2 and libxslt libraries. It provides safe and convenient access to these
  libraries using the ElementTree It extends the ElementTree API significantly
  to offer support for XPath, RelaxNG, XML Schema, XSLT, C14N and much more.
  To contact the project, go to the project home page   or see our bug tracker
  at case you want to use the current ...
");

  script_tag(name:"affected", value:"python-lxml on Fedora 28.");

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

  if ((res = isrpmvuln(pkg:"python-lxml", rpm:"python-lxml~4.2.5~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

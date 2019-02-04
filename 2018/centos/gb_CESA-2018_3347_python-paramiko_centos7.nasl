###############################################################################
# OpenVAS Vulnerability Test
# $Id$
#
# CentOS Update for python-paramiko CESA-2018:3347 centos7
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
  script_oid("1.3.6.1.4.1.25623.1.0.882978");
  script_version("$Revision: 13032 $");
  script_cve_id("CVE-2018-1000805");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-01-11 08:56:51 +0100 (Fri, 11 Jan 2019) $");
  script_tag(name:"creation_date", value:"2018-12-18 07:37:43 +0100 (Tue, 18 Dec 2018)");
  script_name("CentOS Update for python-paramiko CESA-2018:3347 centos7 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");

  script_xref(name:"CESA", value:"2018:3347");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-December/023119.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'python-paramiko'
  package(s) announced via the CESA-2018:3347 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The python-paramiko package provides a Python module that implements the
SSH2 protocol for encrypted and authenticated connections to remote
machines. Unlike SSL, the SSH2 protocol does not require hierarchical
certificates signed by a powerful central authority. The protocol also
includes the ability to open arbitrary channels to remote services across
an encrypted tunnel.

Security Fix(es):

* python-paramiko: Authentication bypass in auth_handler.py
(CVE-2018-1000805)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");

  script_tag(name:"affected", value:"python-paramiko on CentOS 7.");

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

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"python-paramiko", rpm:"python-paramiko~2.1.1~9.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"python-paramiko-doc", rpm:"python-paramiko-doc~2.1.1~9.el7", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

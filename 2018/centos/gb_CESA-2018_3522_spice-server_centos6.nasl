###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_3522_spice-server_centos6.nasl 12496 2018-11-23 03:21:34Z ckuersteiner $
#
# CentOS Update for spice-server CESA-2018:3522 centos6
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
  script_oid("1.3.6.1.4.1.25623.1.0.882973");
  script_version("$Revision: 12496 $");
  script_cve_id("CVE-2017-7506");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 04:21:34 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-21 06:03:29 +0100 (Wed, 21 Nov 2018)");
  script_name("CentOS Update for spice-server CESA-2018:3522 centos6 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");

  script_xref(name:"CESA", value:"2018:3522");
  script_xref(name:"URL" , value:"http://lists.centos.org/pipermail/centos-announce/2018-November/023080.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'spice-server'
  package(s) announced via the CESA-2018:3522 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The Simple Protocol for Independent Computing Environments (SPICE) is a
remote display protocol for virtual environments. SPICE users can access a
virtualized desktop or server from the local system or any system with
network access to the server. SPICE is used in Red Hat Enterprise Linux for
viewing virtualized guests running on the Kernel-based Virtual Machine
(KVM) hypervisor or on Red Hat Enterprise Virtualization Hypervisors.

Security Fix(es):

* spice: Possible buffer overflow via invalid monitor configurations
(CVE-2017-7506)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

This issue was discovered by Frediano Ziglio (Red Hat).
");

  script_tag(name:"affected", value:"spice-server on CentOS 6.");

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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"spice-server", rpm:"spice-server~0.12.4~16.el6_10.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"spice-server-devel", rpm:"spice-server-devel~0.12.4~16.el6_10.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for spice RHSA-2015:1890-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871459");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-10-13 07:15:21 +0200 (Tue, 13 Oct 2015)");
  script_cve_id("CVE-2015-5260", "CVE-2015-5261");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for spice RHSA-2015:1890-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'spice'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The Simple Protocol for Independent Computing Environments (SPICE) is a
remote display protocol for virtual environments. SPICE users can access a
virtualized desktop or server from the local system or any system with
network access to the server. SPICE is used in Red Hat Enterprise Linux for
viewing virtualized guests running on the Kernel-based Virtual Machine
(KVM) hypervisor or on Red Hat Enterprise Virtualization Hypervisors.

A heap-based buffer overflow flaw was found in the way SPICE handled
certain guest QXL commands related to surface creation. A user in a guest
could use this flaw to read and write arbitrary memory locations on the
host. (CVE-2015-5261)

A heap-based buffer overflow flaw was found in the way spice handled
certain QXL commands related to the 'surface_id' parameter. A user in a
guest could use this flaw to crash the host QEMU-KVM process or, possibly,
execute arbitrary code with the privileges of the host QEMU-KVM process.
(CVE-2015-5260)

These issues were discovered by Frediano Ziglio of Red Hat.

All spice users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues.");
  script_tag(name:"affected", value:"spice on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"RHSA", value:"2015:1890-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2015-October/msg00010.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"spice-debuginfo", rpm:"spice-debuginfo~0.12.4~9.el7_1.3", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"spice-server", rpm:"spice-server~0.12.4~9.el7_1.3", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
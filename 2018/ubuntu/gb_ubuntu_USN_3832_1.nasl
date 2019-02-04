###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3832_1.nasl 12638 2018-12-04 08:40:36Z santu $
#
# Ubuntu Update for linux-aws USN-3832-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843840");
  script_version("$Revision: 12638 $");
  script_cve_id("CVE-2018-17972", "CVE-2018-18281", "CVE-2018-18445",
                "CVE-2018-18653", "CVE-2018-18955", "CVE-2018-6559");
  script_bugtraq_id(106054);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-04 09:40:36 +0100 (Tue, 04 Dec 2018) $");
  script_tag(name:"creation_date", value:"2018-12-04 12:40:51 +0530 (Tue, 04 Dec 2018)");
  script_name("Ubuntu Update for linux-aws USN-3832-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU18\.10");

  script_xref(name:"USN", value:"3832-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3832-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux-aws'
  package(s) announced via the USN-3832-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Jann Horn discovered that the procfs file system implementation in the
Linux kernel did not properly restrict the ability to inspect the kernel
stack of an arbitrary task. A local attacker could use this to expose
sensitive information. (CVE-2018-17972)

Jann Horn discovered that the mremap() system call in the Linux kernel did
not properly flush the TLB when completing, potentially leaving access to a
physical page after it has been released to the page allocator. A local
attacker could use this to cause a denial of service (system crash), expose
sensitive information, or possibly execute arbitrary code. (CVE-2018-18281)

It was discovered that the BPF verifier in the Linux kernel did not
correctly compute numeric bounds in some situations. A local attacker could
use this to cause a denial of service (system crash) or possibly execute
arbitrary code. (CVE-2018-18445)

Daniel Dadap discovered that the module loading implementation in the Linux
kernel did not properly enforce signed module loading when booted with UEFI
Secure Boot in some situations. A local privileged attacker could use this
to execute untrusted code in the kernel. (CVE-2018-18653)

Jann Horn discovered that the Linux kernel mishandles mapping UID or GID
ranges inside nested user namespaces in some situations. A local attacker
could use this to bypass access controls on resources outside the
namespace. (CVE-2018-18955)

Philipp Wendler discovered that the overlayfs implementation in the Linux
kernel did not properly verify the directory contents permissions from
within a unprivileged user namespace. A local attacker could use this to
expose sensitive information (protected file names). (CVE-2018-6559)");

  script_tag(name:"affected", value:"linux-aws on Ubuntu 18.10.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU18.10")
{

  if ((res = isdpkgvuln(pkg:"linux-image-4.18.0-1006-aws", ver:"4.18.0-1006.7", rls:"UBUNTU18.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"linux-image-aws", ver:"4.18.0.1006.6", rls:"UBUNTU18.10", remove_arch:TRUE )) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
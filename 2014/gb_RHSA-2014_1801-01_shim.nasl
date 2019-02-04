###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for shim RHSA-2014:1801-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.871285");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-11-05 06:22:00 +0100 (Wed, 05 Nov 2014)");
  script_cve_id("CVE-2014-3675", "CVE-2014-3676", "CVE-2014-3677");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("RedHat Update for shim RHSA-2014:1801-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'shim'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Shim is the initial UEFI bootloader that handles chaining to a trusted full
bootloader under secure boot environments.

A heap-based buffer overflow flaw was found the way shim parsed certain
IPv6 addresses. If IPv6 network booting was enabled, a malicious server
could supply a crafted IPv6 address that would cause shim to crash or,
potentially, execute arbitrary code. (CVE-2014-3676)

An out-of-bounds memory write flaw was found in the way shim processed
certain Machine Owner Keys (MOKs). A local attacker could potentially use
this flaw to execute arbitrary code on the system. (CVE-2014-3677)

An out-of-bounds memory read flaw was found in the way shim parsed certain
IPv6 packets. A specially crafted DHCPv6 packet could possibly cause shim
to crash, preventing the system from booting if IPv6 booting was enabled.
(CVE-2014-3675)

Red Hat would like to thank the SUSE Security Team for reporting these
issues.

All shim users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues. The system must be
rebooted for this update to take effect.");
  script_tag(name:"affected", value:"shim on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"RHSA", value:"2014:1801-01");
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2014-November/msg00012.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"mokutil", rpm:"mokutil~0.7~8.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"shim", rpm:"shim~0.7~8.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"shim-debuginfo", rpm:"shim-debuginfo~0.7~8.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"shim-unsigned", rpm:"shim-unsigned~0.7~8.el7_0", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
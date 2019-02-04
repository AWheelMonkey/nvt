###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2019_0049_libgudev1-219-62.el7__centos7.nasl 13297 2019-01-25 14:07:05Z santu $
#
# CentOS Update for libgudev1-219-62.el7_ CESA-2019:0049 centos7
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
  script_oid("1.3.6.1.4.1.25623.1.0.882992");
  script_version("$Revision: 13297 $");
  script_cve_id("CVE-2018-15688", "CVE-2018-16864", "CVE-2018-16865");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2019-01-25 15:07:05 +0100 (Fri, 25 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-16 04:01:18 +0100 (Wed, 16 Jan 2019)");
  script_name("CentOS Update for libgudev1-219-62.el7_ CESA-2019:0049 centos7 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");

  script_xref(name:"CESA", value:"2019:0049");
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2019-January/023143.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libgudev1-219-62.el7'
  package(s) announced via the CESA-2019:0049 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The systemd packages contain systemd, a system and service manager for
Linux, compatible with the SysV and LSB init scripts. It provides
aggressive parallelism capabilities, uses socket and D-Bus activation for
starting services, offers on-demand starting of daemons, and keeps track of
processes using Linux cgroups. In addition, it supports snapshotting and
restoring of the system state, maintains mount and automount points, and
implements an elaborate transactional dependency-based service control
logic. It can also work as a drop-in replacement for sysvinit.

Security Fix(es):

* systemd: Out-of-bounds heap write in systemd-networkd dhcpv6 option
handling (CVE-2018-15688)

* systemd: stack overflow when calling syslog from a command with long
cmdline (CVE-2018-16864)

* systemd: stack overflow when receiving many journald entries
(CVE-2018-16865)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.

Red Hat would like to thank Ubuntu Security Team for reporting
CVE-2018-15688 and Qualys Research Labs for reporting CVE-2018-16864 and
CVE-2018-16865. Upstream acknowledges Felix Wilhelm (Google) as the
original reporter of CVE-2018-15688.
");

  script_tag(name:"affected", value:"libgudev1-219-62.el7_ on CentOS 7.");

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

  if ((res = isrpmvuln(pkg:"libgudev1-219-62.el7", rpm:"libgudev1-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libgudev1-devel-219-62.el7", rpm:"libgudev1-devel-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-219-62.el7", rpm:"systemd-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-devel-219-62.el7", rpm:"systemd-devel-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-journal-gateway-219-62.el7", rpm:"systemd-journal-gateway-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-libs-219-62.el7", rpm:"systemd-libs-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-networkd-219-62.el7", rpm:"systemd-networkd-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-python-219-62.el7", rpm:"systemd-python-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-resolved-219-62.el7", rpm:"systemd-resolved-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"systemd-sysv-219-62.el7", rpm:"systemd-sysv-219-62.el7~6.2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

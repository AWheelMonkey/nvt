###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for foomatic RHSA-2011:1109-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL", value:"https://www.redhat.com/archives/rhsa-announce/2011-August/msg00000.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870462");
  script_version("$Revision: 12497 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-23 09:28:21 +0100 (Fri, 23 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-08-12 15:49:01 +0200 (Fri, 12 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name:"RHSA", value:"2011:1109-01");
  script_cve_id("CVE-2011-2697");
  script_name("RedHat Update for foomatic RHSA-2011:1109-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'foomatic'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(5|4)");
  script_tag(name:"affected", value:"foomatic on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Foomatic is a comprehensive, spooler-independent database of printers,
  printer drivers, and driver descriptions. The package also includes
  spooler-independent command line interfaces to manipulate queues and to
  print files and manipulate print jobs. foomatic-rip is a print filter
  written in Perl.

  An input sanitization flaw was found in the foomatic-rip print filter. An
  attacker could submit a print job with the username, title, or job options
  set to appear as a command line option that caused the filter to use a
  specified PostScript printer description (PPD) file, rather than the
  administrator-set one. This could lead to arbitrary code execution with the
  privileges of the &quot;lp&quot; user. (CVE-2011-2697)

  All foomatic users should upgrade to this updated package, which contains
  a backported patch to resolve this issue.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"foomatic", rpm:"foomatic~3.0.2~38.3.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"foomatic-debuginfo", rpm:"foomatic-debuginfo~3.0.2~38.3.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"foomatic", rpm:"foomatic~3.0.2~3.2.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"foomatic-debuginfo", rpm:"foomatic-debuginfo~3.0.2~3.2.el4", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

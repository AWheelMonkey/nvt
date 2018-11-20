###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for ruby RHSA-2011:0910-01
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2011-June/msg00025.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870672");
  script_version("$Revision: 12382 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:51:56 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2012-06-06 10:45:17 +0530 (Wed, 06 Jun 2012)");
  script_cve_id("CVE-2011-0188", "CVE-2011-1004", "CVE-2011-1005");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name:"RHSA", value:"2011:0910-01");
  script_name("RedHat Update for ruby RHSA-2011:0910-01");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ruby'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name:"affected", value:"ruby on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Ruby is an extensible, interpreted, object-oriented, scripting language. It
  has features to process text files and to do system management tasks.

  A flaw was found in the way large amounts of memory were allocated on
  64-bit systems when using the BigDecimal class. A context-dependent
  attacker could use this flaw to cause memory corruption, causing a Ruby
  application that uses the BigDecimal class to crash or, possibly, execute
  arbitrary code. This issue did not affect 32-bit systems. (CVE-2011-0188)

  A race condition flaw was found in the remove system entries method in the
  FileUtils module. If a local user ran a Ruby script that uses this method,
  a local attacker could use this flaw to delete arbitrary files and
  directories accessible to that user via a symbolic link attack.
  (CVE-2011-1004)

  A flaw was found in the method for translating an exception message into a
  string in the Exception class. A remote attacker could use this flaw to
  bypass safe level 4 restrictions, allowing untrusted (tainted) code to
  modify arbitrary, trusted (untainted) strings, which safe level 4
  restrictions would otherwise prevent. (CVE-2011-1005)

  Red Hat would like to thank Drew Yao of Apple Product Security for
  reporting the CVE-2011-0188 issue.

  All Ruby users should upgrade to these updated packages, which contain
  backported patches to resolve these issues.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"ruby", rpm:"ruby~1.8.7.299~7.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-debuginfo", rpm:"ruby-debuginfo~1.8.7.299~7.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-irb", rpm:"ruby-irb~1.8.7.299~7.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ruby-libs", rpm:"ruby-libs~1.8.7.299~7.el6_1.1", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

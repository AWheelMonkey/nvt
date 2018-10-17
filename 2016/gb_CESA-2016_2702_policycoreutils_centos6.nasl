###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for policycoreutils CESA-2016:2702 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882599");
  script_version("$Revision: 8029 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-07 13:38:42 +0100 (Thu, 07 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-11-20 05:37:33 +0100 (Sun, 20 Nov 2016)");
  script_cve_id("CVE-2016-7545");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for policycoreutils CESA-2016:2702 centos6 ");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The policycoreutils packages contain the 
core policy utilities required to manage a SELinux environment.

Security Fix(es):

* It was found that the sandbox tool provided in policycoreutils was
vulnerable to a TIOCSTI ioctl attack. A specially crafted program executed
via the sandbox command could use this flaw to execute arbitrary commands
in the context of the parent shell, escaping the sandbox. (CVE-2016-7545)
");
  script_tag(name: "affected", value: "policycoreutils on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:2702");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-November/022147.html");
  script_tag(name: "summary" , value: "Check for the Version of policycoreutils");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"policycoreutils", rpm:"policycoreutils~2.0.83~30.1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"policycoreutils-gui", rpm:"policycoreutils-gui~2.0.83~30.1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"policycoreutils-newrole", rpm:"policycoreutils-newrole~2.0.83~30.1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"policycoreutils-python", rpm:"policycoreutils-python~2.0.83~30.1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"policycoreutils-sandbox", rpm:"policycoreutils-sandbox~2.0.83~30.1.el6_8", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

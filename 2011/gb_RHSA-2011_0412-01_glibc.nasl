###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for glibc RHSA-2011:0412-01
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

include("revisions-lib.inc");
tag_insight = "The glibc packages contain the standard C libraries used by multiple
  programs on the system. These packages contain the standard C and the
  standard math libraries. Without these two libraries, a Linux system cannot
  function properly.

  The fix for CVE-2010-3847 introduced a regression in the way the dynamic
  loader expanded the $ORIGIN dynamic string token specified in the RPATH and
  RUNPATH entries in the ELF library header. A local attacker could use this
  flaw to escalate their privileges via a setuid or setgid program using
  such a library. (CVE-2011-0536)
  
  It was discovered that the glibc addmntent() function did not sanitize its
  input properly. A local attacker could possibly use this flaw to inject
  malformed lines into /etc/mtab via certain setuid mount helpers, if the
  attacker were allowed to mount to an arbitrary directory under their
  control. (CVE-2010-0296)
  
  It was discovered that the glibc fnmatch() function did not properly
  restrict the use of alloca(). If the function was called on sufficiently
  large inputs, it could cause an application using fnmatch() to crash or,
  possibly, execute arbitrary code with the privileges of the application.
  (CVE-2011-1071)
  
  It was discovered that the locale command did not produce properly escaped
  output as required by the POSIX specification. If an attacker were able to
  set the locale environment variables in the environment of a script that
  performed shell evaluation on the output of the locale command, and that
  script were run with different privileges than the attacker's, it could
  execute arbitrary code with the privileges of the script. (CVE-2011-1095)
  
  All users should upgrade to these updated packages, which contain
  backported patches to correct these issues.";

tag_affected = "glibc on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-April/msg00000.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870417");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-04-06 16:20:31 +0200 (Wed, 06 Apr 2011)");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2011:0412-01");
  script_cve_id("CVE-2010-0296", "CVE-2011-0536", "CVE-2011-1071", "CVE-2011-1095", "CVE-2010-3847");
  script_name("RedHat Update for glibc RHSA-2011:0412-01");

  script_tag(name:"summary", value:"Check for the Version of glibc");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"glibc", rpm:"glibc~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-common", rpm:"glibc-common~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-debuginfo", rpm:"glibc-debuginfo~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-debuginfo-common", rpm:"glibc-debuginfo-common~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-devel", rpm:"glibc-devel~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-headers", rpm:"glibc-headers~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"glibc-utils", rpm:"glibc-utils~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"nscd", rpm:"nscd~2.5~58.el5_6.2", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

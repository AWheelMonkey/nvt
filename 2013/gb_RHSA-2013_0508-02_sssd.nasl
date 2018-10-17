###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for sssd RHSA-2013:0508-02
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "The System Security Services Daemon (SSSD) provides a set of daemons to
  manage access to remote directories and authentication mechanisms. It
  provides an NSS and PAM interface toward the system and a pluggable
  back-end system to connect to multiple different account sources. It is
  also the basis to provide client auditing and policy services for projects
  such as FreeIPA.

  A race condition was found in the way SSSD copied and removed user home
  directories. A local attacker who is able to write into the home directory
  of a different user who is being removed could use this flaw to perform
  symbolic link attacks, possibly allowing them to modify and delete
  arbitrary files with the privileges of the root user. (CVE-2013-0219)

  Multiple out-of-bounds memory read flaws were found in the way the autofs
  and SSH service responders parsed certain SSSD packets. An attacker could
  spend a specially-crafted packet that, when processed by the autofs or SSH
  service responders, would cause SSSD to crash. This issue only caused a
  temporary denial of service, as SSSD was automatically restarted by the
  monitor process after the crash. (CVE-2013-0220)

  The CVE-2013-0219 and CVE-2013-0220 issues were discovered by Florian
  Weimer of the Red Hat Product Security Team.

  These updated sssd packages also include numerous bug fixes and
  enhancements. Space precludes documenting all of these changes in this
  advisory. Users are directed to the Red Hat Enterprise Linux 6.4 Technical
  Notes, linked to in the References, for information on the most significant
  of these changes.

  All SSSD users are advised to upgrade to these updated packages, which
  upgrade SSSD to upstream version 1.9 to correct these issues, fix these
  bugs and add these enhancements.";


tag_affected = "sssd on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2013-February/msg00050.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870930");
  script_version("$Revision: 9353 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-22 10:02:09 +0530 (Fri, 22 Feb 2013)");
  script_cve_id("CVE-2013-0219", "CVE-2013-0220");
  script_bugtraq_id(57539);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "RHSA", value: "2013:0508-02");
  script_name("RedHat Update for sssd RHSA-2013:0508-02");

  script_tag(name: "summary" , value: "Check for the Version of sssd");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"libipa_hbac", rpm:"libipa_hbac~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libipa_hbac-python", rpm:"libipa_hbac-python~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsss_autofs", rpm:"libsss_autofs~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsss_idmap", rpm:"libsss_idmap~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libsss_sudo", rpm:"libsss_sudo~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sssd", rpm:"sssd~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sssd-client", rpm:"sssd-client~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"sssd-debuginfo", rpm:"sssd-debuginfo~1.9.2~82.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

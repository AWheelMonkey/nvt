###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for dovecot RHSA-2013:0520-02
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

tag_insight = "Dovecot is an IMAP server, written with security primarily in mind, for
  Linux and other UNIX-like systems. It also contains a small POP3 server. It
  supports mail in either of maildir or mbox formats. The SQL drivers and
  authentication plug-ins are provided as sub-packages.

  Two flaws were found in the way some settings were enforced by the
  script-login functionality of Dovecot. A remote, authenticated user could
  use these flaws to bypass intended access restrictions or conduct a
  directory traversal attack by leveraging login scripts. (CVE-2011-2166,
  CVE-2011-2167)

  A flaw was found in the way Dovecot performed remote server identity
  verification, when it was configured to proxy IMAP and POP3 connections to
  remote hosts using TLS/SSL protocols. A remote attacker could use this flaw
  to conduct man-in-the-middle attacks using an X.509 certificate issued by
  a trusted Certificate Authority (for a different name). (CVE-2011-4318)

  This update also fixes the following bug:

  * When a new user first accessed their IMAP inbox, Dovecot was, under some
  circumstances, unable to change the group ownership of the inbox directory
  in the user's Maildir location to match that of the user's mail spool
  (/var/mail/$USER). This correctly generated an Internal error occurred
  message. However, with a subsequent attempt to access the inbox, Dovecot
  saw that the directory already existed and proceeded with its operation,
  leaving the directory with incorrectly set permissions. This update
  corrects the underlying permissions setting error. When a new user now
  accesses their inbox for the first time, and it is not possible to set
  group ownership, Dovecot removes the created directory and generates an
  error message instead of keeping the directory with incorrect group
  ownership. (BZ#697620)

  Users of dovecot are advised to upgrade to these updated packages, which
  contain backported patches to correct these issues. After installing the
  updated packages, the dovecot service will be restarted automatically.";


tag_affected = "dovecot on Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2013-February/msg00059.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870922");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2013-02-22 10:01:43 +0530 (Fri, 22 Feb 2013)");
  script_cve_id("CVE-2011-2166", "CVE-2011-2167", "CVE-2011-4318");
  script_bugtraq_id(48003, 50709);
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_xref(name: "RHSA", value: "2013:0520-02");
  script_name("RedHat Update for dovecot RHSA-2013:0520-02");

  script_tag(name: "summary" , value: "Check for the Version of dovecot");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

  if ((res = isrpmvuln(pkg:"dovecot", rpm:"dovecot~2.0.9~5.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dovecot-debuginfo", rpm:"dovecot-debuginfo~2.0.9~5.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dovecot-mysql", rpm:"dovecot-mysql~2.0.9~5.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dovecot-pgsql", rpm:"dovecot-pgsql~2.0.9~5.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"dovecot-pigeonhole", rpm:"dovecot-pigeonhole~2.0.9~5.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

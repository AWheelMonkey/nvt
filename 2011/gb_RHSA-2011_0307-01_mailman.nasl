###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for mailman RHSA-2011:0307-01
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

tag_insight = "Mailman is a program used to help manage email discussion lists.

  Multiple input sanitization flaws were found in the way Mailman displayed
  usernames of subscribed users on certain pages. If a user who is subscribed
  to a mailing list were able to trick a victim into visiting one of those
  pages, they could perform a cross-site scripting (XSS) attack against the
  victim. (CVE-2011-0707)
  
  Multiple input sanitization flaws were found in the way Mailman displayed
  mailing list information. A mailing list administrator could use this flaw
  to conduct a cross-site scripting (XSS) attack against victims viewing a
  list's &quot;listinfo&quot; page. (CVE-2008-0564, CVE-2010-3089)
  
  Red Hat would like to thank Mark Sapiro for reporting the CVE-2011-0707 and
  CVE-2010-3089 issues.
  
  Users of mailman should upgrade to this updated package, which contains
  backported patches to correct these issues.";

tag_affected = "mailman on Red Hat Enterprise Linux (v. 5 server),
  Red Hat Enterprise Linux AS version 4,
  Red Hat Enterprise Linux ES version 4,
  Red Hat Enterprise Linux WS version 4";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-March/msg00003.html");
  script_oid("1.3.6.1.4.1.25623.1.0.870398");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-03-07 06:45:55 +0100 (Mon, 07 Mar 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_xref(name: "RHSA", value: "2011:0307-01");
  script_cve_id("CVE-2008-0564", "CVE-2010-3089", "CVE-2011-0707");
  script_name("RedHat Update for mailman RHSA-2011:0307-01");

  script_tag(name:"summary", value:"Check for the Version of mailman");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_(5|4)");
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

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"mailman", rpm:"mailman~2.1.9~6.el5_6.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mailman-debuginfo", rpm:"mailman-debuginfo~2.1.9~6.el5_6.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "RHENT_4")
{

  if ((res = isrpmvuln(pkg:"mailman", rpm:"mailman~2.1.5.1~34.rhel4.7", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mailman-debuginfo", rpm:"mailman-debuginfo~2.1.5.1~34.rhel4.7", rls:"RHENT_4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

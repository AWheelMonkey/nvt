###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for finch CESA-2012:1102 centos6 
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

include("revisions-lib.inc");
tag_insight = "Pidgin is an instant messaging program which can log in to multiple
  accounts on multiple instant messaging networks simultaneously.

  A flaw was found in the way the Pidgin MSN protocol plug-in processed text
  that was not encoded in UTF-8. A remote attacker could use this flaw to
  crash Pidgin by sending a specially-crafted MSN message. (CVE-2012-1178)
  
  An input validation flaw was found in the way the Pidgin MSN protocol
  plug-in handled MSN notification messages. A malicious server or a remote
  attacker could use this flaw to crash Pidgin by sending a specially-crafted
  MSN notification message. (CVE-2012-2318)
  
  A buffer overflow flaw was found in the Pidgin MXit protocol plug-in. A
  remote attacker could use this flaw to crash Pidgin by sending a MXit
  message containing specially-crafted emoticon tags. (CVE-2012-3374)
  
  Red Hat would like to thank the Pidgin project for reporting the
  CVE-2012-3374 issue. Upstream acknowledges Ulf H�rnhammar as the original
  reporter of CVE-2012-3374.
  
  All Pidgin users should upgrade to these updated packages, which contain
  backported patches to resolve these issues. Pidgin must be restarted for
  this update to take effect.";

tag_affected = "finch on CentOS 6";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2012-July/018757.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881235");
  script_version("$Revision: 8671 $");
  script_tag(name:"last_modification", value:"$Date: 2018-02-05 17:38:48 +0100 (Mon, 05 Feb 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 16:54:07 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2012-1178", "CVE-2012-2318", "CVE-2012-3374");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2012:1102");
  script_name("CentOS Update for finch CESA-2012:1102 centos6 ");

  script_tag(name: "summary" , value: "Check for the Version of finch");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"finch", rpm:"finch~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-devel", rpm:"finch-devel~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple", rpm:"libpurple~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-devel", rpm:"libpurple-devel~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-perl", rpm:"libpurple-perl~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl", rpm:"libpurple-tcl~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin", rpm:"pidgin~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-devel", rpm:"pidgin-devel~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-docs", rpm:"pidgin-docs~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-perl", rpm:"pidgin-perl~2.7.9~5.el6.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for finch CESA-2009:1453 centos5 i386
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
tag_insight = "Pidgin is an instant messaging program which can log in to multiple
  accounts on multiple instant messaging networks simultaneously. Info/Query
  (IQ) is an Extensible Messaging and Presence Protocol (XMPP) specific
  request-response mechanism.

  A NULL pointer dereference flaw was found in the way the Pidgin XMPP
  protocol plug-in processes IQ error responses when trying to fetch a custom
  smiley. A remote client could send a specially-crafted IQ error response
  that would crash Pidgin. (CVE-2009-3085)
  
  A NULL pointer dereference flaw was found in the way the Pidgin IRC
  protocol plug-in handles IRC topics. A malicious IRC server could send a
  specially-crafted IRC TOPIC message, which once received by Pidgin, would
  lead to a denial of service (Pidgin crash). (CVE-2009-2703)
  
  It was discovered that, when connecting to certain, very old Jabber servers
  via XMPP, Pidgin may ignore the &quot;Require SSL/TLS&quot; setting. In these
  situations, a non-encrypted connection is established rather than the
  connection failing, causing the user to believe they are using an encrypted
  connection when they are not, leading to sensitive information disclosure
  (session sniffing). (CVE-2009-3026)
  
  A NULL pointer dereference flaw was found in the way the Pidgin MSN
  protocol plug-in handles improper MSNSLP invitations. A remote attacker
  could send a specially-crafted MSNSLP invitation request, which once
  accepted by a valid Pidgin user, would lead to a denial of service (Pidgin
  crash). (CVE-2009-3083)
  
  These packages upgrade Pidgin to version 2.6.2. Refer to the Pidgin release
  notes for a full list of changes: http://developer.pidgin.im/wiki/ChangeLog
  
  All Pidgin users should upgrade to these updated packages, which correct
  these issues. Pidgin must be restarted for this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "finch on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-October/016269.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880769");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2009:1453");
  script_cve_id("CVE-2009-2703", "CVE-2009-3026", "CVE-2009-3083", "CVE-2009-3085");
  script_name("CentOS Update for finch CESA-2009:1453 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of finch");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"finch", rpm:"finch~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"finch-devel", rpm:"finch-devel~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple", rpm:"libpurple~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-devel", rpm:"libpurple-devel~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-perl", rpm:"libpurple-perl~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libpurple-tcl", rpm:"libpurple-tcl~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin", rpm:"pidgin~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-devel", rpm:"pidgin-devel~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"pidgin-perl", rpm:"pidgin-perl~2.6.2~2.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

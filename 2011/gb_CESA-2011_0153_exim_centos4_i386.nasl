###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for exim CESA-2011:0153 centos4 i386
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
tag_insight = "Exim is a mail transport agent (MTA) developed at the University of
  Cambridge for use on UNIX systems connected to the Internet.

  A privilege escalation flaw was discovered in Exim. If an attacker were
  able to gain access to the &quot;exim&quot; user, they could cause Exim to execute
  arbitrary commands as the root user. (CVE-2010-4345)
  
  This update adds a new configuration file, &quot;/etc/exim/trusted-configs&quot;. To
  prevent Exim from running arbitrary commands as root, Exim will now drop
  privileges when run with a configuration file not listed as trusted. This
  could break backwards compatibility with some Exim configurations, as the
  trusted-configs file only trusts &quot;/etc/exim/exim.conf&quot; and
  &quot;/etc/exim/exim4.conf&quot; by default. If you are using a configuration file
  not listed in the new trusted-configs file, you will need to add it
  manually.
  
  Additionally, Exim will no longer allow a user to execute exim as root with
  the -D command line option to override macro definitions. All macro
  definitions that require root permissions must now reside in a trusted
  configuration file.
  
  Users of Exim are advised to upgrade to these updated packages, which
  contain a backported patch to correct this issue. After installing this
  update, the exim daemon will be restarted automatically.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "exim on CentOS 4";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-January/017243.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880468");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-31 15:15:14 +0100 (Mon, 31 Jan 2011)");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:0153");
  script_cve_id("CVE-2010-4345");
  script_name("CentOS Update for exim CESA-2011:0153 centos4 i386");

  script_tag(name:"summary", value:"Check for the Version of exim");
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

if(release == "CentOS4")
{

  if ((res = isrpmvuln(pkg:"exim", rpm:"exim~4.43~1.RHEL4.5.el4_8.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"exim-doc", rpm:"exim-doc~4.43~1.RHEL4.5.el4_8.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"exim-mon", rpm:"exim-mon~4.43~1.RHEL4.5.el4_8.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"exim-sa", rpm:"exim-sa~4.43~1.RHEL4.5.el4_8.3", rls:"CentOS4")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

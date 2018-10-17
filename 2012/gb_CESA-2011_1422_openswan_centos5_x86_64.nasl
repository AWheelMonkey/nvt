###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for openswan CESA-2011:1422 centos5 x86_64
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
tag_insight = "Openswan is a free implementation of Internet Protocol Security (IPsec)
  and Internet Key Exchange (IKE). IPsec uses strong cryptography to provide
  both authentication and encryption services. These services allow you to
  build secure tunnels through untrusted networks.

  A use-after-free flaw was found in the way Openswan's pluto IKE daemon used
  cryptographic helpers. A remote, authenticated attacker could send a
  specially-crafted IKE packet that would crash the pluto daemon. This issue
  only affected SMP (symmetric multiprocessing) systems that have the
  cryptographic helpers enabled. The helpers are disabled by default on Red
  Hat Enterprise Linux 5, but enabled by default on Red Hat Enterprise Linux
  6. (CVE-2011-4073)
  
  Red Hat would like to thank the Openswan project for reporting this issue.
  Upstream acknowledges Petar Tsankov, Mohammad Torabi Dashti and David Basin
  of the information security group at ETH Zurich as the original reporters.
  
  All users of openswan are advised to upgrade to these updated packages,
  which contain a backported patch to correct this issue. After installing
  this update, the ipsec service will be restarted automatically.";

tag_affected = "openswan on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-November/018144.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881379");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:37:46 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2011-4073");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2011:1422");
  script_name("CentOS Update for openswan CESA-2011:1422 centos5 x86_64");

  script_tag(name: "summary" , value: "Check for the Version of openswan");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"openswan", rpm:"openswan~2.6.21~5.el5_7.6", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openswan-doc", rpm:"openswan-doc~2.6.21~5.el5_7.6", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

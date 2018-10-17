###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for axis CESA-2014:1193 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882024");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-09-16 06:03:37 +0200 (Tue, 16 Sep 2014)");
  script_cve_id("CVE-2014-3596", "CVE-2012-5784");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("CentOS Update for axis CESA-2014:1193 centos5 ");
  script_tag(name: "insight", value: "Apache Axis is an implementation of SOAP
(Simple Object Access Protocol). It can be used to build both web service clients
and servers.

It was discovered that Axis incorrectly extracted the host name from an
X.509 certificate subject's Common Name (CN) field. A man-in-the-middle
attacker could use this flaw to spoof an SSL server using a specially
crafted X.509 certificate. (CVE-2014-3596)

For additional information on this flaw, refer to the Knowledgebase article
in the References section.

This issue was discovered by David Jorm and Arun Neelicattu of Red Hat
Product Security.

All axis users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. Applications using Apache
Axis must be restarted for this update to take effect.

4. Solution:

Before applying this update, make sure all previously released errata
relevant to your system have been applied.

This update is available via the Red Hat Network. Details on how to use the
Red Hat Network to apply this update are available at
https://access.redhat.com/articles/11258

5. Bugs fixed (https://bugzilla.redhat.com):

1129935 - CVE-2014-3596 axis: SSL hostname verification bypass, incomplete
CVE-2012-5784 fix

6. Package List:

Red Hat Enterprise Linux Desktop (v. 5 client):

Source:
axis-1.2.1-2jpp.8.el5_10.src.rpm

i386:
axis-1.2.1-2jpp.8.el5_10.i386.rpm
axis-debuginfo-1.2.1-2jpp.8.el5_10.i386.rpm

x86_64:
axis-1.2.1-2jpp.8.el5_10.x86_64.rpm
axis-debuginfo-1.2.1-2jpp.8.el5_10.x86_64.rpm

Red Hat Enterprise Linux Desktop Workstation (v. 5 client):

Source:
axis-1.2.1-2jpp.8.el5_10.src.rpm

i386:
axis-debuginfo-1.2.1-2jpp.8.el5_10.i386.rpm
axis-javadoc-1.2.1-2jpp.8.el5_10.i386.rpm
axis-manual-1.2.1-2jpp.8.el5_10.i386.rpm

x86_64:
axis-debuginfo-1.2.1-2jpp.8.el5_10.x86_64.rpm
axis-javadoc-1.2.1-2jpp.8.el5_10.x86_64.rpm
axis-manual-1.2.1-2jpp.8.el5_10.x86_64.rpm

Red Hat Enterprise Linux (v. 5 server):

Source:
axis-1.2.1-2jpp.8.el5_10.src.rpm

i386:
axis-1.2.1-2jpp.8.el5_10.i386.rpm
axis-debuginfo-1.2.1-2jpp.8.el5_10.i386.rpm
axis-javadoc-1.2.1-2jpp.8.el5_10.i386.rpm
axis-manual-1.2.1-2jpp.8.el5_10.i386.rpm

ia64:
axis-1.2.1-2jpp.8.el5_10.ia64.rpm
axis-debuginfo-1.2.1-2jpp.8.el5_10.ia64.rpm
axis-javadoc-1.2.1-2jpp.8.el5_10.ia64.rpm
axis-manual-1.2.1-2jpp.8.el5_10.ia64.rpm

ppc:
axis-1.2.1-2jpp.8.el5_10.ppc.rpm
axis-debuginfo-1.2.1-2jpp.8.el5_10.ppc.rpm
axis-javadoc-1.2.1-2jpp.8.el5_10.ppc.rpm
axis-manual-1.2.1-2jpp.8.el5_10.ppc.rpm

s390x:
axis-1.2.1-2jpp.8.el5_10.s390x ...

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "axis on CentOS 5");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "CESA", value: "2014:1193");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-September/020562.html");
  script_tag(name:"summary", value:"Check for the Version of axis");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"axis", rpm:"axis~1.2.1~2jpp.8.el5_10", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"axis-javadoc", rpm:"axis-javadoc~1.2.1~2jpp.8.el5_10", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"axis-manual", rpm:"axis-manual~1.2.1~2jpp.8.el5_10", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

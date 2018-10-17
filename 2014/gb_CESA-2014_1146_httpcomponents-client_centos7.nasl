###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for httpcomponents-client CESA-2014:1146 centos7
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
  script_oid("1.3.6.1.4.1.25623.1.0.882002");
  script_version("$Revision: 9373 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:57:18 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2014-09-10 06:19:32 +0200 (Wed, 10 Sep 2014)");
  script_cve_id("CVE-2014-3577", "CVE-2012-6153");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("CentOS Update for httpcomponents-client CESA-2014:1146 centos7 ");
  script_tag(name: "insight", value: "HttpClient is an HTTP/1.1 compliant HTTP
agent implementation based on httpcomponents HttpCore.

It was discovered that the HttpClient incorrectly extracted host name from
an X.509 certificate subject's Common Name (CN) field. A man-in-the-middle
attacker could use this flaw to spoof an SSL server using a specially
crafted X.509 certificate. (CVE-2014-3577)

For additional information on this flaw, refer to the Knowledgebase
article in the References section.

All httpcomponents-client users are advised to upgrade to these updated
packages, which contain a backported patch to correct this issue.

4. Solution:

Before applying this update, make sure all previously released errata
relevant to your system have been applied.

This update is available via the Red Hat Network. Details on how to use the
Red Hat Network to apply this update are available at
https://access.redhat.com/articles/11258

5. Bugs fixed (https://bugzilla.redhat.com/):

1129074 - CVE-2014-3577 Apache HttpComponents client: SSL hostname verification
bypass, incomplete CVE-2012-6153 fix

6. Package List:

Red Hat Enterprise Linux Client Optional (v. 7):

Source:
httpcomponents-client-4.2.5-5.el7_0.src.rpm

noarch:
httpcomponents-client-4.2.5-5.el7_0.noarch.rpm
httpcomponents-client-javadoc-4.2.5-5.el7_0.noarch.rpm

Red Hat Enterprise Linux ComputeNode Optional (v. 7):

Source:
httpcomponents-client-4.2.5-5.el7_0.src.rpm

noarch:
httpcomponents-client-4.2.5-5.el7_0.noarch.rpm
httpcomponents-client-javadoc-4.2.5-5.el7_0.noarch.rpm

Red Hat Enterprise Linux Server (v. 7):

Source:
httpcomponents-client-4.2.5-5.el7_0.src.rpm

noarch:
httpcomponents-client-4.2.5-5.el7_0.noarch.rpm

Red Hat Enterprise Linux Server Optional (v. 7):

Source:
httpcomponents-client-4.2.5-5.el7_0.src.rpm

noarch:
httpcomponents-client-4.2.5-5.el7_0.noarch.rpm
httpcomponents-client-javadoc-4.2.5-5.el7_0.noarch.rpm

Red Hat Enterprise Linux Workstation (v. 7):

Source:
httpcomponents-client-4.2.5-5.el7_0.src.rpm

noarch:
httpcomponents-client-4.2.5-5.el7_0.noarch.rpm

Red Hat Enterprise Linux Workstation Optional (v. 7):

noarch:
httpcomponents-client-javadoc-4.2.5-5.el7_0.noarch.rpm

These packages are GPG signed by Red Hat for security.  Our key and
details on how to verify the signature are available from
https://access.redhat.com/security/team/key/#package

7. References:

https://www.redhat.com/security/data

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "httpcomponents-client on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name: "CESA", value: "2014:1146");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2014-September/020530.html");
  script_tag(name:"summary", value:"Check for the Version of httpcomponents-client");
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

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"httpcomponents-client", rpm:"httpcomponents-client~4.2.5~5.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"httpcomponents-client-javadoc", rpm:"httpcomponents-client-javadoc~4.2.5~5.el7_0", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for java-1.7.0-openjdk RHSA-2014:0026-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.871114");
  script_version("$Revision: 12370 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 08:56:29 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2014-01-21 13:45:04 +0530 (Tue, 21 Jan 2014)");
  script_cve_id("CVE-2013-5878", "CVE-2013-5884", "CVE-2013-5893", "CVE-2013-5896",
                "CVE-2013-5907", "CVE-2013-5910", "CVE-2014-0368", "CVE-2014-0373",
                "CVE-2014-0376", "CVE-2014-0411", "CVE-2014-0416", "CVE-2014-0422",
                "CVE-2014-0423", "CVE-2014-0428");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for java-1.7.0-openjdk RHSA-2014:0026-01");

  tag_insight = "These packages provide the OpenJDK 7 Java Runtime Environment and the
OpenJDK 7 Software Development Kit.

An input validation flaw was discovered in the font layout engine in the 2D
component. A specially crafted font file could trigger Java Virtual Machine
memory corruption when processed. An untrusted Java application or applet
could possibly use this flaw to bypass Java sandbox restrictions.
(CVE-2013-5907)

Multiple improper permission check issues were discovered in the CORBA,
JNDI, and Libraries components in OpenJDK. An untrusted Java application or
applet could use these flaws to bypass Java sandbox restrictions.
(CVE-2014-0428, CVE-2014-0422, CVE-2013-5893)

Multiple improper permission check issues were discovered in the
Serviceability, Security, CORBA, JAAS, JAXP, and Networking components in
OpenJDK. An untrusted Java application or applet could use these flaws to
bypass certain Java sandbox restrictions. (CVE-2014-0373, CVE-2013-5878,
CVE-2013-5910, CVE-2013-5896, CVE-2013-5884, CVE-2014-0416, CVE-2014-0376,
CVE-2014-0368)

It was discovered that the Beans component did not restrict processing of
XML external entities. This flaw could cause a Java application using Beans
to leak sensitive information, or affect application availability.
(CVE-2014-0423)

It was discovered that the JSSE component could leak timing information
during the TLS/SSL handshake. This could possibly lead to disclosure of
information about the used encryption keys. (CVE-2014-0411)

Note: The java-1.7.0-openjdk package shipped with Red Hat Enterprise Linux
6.5 via RHBA-2013:1611 replaced 'java7' with 'java' in the provides list.
This update re-adds 'java7' to the provides list to maintain backwards
compatibility with releases prior to Red Hat Enterprise Linux 6.5.

Note: If the web browser plug-in provided by the icedtea-web package was
installed, the issues exposed via Java applets could have been exploited
without user interaction if a user visited a malicious website.

All users of java-1.7.0-openjdk are advised to upgrade to these updated
packages, which resolve these issues. All running instances of OpenJDK Java
must be restarted for the update to take effect.
";

  tag_affected = "java-1.7.0-openjdk on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2014:0026-01");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2014-January/msg00008.html");
  script_tag(name:"summary", value:"Check for the Version of java-1.7.0-openjdk");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_6");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk", rpm:"java-1.7.0-openjdk~1.7.0.51~2.4.4.1.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-debuginfo", rpm:"java-1.7.0-openjdk-debuginfo~1.7.0.51~2.4.4.1.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-devel", rpm:"java-1.7.0-openjdk-devel~1.7.0.51~2.4.4.1.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1.7.0-openjdk-javadoc", rpm:"java-1.7.0-openjdk-javadoc~1.7.0.51~2.4.4.1.el6_5", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

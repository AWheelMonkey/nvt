###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2015_0773_1.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for java-1_8_0-openjdk openSUSE-SU-2015:0773-1 (java-1_8_0-openjdk)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.850684");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-09-18 10:39:26 +0200 (Fri, 18 Sep 2015)");
  script_cve_id("CVE-2015-0458", "CVE-2015-0459", "CVE-2015-0460", "CVE-2015-0469", "CVE-2015-0470", "CVE-2015-0477", "CVE-2015-0478", "CVE-2015-0480", "CVE-2015-0484", "CVE-2015-0486", "CVE-2015-0488", "CVE-2015-0491", "CVE-2015-0492");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for java-1_8_0-openjdk openSUSE-SU-2015:0773-1 (java-1_8_0-openjdk)");
  script_tag(name: "summary", value: "Check the version of java-1_8_0-openjdk");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  OpenJDK was updated to jdk8u45-b14 to fix security issues and bugs.

  The following vulnerabilities were fixed:

  * CVE-2015-0458: Deployment: unauthenticated remote attackers could
  execute arbitrary code via multiple protocols.
  * CVE-2015-0459: 2D: unauthenticated remote attackers could execute
  arbitrary code via multiple protocols.
  * CVE-2015-0460: Hotspot: unauthenticated remote attackers could execute
  arbitrary code via multiple protocols.
  * CVE-2015-0469: 2D: unauthenticated remote attackers could execute
  arbitrary code via multiple protocols.
  * CVE-2015-0470: Hotspot: unauthenticated remote attackers could update,
  insert or delete some JAVA accessible data via multiple protocols
  * CVE-2015-0477: Beans: unauthenticated remote attackers could update,
  insert or delete some JAVA accessible data via multiple protocols
  * CVE-2015-0478: JCE: unauthenticated remote attackers could read some
  JAVA accessible data via multiple protocols
  * CVE-2015-0480: Tools: unauthenticated remote attackers could update,
  insert or delete some JAVA accessible data via multiple protocols and
  cause a partial denial of service (partial DOS)
  * CVE-2015-0484: JavaFX: unauthenticated remote attackers could read,
  update, insert or delete access some Java accessible data via multiple
  protocols and cause a partial denial of service (partial DOS).
  * CVE-2015-0486: Deployment: unauthenticated remote attackers could read
  some JAVA accessible data via multiple protocols
  * CVE-2015-0488: JSSE: unauthenticated remote attackers could cause a
  partial denial of service (partial DOS).
  * CVE-2015-0491: 2D: unauthenticated remote attackers could execute
  arbitrary code via multiple protocols.
  * CVE-2015-0492: JavaFX: unauthenticated remote attackers could execute
  arbitrary code via multiple protocols.");
  script_tag(name: "affected", value: "java-1_8_0-openjdk on openSUSE 13.2");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "openSUSE-SU", value: "2015:0773_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "openSUSE13.2")
{

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk", rpm:"java-1_8_0-openjdk~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-accessibility", rpm:"java-1_8_0-openjdk-accessibility~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-debuginfo", rpm:"java-1_8_0-openjdk-debuginfo~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-debugsource", rpm:"java-1_8_0-openjdk-debugsource~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-demo", rpm:"java-1_8_0-openjdk-demo~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-demo-debuginfo", rpm:"java-1_8_0-openjdk-demo-debuginfo~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-devel", rpm:"java-1_8_0-openjdk-devel~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-headless", rpm:"java-1_8_0-openjdk-headless~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-headless-debuginfo", rpm:"java-1_8_0-openjdk-headless-debuginfo~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-src", rpm:"java-1_8_0-openjdk-src~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"java-1_8_0-openjdk-javadoc", rpm:"java-1_8_0-openjdk-javadoc~1.8.0.45~9.3", rls:"openSUSE13.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
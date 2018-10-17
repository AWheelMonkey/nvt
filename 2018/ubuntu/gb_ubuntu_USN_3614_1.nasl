###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3614_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for openjdk-7 USN-3614-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843491");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-04-03 08:51:06 +0200 (Tue, 03 Apr 2018)");
  script_cve_id("CVE-2018-2579", "CVE-2018-2588", "CVE-2018-2599", "CVE-2018-2602",
                "CVE-2018-2603", "CVE-2018-2618", "CVE-2018-2629", "CVE-2018-2633",
                "CVE-2018-2634", "CVE-2018-2637", "CVE-2018-2641", "CVE-2018-2663",
                "CVE-2018-2677", "CVE-2018-2678");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for openjdk-7 USN-3614-1");
  script_tag(name:"summary", value:"Check the version of openjdk-7");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that a race condition
  existed in the cryptography implementation in OpenJDK. An attacker could
  possibly use this to expose sensitive information. (CVE-2018-2579) It was
  discovered that the LDAP implementation in OpenJDK did not properly encode login
  names. A remote attacker could possibly use this to expose sensitive
  information. (CVE-2018-2588) It was discovered that the DNS client
  implementation in OpenJDK did not properly randomize source ports. A remote
  attacker could use this to spoof responses to DNS queries made by Java
  applications. (CVE-2018-2599) It was discovered that the Internationalization
  component of OpenJDK did not restrict search paths when loading resource bundle
  classes. A local attacker could use this to trick a user into running malicious
  code. (CVE-2018-2602) It was discovered that OpenJDK did not properly restrict
  memory allocations when parsing DER input. A remote attacker could possibly use
  this to cause a denial of service. (CVE-2018-2603) It was discovered that the
  Java Cryptography Extension (JCE) implementation in OpenJDK in some situations
  did guarantee sufficient strength of keys during key agreement. An attacker
  could use this to expose sensitive information. (CVE-2018-2618) It was
  discovered that the Java GSS implementation in OpenJDK in some situations did
  not properly handle GSS contexts in the native GSS library. An attacker could
  possibly use this to access unauthorized resources. (CVE-2018-2629) It was
  discovered that the LDAP implementation in OpenJDK did not properly handle LDAP
  referrals in some situations. An attacker could possibly use this to expose
  sensitive information or gain unauthorized privileges. (CVE-2018-2633) It was
  discovered that the Java GSS implementation in OpenJDK in some situations did
  not properly apply subject credentials. An attacker could possibly use this to
  expose sensitive information or gain access to unauthorized resources.
  (CVE-2018-2634) It was discovered that the Java Management Extensions (JMX)
  component of OpenJDK did not properly apply deserialization filters in some
  situations. An attacker could use this to bypass deserialization restrictions.
  (CVE-2018-2637) It was discovered that a use-after-free vulnerability existed in
  the AWT component of OpenJDK when loading the GTK library. An attacker could
  possibly use this to execute arbitrary code and escape Java sandbox
  restrictions. (CVE-2018-2641) It was discovered that in some situations OpenJDK
  did not properly validate objects when performing deserialization. An attacker
  could use this to cause a denial of service (application cras ... Description
  truncated, for more information please check the Reference URL");
  script_tag(name:"affected", value:"openjdk-7 on Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3614-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3614-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:amd64", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"icedtea-7-jre-jamvm:i386", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jdk:amd64", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jdk:i386", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre:amd64", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre:i386", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:amd64", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-headless:i386", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-lib", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:amd64", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-7-jre-zero:i386", ver:"7u171-2.6.13-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }


  if (__pkg_match) exit(99);
  exit(0);
}

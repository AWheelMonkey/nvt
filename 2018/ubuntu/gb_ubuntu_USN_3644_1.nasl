###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3644_1.nasl 12381 2018-11-16 11:16:30Z cfischer $
#
# Ubuntu Update for openjdk-8 USN-3644-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843522");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-05-12 05:49:47 +0200 (Sat, 12 May 2018)");
  script_cve_id("CVE-2018-2790", "CVE-2018-2794", "CVE-2018-2795", "CVE-2018-2796",
                "CVE-2018-2797", "CVE-2018-2798", "CVE-2018-2799", "CVE-2018-2800",
                "CVE-2018-2814", "CVE-2018-2815", "CVE-2018-2783");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for openjdk-8 USN-3644-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'openjdk-8'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"It was discovered that the Security component
of OpenJDK did not correctly perform merging of multiple sections for the same file
listed in JAR archive file manifests. An attacker could possibly use this to
modify attributes in a manifest without invalidating the signature.
(CVE-2018-2790)

Francesco Palmarini, Marco Squarcina, Mauro Tempesta, and Riccardo Focardi
discovered that the Security component of OpenJDK did not restrict which
classes could be used when deserializing keys from the JCEKS key stores. An
attacker could use this to specially craft a JCEKS key store to execute
arbitrary code. (CVE-2018-2794)

It was discovered that the Security component of OpenJDK in some situations
did not properly limit the amount of memory allocated when performing
deserialization. An attacker could use this to cause a denial of service
(memory exhaustion). (CVE-2018-2795)

It was discovered that the Concurrency component of OpenJDK in some
situations did not properly limit the amount of memory allocated when
performing deserialization. An attacker could use this to cause a
denial of service (memory exhaustion). (CVE-2018-2796)

It was discovered that the JMX component of OpenJDK in some situations did
not properly limit the amount of memory allocated when performing
deserialization. An attacker could use this to cause a denial of service
(memory exhaustion). (CVE-2018-2797)

It was discovered that the AWT component of OpenJDK in some situations did
not properly limit the amount of memory allocated when performing
deserialization. An attacker could use this to cause a denial of service
(memory exhaustion). (CVE-2018-2798)

It was discovered that the JAXP component of OpenJDK in some situations did
not properly limit the amount of memory allocated when performing
deserialization. An attacker could use this to cause a denial of service
(memory exhaustion). (CVE-2018-2799)

Moritz Bechler discovered that the RMI component of OpenJDK enabled HTTP
transport for RMI servers by default. A remote attacker could use this to
gain access to restricted services. (CVE-2018-2800)

It was discovered that a vulnerability existed in the Hotspot component of
OpenJDK affecting confidentiality, data integrity, and availability. An
attacker could use this to specially craft an Java application that caused
a denial of service or bypassed sandbox restrictions. (CVE-2018-2814)

Apostolos Giannakidis discovered that the Serialization component
of OpenJDK did not properly bound memory allocations in some
situations. An attacker could use this to cause a denial of service
(memory exhaustion). (CVE-2018-28 ...

  Description truncated, please see the referenced URL(s) for more information.");
  script_tag(name:"affected", value:"openjdk-8 on Ubuntu 17.10,
  Ubuntu 16.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3644-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3644-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(17\.10|16\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU17.10")
{

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre:amd64", ver:"8u171-b11-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre:i386", ver:"8u171-b11-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-headless:amd64", ver:"8u171-b11-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-headless:i386", ver:"8u171-b11-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-zero:amd64", ver:"8u171-b11-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-zero:i386", ver:"8u171-b11-0ubuntu0.17.10.1", rls:"UBUNTU17.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre:amd64", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre:i386", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-headless:amd64", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-headless:i386", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-jamvm:amd64", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-jamvm:i386", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-zero:amd64", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"openjdk-8-jre-zero:i386", ver:"8u171-b11-0ubuntu0.16.04.1", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

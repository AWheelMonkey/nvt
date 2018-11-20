###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for tomcat7 USN-3177-2
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.843035");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-02-03 05:48:02 +0100 (Fri, 03 Feb 2017)");
  script_cve_id("CVE-2016-0762", "CVE-2016-5018", "CVE-2016-5388", "CVE-2016-6794",
		"CVE-2016-6796", "CVE-2016-6797", "CVE-2016-6816", "CVE-2016-8735",
		"CVE-2016-8745", "CVE-2016-9774", "CVE-2016-9775");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for tomcat7 USN-3177-2");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'tomcat7'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-3177-1 fixed vulnerabilities in Tomcat.
  The update introduced a regression in environments where Tomcat is started with
  a security manager. This update fixes the problem.

Original advisory details:

It was discovered that the Tomcat realm implementations incorrectly handled
passwords when a username didn't exist. A remote attacker could possibly
use this issue to enumerate usernames. This issue only applied to Ubuntu
12.04 LTS, Ubuntu 14.04 LTS and Ubuntu 16.04 LTS. (CVE-2016-0762)
Alvaro Munoz and Alexander Mirosh discovered that Tomcat incorrectly
limited use of a certain utility method. A malicious application could
possibly use this to bypass Security Manager restrictions. This issue only
applied to Ubuntu 12.04 LTS, Ubuntu 14.04 LTS and Ubuntu 16.04 LTS.
(CVE-2016-5018)
It was discovered that Tomcat did not protect applications from untrusted
data in the HTTP_PROXY environment variable. A remote attacker could
possibly use this issue to redirect outbound traffic to an arbitrary proxy
server. This issue only applied to Ubuntu 12.04 LTS, Ubuntu 14.04 LTS and
Ubuntu 16.04 LTS. (CVE-2016-5388)
It was discovered that Tomcat incorrectly controlled reading system
properties. A malicious application could possibly use this to bypass
Security Manager restrictions. This issue only applied to Ubuntu 12.04 LTS,
Ubuntu 14.04 LTS and Ubuntu 16.04 LTS. (CVE-2016-6794)
It was discovered that Tomcat incorrectly controlled certain configuration
parameters. A malicious application could possibly use this to bypass
Security Manager restrictions. This issue only applied to Ubuntu 12.04 LTS,
Ubuntu 14.04 LTS and Ubuntu 16.04 LTS. (CVE-2016-6796)
It was discovered that Tomcat incorrectly limited access to global JNDI
resources. A malicious application could use this to access any global JNDI
resource without an explicit ResourceLink. This issue only applied to
Ubuntu 12.04 LTS, Ubuntu 14.04 LTS and Ubuntu 16.04 LTS. (CVE-2016-6797)
Regis Leroy discovered that Tomcat incorrectly filtered certain invalid
characters from the HTTP request line. A remote attacker could possibly
use this issue to inject data into HTTP responses. (CVE-2016-6816)
Pierre Ernst discovered that the Tomcat JmxRemoteLifecycleListener did not
implement a recommended fix. A remote attacker could possibly use this
issue to execute arbitrary code. (CVE-2016-8735)
It was discovered that Tomcat incorrectly handled error handling in the
send file code. A remote attacker could possibly use this issue to access
information from other requests. (CVE-2016-8745)
Paul Szabo discovered that the Tomcat package incorrectly handled upgrades
and removals. A local attacker could possibly use this issue to obtain
root privileges. (CVE-2016-9774, CVE-2016-9775)");
  script_tag(name:"affected", value:"tomcat7 on Ubuntu 14.04 LTS,
  Ubuntu 12.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"3177-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3177-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|12\.04 LTS)");
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

  if ((res = isdpkgvuln(pkg:"libtomcat7-java", ver:"7.0.52-1ubuntu0.9", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"tomcat7", ver:"7.0.52-1ubuntu0.9", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libtomcat6-java", ver:"6.0.35-1ubuntu3.10", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"tomcat6", ver:"6.0.35-1ubuntu3.10", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

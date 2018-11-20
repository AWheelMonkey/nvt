###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for oxide-qt USN-2521-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842120");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2015-03-11 06:39:18 +0100 (Wed, 11 Mar 2015)");
  script_cve_id("CVE-2015-1213", "CVE-2015-1214", "CVE-2015-1215", "CVE-2015-1216",
                "CVE-2015-1217", "CVE-2015-1230", "CVE-2015-1218", "CVE-2015-1223",
                "CVE-2015-1219", "CVE-2015-1220", "CVE-2015-1221", "CVE-2015-1222",
                "CVE-2015-1224", "CVE-2015-1227", "CVE-2015-1228", "CVE-2015-1229",
                "CVE-2015-1231", "CVE-2015-2238");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for oxide-qt USN-2521-1");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'oxide-qt'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Several out-of-bounds write bugs were
discovered in Skia. If a user were tricked in to opening a specially crafted
website, an attacker could potentially exploit these to cause a denial of
service via application crash or execute arbitrary code with the privileges of
the user invoking the program. (CVE-2015-1213, CVE-2015-1214, CVE-2015-1215)

A use-after-free was discovered in the V8 bindings in Blink. If a user
were tricked in to opening a specially crafted website, an attacker could
potentially exploit this to cause a denial of service via renderer crash,
or execute arbitrary code with the privileges of the sandboxed render
process. (CVE-2015-1216)

Multiple type confusion bugs were discovered in the V8 bindings in Blink.
If a user were tricked in to opening a specially crafted website, an
attacker could potentially exploit these to cause a denial of service via
renderer crash, or execute arbitrary code with the privileges of the
sandboxed render process. (CVE-2015-1217, CVE-2015-1230)

Multiple use-after-free bugs were discovered in the DOM implementation in
Blink. If a user were tricked in to opening a specially crafted website,
an attacker could potentially exploit these to cause a denial of service
via renderer crash, or execute arbitrary code with the privileges of the
sandboxed render process. (CVE-2015-1218, CVE-2015-1223)

An integer overflow was discovered in Skia. If a user were tricked in to
opening a specially crafted website, an attacker could potentially exploit
this to cause a denial of service via application crash or execute
arbitrary code with the privileges of the user invoking the program.
(CVE-2015-1219)

A use-after-free was discovered in the GIF image decoder in Blink. If a
user were tricked in to opening a specially crafted website, an attacker
could potentially exploit this to cause a denial of service via renderer
crash, or execute arbitrary code with the privileges of the sandboxed
render process. (CVE-2015-1220)

A use-after-free was discovered in Blink. If a user were tricked in to
opening a specially crafted website, an attacker could potentially
exploit this to cause a denial of service via renderer crash, or execute
arbitrary code with the privileges of the sandboxed render process.
(CVE-2015-1221)

Multiple use-after-free bugs were discovered in the service worker
implementation in Chromium. If a user were tricked in to opening a
specially crafted website, an attacker could potentially exploit these
to cause a denial of service via application crash or execute arbitrary
code with the privileges of the user invoking the program. (CVE-20 ...

  Description truncated, please see the referenced URL(s) for more information.");
  script_tag(name:"affected", value:"oxide-qt on Ubuntu 14.10,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_xref(name:"USN", value:"2521-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2521-1/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.10|14\.04 LTS)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.10")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-chromedriver", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs:amd64", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs:i386", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs-extra:amd64", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs-extra:i386", ver:"1.5.5-0ubuntu0.14.10.2", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }


  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:i386", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"liboxideqtcore0:amd64", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-chromedriver", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs:i386", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs:amd64", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs-extra:amd64", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"oxideqt-codecs-extra:i386", ver:"1.5.5-0ubuntu0.14.04.3", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

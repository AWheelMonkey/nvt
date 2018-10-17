###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3793_1.nasl 11927 2018-10-16 12:17:30Z santu $
#
# Ubuntu Update for thunderbird USN-3793-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.843659");
  script_version("$Revision: 11927 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-16 14:17:30 +0200 (Tue, 16 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-10-16 06:20:47 +0200 (Tue, 16 Oct 2018)");
  script_cve_id("CVE-2018-12376", "CVE-2018-12377", "CVE-2018-12378", "CVE-2018-12383", "CVE-2018-12385");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for thunderbird USN-3793-1");
  script_tag(name:"summary", value:"Check the version of thunderbird");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Multiple security issues were discovered in Thunderbird. If a user were
tricked in to opening a specially crafted website in a browsing context,
an attacker could potentially exploit these to cause a denial of service,
or execute arbitrary code. (CVE-2018-12376, CVE-2018-12377,
CVE-2018-12378)

It was discovered that if a user saved passwords before Thunderbird 58 and
then later set a master password, an unencrypted copy of these passwords
would still be accessible. A local user could exploit this to obtain
sensitive information. (CVE-2018-12383)

A crash was discovered in TransportSecurityInfo used for SSL, which could
be triggered by data stored in the local cache directory. An attacker
could potentially exploit this in combination with another vulnerability
that allowed them to write data to the cache, to execute arbitrary code.
(CVE-2018-12385)");
  script_tag(name:"affected", value:"thunderbird on Ubuntu 18.04 LTS,
  Ubuntu 16.04 LTS,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"USN", value:"3793-1");
  script_xref(name:"URL", value:"https://lists.ubuntu.com/archives/ubuntu-security-announce/2018-October/004619.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.2.1+build1-0ubuntu0.14.04.2", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU18.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.2.1+build1-0ubuntu0.18.04.2", rls:"UBUNTU18.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.2.1+build1-0ubuntu0.16.04.4", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

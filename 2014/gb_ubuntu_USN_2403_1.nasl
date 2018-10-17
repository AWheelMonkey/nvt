###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2403_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for gnutls28 USN-2403-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.842032");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-11-12 06:24:39 +0100 (Wed, 12 Nov 2014)");
  script_cve_id("CVE-2014-8564");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Ubuntu Update for gnutls28 USN-2403-1");

  script_tag(name:"summary", value:"Check the version of gnutls28");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Sean Burford discovered that GnuTLS
incorrectly handled printing certain elliptic curve parameters. A malicious
remote server or client could use this issue to cause GnuTLS to crash, resulting
in a denial of service, or possibly execute arbitrary code.");

  script_tag(name:"affected", value:"gnutls28 on Ubuntu 14.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2403-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2403-1/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.10");
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

  if ((res = isdpkgvuln(pkg:"gnutls-bin", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgnutls-deb0-28:amd64", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgnutls-deb0-28:i386", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgnutls-openssl27:amd64", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgnutls-openssl27:i386", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgnutlsxx28:amd64", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libgnutlsxx28:i386", ver:"3.2.16-1ubuntu2.1", rls:"UBUNTU14.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }
  if (__pkg_match) exit(99);
  exit(0);
}

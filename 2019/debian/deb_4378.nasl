###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4378.nasl 13375 2019-01-31 07:53:47Z cfischer $
#
# Auto-generated from advisory DSA 4378-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.704378");
  script_version("$Revision: 13375 $");
  script_cve_id("CVE-2018-1000888");
  script_name("Debian Security Advisory DSA 4378-1 (php-pear - security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-01-31 08:53:47 +0100 (Thu, 31 Jan 2019) $");
  script_tag(name:"creation_date", value:"2019-01-30 00:00:00 +0100 (Wed, 30 Jan 2019)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2019/dsa-4378.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2019 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"php-pear on Debian Linux");
  script_tag(name:"insight", value:"The PEAR package contains:

* the PEAR installer, for creating, distributing

and installing packages

* the PEAR_Exception PHP error handling mechanism
* the PEAR_ErrorStack advanced error handling mechanism
* the PEAR_Error error handling mechanism
* the OS_Guess class for retrieving info about the OS

where PHP is running on

* the System class for quick handling of common operations

with files and directories

* the PEAR base class

Features in a nutshell:

* full support for channels
* pre-download dependency validation
* new package.xml 2.0 format allows tremendous flexibility while maintaining

BC

* support for optional dependency groups and limited support for

sub-packaging

* robust dependency support
* full dependency validation on uninstall
* remote install for hosts with only ftp access - no more problems with

restricted host installation

* full support for mirroring
* support for bundling several packages into a single tarball
* support for static dependencies on a url-based package
* support for custom file roles and installation tasks");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1:1.10.1+submodules+notgz-9+deb9u1.

We recommend that you upgrade your php-pear packages.

For the detailed security status of php-pear please refer to its
security tracker page at:
https://security-tracker.debian.org/tracker/php-pear");
  script_tag(name:"summary", value:"Fariskhi Vidyan discovered that the PEAR Archive_Tar package for
handling tar files in PHP is prone to a PHP object injection
vulnerability, potentially allowing a remote attacker to execute
arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"php-pear", ver:"1:1.10.1+submodules+notgz-9+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

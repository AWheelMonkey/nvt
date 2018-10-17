###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1875_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for keystone USN-1875-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.841479");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-06-18 10:43:59 +0530 (Tue, 18 Jun 2013)");
  script_cve_id("CVE-2013-2104", "CVE-2013-2157");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:P");
  script_name("Ubuntu Update for keystone USN-1875-1");

  script_xref(name:"USN", value:"1875-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-1875-1/");
  script_tag(name:"summary", value:"Check for the Version of keystone");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(12\.10|13\.04)");
  script_tag(name:"affected", value:"keystone on Ubuntu 13.04,
  Ubuntu 12.10");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"insight", value:"Eoghan Glynn and Alex Meade discovered that Keystone did not properly
  perform expiry checks for the PKI tokens used in Keystone. If Keystone were
  setup to use PKI tokens, a previously authenticated user could continue to
  use a PKI token for longer than intended. This issue only affected Ubuntu
  12.10 which does not use PKI tokens by default. (CVE-2013-2104)

  Jose Castro Leon discovered that Keystone did not properly authenticate
  users when using the LDAP backend. An attacker could obtain valid tokens
  and impersonate other users by supplying an empty password. By default,
  Ubuntu does not use the LDAP backend. (CVE-2013-2157)");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU12.10")
{

  if ((res = isdpkgvuln(pkg:"python-keystone", ver:"2012.2.4-0ubuntu3", rls:"UBUNTU12.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU13.04")
{

  if ((res = isdpkgvuln(pkg:"python-keystone", ver:"1:2013.1.1-0ubuntu2.1", rls:"UBUNTU13.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

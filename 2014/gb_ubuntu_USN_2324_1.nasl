###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2324_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for keystone USN-2324-1
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

include("revisions-lib.inc");

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.841938");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2014-08-22 05:57:19 +0200 (Fri, 22 Aug 2014)");
  script_cve_id("CVE-2014-3476", "CVE-2014-3520", "CVE-2014-5251", "CVE-2014-5252",
                "CVE-2014-5253");
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
  script_name("Ubuntu Update for keystone USN-2324-1");


  script_tag(name:"affected", value:"keystone on Ubuntu 14.04 LTS");
  script_tag(name:"insight", value:"Steven Hardy discovered that OpenStack Keystone did not
properly handle chained delegation. A remove authenticated attacker could use
this to gain privileges by creating a new token with additional roles.
(CVE-2014-3476)

Jamie Lennox discovered that OpenStack Keystone did not properly validate
the project id. A remote authenticated attacker may be able to use this to
access other projects. (CVE-2014-3520)

Brant Knudson and Lance Bragstad discovered that OpenStack Keystone would
not always revoke tokens correctly. If Keystone were configured to use
revocation events, a remote authenticated attacker could continue to have
access to resources. (CVE-2014-5251, CVE-2014-5252, CVE-2014-5253)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2324-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2324-1/");
  script_tag(name:"summary", value:"Check for the Version of keystone");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU14\.04 LTS");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"python-keystone", ver:"1:2014.1.2.1-0ubuntu1.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

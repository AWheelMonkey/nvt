###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2004_1.nasl 11037 2018-08-17 11:51:16Z cfischer $
#
# Ubuntu Update for python-glanceclient USN-2004-1
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
  script_oid("1.3.6.1.4.1.25623.1.0.841600");
  script_version("$Revision: 11037 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-17 13:51:16 +0200 (Fri, 17 Aug 2018) $");
  script_tag(name:"creation_date", value:"2013-10-29 16:30:36 +0530 (Tue, 29 Oct 2013)");
  script_cve_id("CVE-2013-4111");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("Ubuntu Update for python-glanceclient USN-2004-1");


  script_tag(name:"affected", value:"python-glanceclient on Ubuntu 13.04");
  script_tag(name:"insight", value:"Thomas Leaman discovered that the Python client library for Glance did not
properly verify SSL certificates. A remote attacker could exploit this to
perform a man in the middle attack.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"USN", value:"2004-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2004-1/");
  script_tag(name:"summary", value:"Check for the Version of python-glanceclient");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU13\.04");
  exit(0);
}


include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU13.04")
{

  if ((res = isdpkgvuln(pkg:"python-glanceclient", ver:"1:0.9.0-0ubuntu1.2", rls:"UBUNTU13.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
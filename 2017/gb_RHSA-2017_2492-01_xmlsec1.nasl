###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_RHSA-2017_2492-01_xmlsec1.nasl 12380 2018-11-16 11:03:48Z cfischer $
#
# RedHat Update for xmlsec1 RHSA-2017:2492-01
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
  script_oid("1.3.6.1.4.1.25623.1.0.811726");
  script_version("$Revision: 12380 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:03:48 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2017-08-21 07:32:50 +0200 (Mon, 21 Aug 2017)");
  script_cve_id("CVE-2017-1000061");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("RedHat Update for xmlsec1 RHSA-2017:2492-01");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'xmlsec1'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"XML Security Library is a C library based
on LibXML2 and OpenSSL. The library was created with a goal to support major XML
security standards 'XML Digital Signature' and 'XML Encryption'.

Security Fix(es):

  * It was discovered xmlsec1's use of libxml2 inadvertently enabled external
entity expansion (XXE) along with validation. An attacker could craft an
XML file that would cause xmlsec1 to try and read local files or HTTP/FTP
URLs, leading to information disclosure or denial of service.
(CVE-2017-1000061)");
  script_tag(name:"affected", value:"xmlsec1 on Red Hat Enterprise Linux Server (v. 7)");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"RHSA", value:"2017:2492-01");
  script_xref(name:"URL" , value:"https://www.redhat.com/archives/rhsa-announce/2017-August/msg00071.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms", re:"ssh/login/release=RHENT_7");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "RHENT_7")
{

  if ((res = isrpmvuln(pkg:"xmlsec1", rpm:"xmlsec1~1.2.20~7.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xmlsec1-debuginfo", rpm:"xmlsec1-debuginfo~1.2.20~7.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xmlsec1-openssl", rpm:"xmlsec1-openssl~1.2.20~7.el7_4", rls:"RHENT_7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

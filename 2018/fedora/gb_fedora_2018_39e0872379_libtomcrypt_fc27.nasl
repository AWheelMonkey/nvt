###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_39e0872379_libtomcrypt_fc27.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# Fedora Update for libtomcrypt FEDORA-2018-39e0872379
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
  script_oid("1.3.6.1.4.1.25623.1.0.874838");
  script_version("$Revision: 10965 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-07-21 06:05:37 +0200 (Sat, 21 Jul 2018)");
  script_cve_id("CVE-2018-12437", "CVE-2018-0739");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libtomcrypt FEDORA-2018-39e0872379");
  script_tag(name:"summary", value:"Check the version of libtomcrypt");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"A comprehensive, modular and portable 
cryptographic toolkit that provides developers with a vast array of well known 
published block ciphers, one-way hash functions, chaining modes, pseudo-random 
number generators, public key cryptography and a plethora of other routines.

Designed from the ground up to be very simple to use. It has a modular and
standard API that allows new ciphers, hashes and PRNGs to be added or removed
without change to the overall end application. It features easy to use functions
and a complete user manual which has many source snippet examples.
");
  script_tag(name:"affected", value:"libtomcrypt on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-39e0872379");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YBUWSJFVQNQXFVT7AZKRWQS443JMZDDQ");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"libtomcrypt", rpm:"libtomcrypt~1.18.2~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

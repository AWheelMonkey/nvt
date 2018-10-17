###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libxml2 CESA-2009:1206 centos5 i386
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "libxml is a library for parsing and manipulating XML files. A Document Type
  Definition (DTD) defines the legal syntax (and also which elements can be
  used) for certain types of files, such as XML files.

  A stack overflow flaw was found in the way libxml processes the root XML
  document element definition in a DTD. A remote attacker could provide a
  specially-crafted XML file, which once opened by a local, unsuspecting
  user, would lead to denial of service (application crash). (CVE-2009-2414)
  
  Multiple use-after-free flaws were found in the way libxml parses the
  Notation and Enumeration attribute types. A remote attacker could provide
  a specially-crafted XML file, which once opened by a local, unsuspecting
  user, would lead to denial of service (application crash). (CVE-2009-2416)
  
  Users should upgrade to these updated packages, which contain backported
  patches to resolve these issues. For Red Hat Enterprise Linux 3, they
  contain backported patches for the libxml and libxml2 packages. For Red Hat
  Enterprise Linux 4 and 5, they contain backported patches for the libxml2
  packages. The desktop must be restarted (log out, then log back in) for
  this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "libxml2 on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2009-August/016074.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880794");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2009:1206");
  script_cve_id("CVE-2009-2414", "CVE-2009-2416");
  script_name("CentOS Update for libxml2 CESA-2009:1206 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of libxml2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"libxml2", rpm:"libxml2~2.6.26~2.1.2.8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-devel", rpm:"libxml2-devel~2.6.26~2.1.2.8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxml2-python", rpm:"libxml2-python~2.6.26~2.1.2.8", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for libvirt CESA-2011:0391 centos5 i386
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
tag_insight = "The libvirt library is a C API for managing and interacting with the
  virtualization capabilities of Linux and other operating systems. In
  addition, libvirt provides tools for remotely managing virtualized systems.

  It was found that several libvirt API calls did not honor the read-only
  permission for connections. A local attacker able to establish a read-only
  connection to libvirtd on a server could use this flaw to execute commands
  that should be restricted to read-write connections, possibly leading to a
  denial of service or privilege escalation. (CVE-2011-1146)
  
  Note: Previously, using rpmbuild without the '--define &quot;rhel 5&quot;' option to
  build the libvirt source RPM on Red Hat Enterprise Linux 5 failed with a
  &quot;Failed build dependencies&quot; error for the device-mapper-devel package, as
  this -devel sub-package is not available on Red Hat Enterprise Linux 5.
  With this update, the -devel sub-package is no longer checked by default as
  a dependency when building on Red Hat Enterprise Linux 5, allowing the
  libvirt source RPM to build as expected.
  
  All libvirt users are advised to upgrade to these updated packages, which
  contain a backported patch to resolve this issue. After installing the
  updated packages, libvirtd must be restarted (&quot;service libvirtd restart&quot;)
  for this update to take effect.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "libvirt on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-April/017456.html");
  script_oid("1.3.6.1.4.1.25623.1.0.880511");
  script_version("$Revision: 9371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:55:06 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-08-09 08:20:34 +0200 (Tue, 09 Aug 2011)");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:0391");
  script_cve_id("CVE-2011-1146");
  script_name("CentOS Update for libvirt CESA-2011:0391 centos5 i386");

  script_tag(name:"summary", value:"Check for the Version of libvirt");
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

  if ((res = isrpmvuln(pkg:"libvirt", rpm:"libvirt~0.8.2~15.el5_6.3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-devel", rpm:"libvirt-devel~0.8.2~15.el5_6.3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libvirt-python", rpm:"libvirt-python~0.8.2~15.el5_6.3", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

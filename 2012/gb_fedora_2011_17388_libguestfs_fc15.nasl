###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for libguestfs FEDORA-2011-17388
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "Libguestfs is a library for accessing and modifying guest disk images.
  Amongst the things this is good for: making batch configuration
  changes to guests, getting disk used/free statistics (see also:
  virt-df), migrating between virtualization systems (see also:
  virt-p2v), performing partial backups, performing partial guest
  clones, cloning guests and changing registry/UUID/hostname info, and
  much else besides.

  Libguestfs uses Linux kernel and qemu code, and can access any type of
  guest filesystem that Linux and qemu can, including but not limited
  to: ext2/3/4, btrfs, FAT and NTFS, LVM, many different disk partition
  schemes, qcow, qcow2, vmdk.

  Libguestfs provides ways to enumerate guest storage (eg. partitions,
  LVs, what filesystem is in each LV, etc.).  It can also run commands
  in the context of the guest.";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "libguestfs on Fedora 15";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2012-January/071635.html");
  script_oid("1.3.6.1.4.1.25623.1.0.863672");
  script_version("$Revision: 9352 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-01-09 12:53:02 +0530 (Mon, 09 Jan 2012)");
  script_xref(name: "FEDORA", value: "2011-17388");
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2011-4127");
  script_name("Fedora Update for libguestfs FEDORA-2011-17388");

  script_tag(name: "summary" , value: "Check for the Version of libguestfs");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
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

if(release == "FC15")
{

  if ((res = isrpmvuln(pkg:"libguestfs", rpm:"libguestfs~1.10.12~1.fc15", rls:"FC15")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

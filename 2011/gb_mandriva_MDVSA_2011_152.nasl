###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for ncompress MDVSA-2011:152 (ncompress)
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

if(description)
{
  script_xref(name:"URL", value:"http://lists.mandriva.com/security-announce/2011-10/msg00027.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831470");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-10-21 16:31:29 +0200 (Fri, 21 Oct 2011)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name:"MDVSA", value:"2011:152");
  script_cve_id("CVE-2010-0001");
  script_name("Mandriva Update for ncompress MDVSA-2011:152 (ncompress)");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ncompress'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_(mes5|2010\.1)");
  script_tag(name:"affected", value:"ncompress on Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64,
  Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64");
  script_tag(name:"insight", value:"A vulnerability has been found and corrected in ncompress:

  An integer underflow leading to array index error was found in the
  way gzip used to decompress files / archives, compressed with the
  Lempel-Ziv-Welch (LZW) compression algorithm. A remote attacker could
  provide a specially-crafted LZW compressed gzip archive, which once
  decompressed by a local, unsuspecting user would lead to gzip crash,
  or, potentially to arbitrary code execution with the privileges of
  the user running gzip (CVE-2010-0001).

  The updated packages have been upgraded to the 4.2.4.4 version which
  is not vulnerable to this issue.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "MNDK_mes5")
{

  if ((res = isrpmvuln(pkg:"ncompress", rpm:"ncompress~4.2.4.4~0.1mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2010.1")
{

  if ((res = isrpmvuln(pkg:"ncompress", rpm:"ncompress~4.2.4.4~0.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

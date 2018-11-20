###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for MHonArc MDVSA-2011:003 (MHonArc)
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
  script_xref(name:"URL", value:"http://lists.mandriva.com/security-announce/2011-01/msg00004.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831302");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2011-01-14 16:07:43 +0100 (Fri, 14 Jan 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_xref(name:"MDVSA", value:"2011:003");
  script_cve_id("CVE-2010-4524", "CVE-2010-1677");
  script_name("Mandriva Update for MHonArc MDVSA-2011:003 (MHonArc)");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'MHonArc'
  package(s) announced via the referenced advisory.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_(mes5|2010\.1|2010\.0|2009\.0)");
  script_tag(name:"affected", value:"MHonArc on Mandriva Linux 2009.0,
  Mandriva Linux 2009.0/X86_64,
  Mandriva Linux 2010.0,
  Mandriva Linux 2010.0/X86_64,
  Mandriva Linux 2010.1,
  Mandriva Linux 2010.1/X86_64,
  Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64");
  script_tag(name:"insight", value:"Multiple vulnerabilities has been found and corrected in MHonArc:

  MHonArc 2.6.16 allows remote attackers to cause a denial of service
  (CPU consumption) via start tags that are placed within other start
  tags, as demonstrated by a &amp;lt;bo&amp;lt;bo&amp;lt;bo&amp;lt;bo&amp;lt;body&amp;gt;dy&amp;gt;dy&amp;gt;dy&amp;gt;dy&amp;gt; sequence,
  a different vulnerability than CVE-2010-4524 (CVE-2010-1677).

  Cross-site scripting (XSS) vulnerability in lib/mhtxthtml.pl in
  MHonArc 2.6.16 allows remote attackers to inject arbitrary web script
  or HTML via a malformed start tag and end tag for a SCRIPT element,
  as demonstrated by &amp;lt;scr&amp;lt;body&amp;gt;ipt&amp;gt; and &amp;lt;/scr&amp;lt;body&amp;gt;ipt&amp;gt; sequences
  (CVE-2010-4524).

  Packages for 2009.0 are provided as of the Extended Maintenance
  Program. The updated packages have been upgraded to the latest version (2.6.18)
  which is not vulnerable to these issues.");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://store.mandriva.com/product_info.php?cPath=149&amp;amp;products_id=490");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "MNDK_mes5")
{

  if ((res = isrpmvuln(pkg:"MHonArc", rpm:"MHonArc~2.6.18~0.1mdvmes5.1", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2010.1")
{

  if ((res = isrpmvuln(pkg:"MHonArc", rpm:"MHonArc~2.6.18~0.1mdv2010.2", rls:"MNDK_2010.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2010.0")
{

  if ((res = isrpmvuln(pkg:"MHonArc", rpm:"MHonArc~2.6.18~0.1mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2009.0")
{

  if ((res = isrpmvuln(pkg:"MHonArc", rpm:"MHonArc~2.6.18~0.1mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

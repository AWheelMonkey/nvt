###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for xmlsec1 MDVSA-2011:063 (xmlsec1)
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
  script_xref(name:"URL", value:"http://lists.mandriva.com/security-announce/2011-04/msg00005.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831362");
  script_version("$Revision: 11985 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:24:37 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-04-06 16:20:31 +0200 (Wed, 06 Apr 2011)");
  script_tag(name:"cvss_base", value:"5.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
  script_xref(name:"MDVSA", value:"2011:063");
  script_cve_id("CVE-2011-1425");
  script_name("Mandriva Update for xmlsec1 MDVSA-2011:063 (xmlsec1)");

  script_tag(name:"summary", value:"Check for the Version of xmlsec1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_(mes5|2010\.0|2009\.0)");
  script_tag(name:"affected", value:"xmlsec1 on Mandriva Linux 2009.0,
  Mandriva Linux 2009.0/X86_64,
  Mandriva Linux 2010.0,
  Mandriva Linux 2010.0/X86_64,
  Mandriva Enterprise Server 5,
  Mandriva Enterprise Server 5/X86_64");
  script_tag(name:"insight", value:"A vulnerability was discovered and corrected in xmlsec1:

  xslt.c in XML Security Library (aka xmlsec) before 1.2.17, as
  used in WebKit and other products, when XSLT is enabled, allows
  remote attackers to create or overwrite arbitrary files via vectors
  involving the libxslt output extension and a ds:Transform element
  during signature verification (CVE-2011-1425).

  Packages for 2009.0 are provided as of the Extended Maintenance
  Program. The updated packages have been patched to correct this issue.");
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

  if ((res = isrpmvuln(pkg:"libxmlsec1-1", rpm:"libxmlsec1-1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-devel", rpm:"libxmlsec1-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-gnutls1", rpm:"libxmlsec1-gnutls1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-gnutls-devel", rpm:"libxmlsec1-gnutls-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-nss1", rpm:"libxmlsec1-nss1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-nss-devel", rpm:"libxmlsec1-nss-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-openssl1", rpm:"libxmlsec1-openssl1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-openssl-devel", rpm:"libxmlsec1-openssl-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xmlsec1", rpm:"xmlsec1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-1", rpm:"lib64xmlsec1-1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-devel", rpm:"lib64xmlsec1-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-gnutls1", rpm:"lib64xmlsec1-gnutls1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-gnutls-devel", rpm:"lib64xmlsec1-gnutls-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-nss1", rpm:"lib64xmlsec1-nss1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-nss-devel", rpm:"lib64xmlsec1-nss-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-openssl1", rpm:"lib64xmlsec1-openssl1~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-openssl-devel", rpm:"lib64xmlsec1-openssl-devel~1.2.10~7.3mdvmes5.2", rls:"MNDK_mes5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2010.0")
{

  if ((res = isrpmvuln(pkg:"libxmlsec1-1", rpm:"libxmlsec1-1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-devel", rpm:"libxmlsec1-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-gnutls1", rpm:"libxmlsec1-gnutls1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-gnutls-devel", rpm:"libxmlsec1-gnutls-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-nss1", rpm:"libxmlsec1-nss1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-nss-devel", rpm:"libxmlsec1-nss-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-openssl1", rpm:"libxmlsec1-openssl1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-openssl-devel", rpm:"libxmlsec1-openssl-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xmlsec1", rpm:"xmlsec1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-1", rpm:"lib64xmlsec1-1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-devel", rpm:"lib64xmlsec1-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-gnutls1", rpm:"lib64xmlsec1-gnutls1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-gnutls-devel", rpm:"lib64xmlsec1-gnutls-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-nss1", rpm:"lib64xmlsec1-nss1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-nss-devel", rpm:"lib64xmlsec1-nss-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-openssl1", rpm:"lib64xmlsec1-openssl1~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-openssl-devel", rpm:"lib64xmlsec1-openssl-devel~1.2.13~1.2mdv2010.0", rls:"MNDK_2010.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "MNDK_2009.0")
{

  if ((res = isrpmvuln(pkg:"libxmlsec1-1", rpm:"libxmlsec1-1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-devel", rpm:"libxmlsec1-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-gnutls1", rpm:"libxmlsec1-gnutls1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-gnutls-devel", rpm:"libxmlsec1-gnutls-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-nss1", rpm:"libxmlsec1-nss1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-nss-devel", rpm:"libxmlsec1-nss-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-openssl1", rpm:"libxmlsec1-openssl1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libxmlsec1-openssl-devel", rpm:"libxmlsec1-openssl-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xmlsec1", rpm:"xmlsec1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-1", rpm:"lib64xmlsec1-1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-devel", rpm:"lib64xmlsec1-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-gnutls1", rpm:"lib64xmlsec1-gnutls1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-gnutls-devel", rpm:"lib64xmlsec1-gnutls-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-nss1", rpm:"lib64xmlsec1-nss1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-nss-devel", rpm:"lib64xmlsec1-nss-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-openssl1", rpm:"lib64xmlsec1-openssl1~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"lib64xmlsec1-openssl-devel", rpm:"lib64xmlsec1-openssl-devel~1.2.10~7.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2014_0638_2.nasl 8046 2017-12-08 08:48:56Z santu $
#
# SuSE Update for Mozilla SUSE-SU-2014:0638-2 (Mozilla)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851011");
  script_version("$Revision: 8046 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:48:56 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2015-10-16 16:38:59 +0200 (Fri, 16 Oct 2015)");
  script_cve_id("CVE-2014-1518", "CVE-2014-1520", "CVE-2014-1523", "CVE-2014-1524",
                "CVE-2014-1529", "CVE-2014-1530", "CVE-2014-1531", "CVE-2014-1532",
                "CVE-2014-1492");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Mozilla SUSE-SU-2014:0638-2 (Mozilla)");
  script_tag(name: "summary", value: "Check the version of Mozilla");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This MozillaFirefox and mozilla-nss update fixes several security and
  non-security issues.

  MozillaFirefox has been updated to version 24.5.0esr which fixes the
  following issues:

  * MFSA 2014-34/CVE-2014-1518 Miscellaneous memory safety hazards
  * MFSA 2014-37/CVE-2014-1523 Out of bounds read while decoding JPG
  images
  * MFSA 2014-38/CVE-2014-1524 Buffer overflow when using non-XBL object
  as XBL
  * MFSA 2014-42/CVE-2014-1529 Privilege escalation through Web
  Notification API
  * MFSA 2014-43/CVE-2014-1530 Cross-site scripting (XSS) using history
  navigations
  * MFSA 2014-44/CVE-2014-1531 Use-after-free in imgLoader while
  resizing images
  * MFSA 2014-46/CVE-2014-1532 Use-after-free in nsHostResolver

  Mozilla NSS has been updated to version 3.16

  * required for Firefox 29
  * CVE-2014-1492_ In a wildcard certificate, the wildcard character
  should not be embedded within the U-label of an internationalized
  domain name. See the last bullet point in RFC 6125, Section 7.2.
  * Update of root certificates.

  Security Issue references:

  * CVE-2014-1532
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1532 
  * CVE-2014-1531
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1531 
  * CVE-2014-1530
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1530 
  * CVE-2014-1529
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1529 
  * CVE-2014-1524
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1524 
  * CVE-2014-1523
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1523 
  * CVE-2014-1520
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1520 
  * CVE-2014-1518
   http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1518");
  script_tag(name: "affected", value: "Mozilla on SUSE Linux Enterprise Server 11 SP2 LTSS");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2014:0638_2");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLES11.0SP2")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~24.5.0esr~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-branding-SLED-24", rpm:"MozillaFirefox-branding-SLED-24~0.4.10.14", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations", rpm:"MozillaFirefox-translations~24.5.0esr~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3", rpm:"libfreebl3~3.16~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nspr", rpm:"mozilla-nspr~4.10.4~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nspr-devel", rpm:"mozilla-nspr-devel~4.10.4~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss", rpm:"mozilla-nss~3.16~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-devel", rpm:"mozilla-nss-devel~3.16~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-tools", rpm:"mozilla-nss-tools~3.16~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libfreebl3-32bit", rpm:"libfreebl3-32bit~3.16~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nspr-32bit", rpm:"mozilla-nspr-32bit~4.10.4~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mozilla-nss-32bit", rpm:"mozilla-nss-32bit~3.16~0.3.1", rls:"SLES11.0SP2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

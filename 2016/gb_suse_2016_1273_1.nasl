###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2016_1273_1.nasl 8047 2017-12-08 08:56:07Z santu $
#
# SuSE Update for compat-openssl098 openSUSE-SU-2016:1273-1 (compat-openssl098)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851309");
  script_version("$Revision: 8047 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-08 09:56:07 +0100 (Fri, 08 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-05-11 05:24:06 +0200 (Wed, 11 May 2016)");
  script_cve_id("CVE-2016-0702", "CVE-2016-2105", "CVE-2016-2106", "CVE-2016-2108", 
                "CVE-2016-2109");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for compat-openssl098 openSUSE-SU-2016:1273-1 (compat-openssl098)");
  script_tag(name: "summary", value: "Check the version of compat-openssl098");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for compat-openssl098 fixes the following issues:

  - CVE-2016-2108: Memory corruption in the ASN.1 encoder (bsc#977617)
  - CVE-2016-2105: EVP_EncodeUpdate overflow (bsc#977614)
  - CVE-2016-2106: EVP_EncryptUpdate overflow (bsc#977615)
  - CVE-2016-2109: ASN.1 BIO excessive memory allocation (bsc#976942)
  - CVE-2016-0702: Side channel attack on modular exponentiation
  'CacheBleed' (bsc#968050)
  - bsc#976943: Buffer overrun in ASN1_parse

  The following non-security bugs were fixed:

  - bsc#889013: Rename README.SuSE to the new spelling (bsc#889013)

  This update was imported from the SUSE:SLE-12:Update update project.");
  script_tag(name: "affected", value: "compat-openssl098 on openSUSE Leap 42.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:1273_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"compat-openssl098-debugsource", rpm:"compat-openssl098-debugsource~0.9.8j~12.2", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl0_9_8", rpm:"libopenssl0_9_8~0.9.8j~12.2", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl0_9_8-debuginfo", rpm:"libopenssl0_9_8-debuginfo~0.9.8j~12.2", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl0_9_8-32bit", rpm:"libopenssl0_9_8-32bit~0.9.8j~12.2", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl0_9_8-debuginfo-32bit", rpm:"libopenssl0_9_8-debuginfo-32bit~0.9.8j~12.2", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

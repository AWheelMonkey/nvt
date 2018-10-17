###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2017_2370_1.nasl 9199 2018-03-26 05:56:21Z cfischer $
#
# SuSE Update for libzypp, openSUSE-SU-2017:2370-1 (libzypp,)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851608");
  script_version("$Revision: 9199 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-26 07:56:21 +0200 (Mon, 26 Mar 2018) $");
  script_tag(name:"creation_date", value:"2017-09-06 07:17:54 +0200 (Wed, 06 Sep 2017)");
  script_cve_id("CVE-2017-7436");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for libzypp, openSUSE-SU-2017:2370-1 (libzypp,)");
  script_tag(name: "summary", value: "Check the version of libzypp,");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  The Software Update Stack was updated to receive fixes and enhancements.

  libzypp:

  - Adapt to work with GnuPG 2.1.23. (bsc#1054088)
  - Support signing with subkeys. (bsc#1008325)
  - Enhance sort order for media.1/products. (bsc#1054671)

  zypper:

  - Also show a gpg key's subkeys. (bsc#1008325)
  - Improve signature check callback messages. (bsc#1045735)
  - Add options to tune the GPG check settings. (bsc#1045735)
  - Adapt download callback to report and handle unsigned packages.
  (bsc#1038984, CVE-2017-7436)
  - Report missing/optional files as 'not found' rather than 'error'.
  (bsc#1047785)

  This update was imported from the SUSE:SLE-12-SP3:Update update project.");
  script_tag(name: "affected", value: "libzypp, on openSUSE Leap 42.3");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2017:2370_1");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.3")
{

  if ((res = isrpmvuln(pkg:"libzypp", rpm:"libzypp~16.15.6~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libzypp-debuginfo", rpm:"libzypp-debuginfo~16.15.6~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libzypp-debugsource", rpm:"libzypp-debugsource~16.15.6~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libzypp-devel", rpm:"libzypp-devel~16.15.6~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libzypp-devel-doc", rpm:"libzypp-devel-doc~16.15.6~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"zypper", rpm:"zypper~1.13.32~8.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"zypper-debuginfo", rpm:"zypper-debuginfo~1.13.32~8.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"zypper-debugsource", rpm:"zypper-debugsource~1.13.32~8.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"zypper-aptitude", rpm:"zypper-aptitude~1.13.32~8.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"zypper-log", rpm:"zypper-log~1.13.32~8.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

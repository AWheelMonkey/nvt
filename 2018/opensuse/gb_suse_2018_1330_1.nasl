###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_suse_2018_1330_1.nasl 10374 2018-07-02 04:44:41Z asteins $
#
# SuSE Update for enigmail openSUSE-SU-2018:1330-1 (enigmail)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851748");
  script_version("$Revision: 10374 $");
  script_tag(name:"last_modification", value:"$Date: 2018-07-02 06:44:41 +0200 (Mon, 02 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-05-18 05:38:27 +0200 (Fri, 18 May 2018)");
  script_cve_id("CVE-2017-17688", "CVE-2017-17689");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for enigmail openSUSE-SU-2018:1330-1 (enigmail)");
  script_tag(name:"summary", value:"Check the version of enigmail");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"
  This update for enigmail to version 2.0.4 fixes multiple issues.

  Security issues fixed:

  - CVE-2017-17688: CFB gadget attacks allowed to exfiltrate plaintext out
  of encrypted emails. enigmail now fails on GnuPG integrity check
  warnings for old Algorithms (bsc#1093151)
  - CVE-2017-17689: CBC gadget attacks allows to exfiltrate plaintext out of
  encrypted emails (bsc#1093152)

  This update also includes new and updated functionality:

  - The Encryption and Signing buttons now work for both OpenPGP and S/MIME.
  Enigmail will chose between S/MIME or OpenPGP depending on whether the
  keys for all recipients are available for the respective standard
  - Support for the Autocrypt standard, which is now enabled by default
  - Support for Pretty Easy Privacy
  - Support for Web Key Directory (WKD)
  - The message subject can now be encrypted and replaced with a dummy
  subject, following the Memory Hole standard forprotected Email Headers
  - keys on keyring are automatically refreshed from keyservers at irregular
  intervals
  - Subsequent updates of Enigmail no longer require a restart of Thunderbird
  - Keys are internally addressed using the fingerprint instead of the key ID


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended 
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 42.3:

  zypper in -t patch openSUSE-2018-470=1");
  script_tag(name:"affected", value:"enigmail on openSUSE Leap 42.3");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"openSUSE-SU", value:"2018:1330_1");
  script_xref(name:"URL" , value:"http://lists.opensuse.org/opensuse-security-announce/2018-05/msg00081.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

  if ((res = isrpmvuln(pkg:"enigmail", rpm:"enigmail~2.0.4~12.1", rls:"openSUSELeap42.3")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

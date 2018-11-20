###############################################################################
# OpenVAS Vulnerability Test
#
# Ubuntu Update for libsoup2.4 USN-2950-2
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
  script_oid("1.3.6.1.4.1.25623.1.0.842721");
  script_version("$Revision: 12381 $");
  script_tag(name:"last_modification", value:"$Date: 2018-11-16 12:16:30 +0100 (Fri, 16 Nov 2018) $");
  script_tag(name:"creation_date", value:"2016-05-06 15:29:15 +0530 (Fri, 06 May 2016)");
  script_cve_id("CVE-2015-5370", "CVE-2016-2110", "CVE-2016-2111", "CVE-2016-2112",
                "CVE-2016-2113", "CVE-2016-2114", "CVE-2016-2115", "CVE-2016-2118");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Ubuntu Update for libsoup2.4 USN-2950-2");
  script_tag(name:"summary", value:"The remote host is missing an update for the 'libsoup2.4'
  package(s) announced via the referenced advisory.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"USN-2950-1 fixed vulnerabilities in Samba.
  The updated Samba packages introduced a compatibility issue with NTLM authentication
  in libsoup. This update fixes the problem.

  We apologize for the inconvenience.

  Original advisory details:

  Jouni Knuutinen discovered that Samba contained multiple flaws in the
  DCE/RPC implementation. A remote attacker could use this issue to perform
  a denial of service, downgrade secure connections by performing a man in
  the middle attack, or possibly execute arbitrary code. (CVE-2015-5370)
  Stefan Metzmacher discovered that Samba contained multiple flaws in the
  NTLMSSP authentication implementation. A remote attacker could use this
  issue to downgrade connections to plain text by performing a man in the
  middle attack. (CVE-2016-2110)
  Alberto Solino discovered that a Samba domain controller would establish a
  secure connection to a server with a spoofed computer name. A remote
  attacker could use this issue to obtain sensitive information.
  (CVE-2016-2111)
  Stefan Metzmacher discovered that the Samba LDAP implementation did not
  enforce integrity protection. A remote attacker could use this issue to
  hijack LDAP connections by performing a man in the middle attack.
  (CVE-2016-2112)
  Stefan Metzmacher discovered that Samba did not validate TLS certificates.
  A remote attacker could use this issue to spoof a Samba server.
  (CVE-2016-2113)
  Stefan Metzmacher discovered that Samba did not enforce SMB signing even if
  configured to. A remote attacker could use this issue to perform a man in
  the middle attack. (CVE-2016-2114)
  Stefan Metzmacher discovered that Samba did not enable integrity protection
  for IPC traffic. A remote attacker could use this issue to perform a man in
  the middle attack. (CVE-2016-2115)
  Stefan Metzmacher discovered that Samba incorrectly handled the MS-SAMR and
  MS-LSAD protocols. A remote attacker could use this flaw with a man in the
  middle attack to impersonate users and obtain sensitive information from
  the Security Account Manager database. This flaw is known as Badlock.
  (CVE-2016-2118)
  Samba has been updated to 4.3.8 in Ubuntu 14.04 LTS and Ubuntu 15.10.
  Ubuntu 12.04 LTS has been updated to 3.6.25 with backported security fixes.
  In addition to security fixes, the updated packages contain bug fixes,
  new features, and possibly incompatible changes. Configuration changes may
  be required in certain environments.");
  script_tag(name:"affected", value:"libsoup2.4 on Ubuntu 15.10,
  Ubuntu 14.04 LTS");
  script_tag(name:"solution", value:"Please Install the Updated Packages.");

  script_xref(name:"USN", value:"2950-2");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-2950-2/");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(14\.04 LTS|15\.10)");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU14.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"libsoup2.4-1:i386", ver:"2.44.2-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libsoup2.4-1:amd64", ver:"2.44.2-1ubuntu2.1", rls:"UBUNTU14.04 LTS")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU15.10")
{

  if ((res = isdpkgvuln(pkg:"libsoup2.4-1:i386", ver:"2.50.0-2ubuntu0.1", rls:"UBUNTU15.10")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if ((res = isdpkgvuln(pkg:"libsoup2.4-1:amd64", ver:"2.50.0-2ubuntu0.1", rls:"UBUNTU15.10")) != NULL)
  {
     security_message(data:res);
     exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
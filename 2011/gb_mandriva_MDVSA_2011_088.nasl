###############################################################################
# OpenVAS Vulnerability Test
#
# Mandriva Update for mplayer MDVSA-2011:088 (mplayer)
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
  script_xref(name:"URL", value:"http://lists.mandriva.com/security-announce/2011-05/msg00010.php");
  script_oid("1.3.6.1.4.1.25623.1.0.831391");
  script_version("$Revision: 11985 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-19 12:24:37 +0200 (Fri, 19 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-05-17 15:58:48 +0200 (Tue, 17 May 2011)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_xref(name:"MDVSA", value:"2011:088");
  script_cve_id("CVE-2009-4632", "CVE-2009-4633", "CVE-2009-4634", "CVE-2009-4635", "CVE-2009-4636", "CVE-2009-4639", "CVE-2009-4640", "CVE-2010-3429", "CVE-2010-4704");
  script_name("Mandriva Update for mplayer MDVSA-2011:088 (mplayer)");

  script_tag(name:"summary", value:"Check for the Version of mplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Mandrake Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/mandriva_mandrake_linux", "ssh/login/release", re:"ssh/login/release=MNDK_2009\.0");
  script_tag(name:"affected", value:"mplayer on Mandriva Linux 2009.0,
  Mandriva Linux 2009.0/X86_64");
  script_tag(name:"insight", value:"Multiple vulnerabilities have been identified and fixed in mplayer:

  oggparsevorbis.c in FFmpeg 0.5 does not properly perform certain
  pointer arithmetic, which might allow remote attackers to obtain
  sensitive memory contents and cause a denial of service via a crafted
  file that triggers an out-of-bounds read. (CVE-2009-4632)

  vorbis_dec.c in FFmpeg 0.5 uses an assignment operator when a
  comparison operator was intended, which might allow remote attackers
  to cause a denial of service and possibly execute arbitrary code via
  a crafted file that modifies a loop counter and triggers a heap-based
  buffer overflow. (CVE-2009-4633)

  Multiple integer underflows in FFmpeg 0.5 allow remote attackers to
  cause a denial of service and possibly execute arbitrary code via a
  crafted file that (1) bypasses a validation check in vorbis_dec.c
  and triggers a wraparound of the stack pointer, or (2) access a
  pointer from out-of-bounds memory in mov.c, related to an elst tag
  that appears before a tag that creates a stream. (CVE-2009-4634)

  FFmpeg 0.5 allows remote attackers to cause a denial of service and
  possibly execute arbitrary code via a crafted MOV container with
  improperly ordered tags that cause (1) mov.c and (2) utils.c to use
  inconsistent codec types and identifiers, which causes the mp3 decoder
  to process a pointer for a video structure, leading to a stack-based
  buffer overflow. (CVE-2009-4635)

  FFmpeg 0.5 allows remote attackers to cause a denial of service (hang)
  via a crafted file that triggers an infinite loop. (CVE-2009-4636)

  The av_rescale_rnd function in the AVI demuxer in FFmpeg 0.5 allows
  remote attackers to cause a denial of service (crash) via a crafted
  AVI file that triggers a divide-by-zero error. (CVE-2009-4639)

  Array index error in vorbis_dec.c in FFmpeg 0.5 allows remote
  attackers to cause a denial of service and possibly execute arbitrary
  code via a crafted Vorbis file that triggers an out-of-bounds
  read. (CVE-2009-4640)

  flicvideo.c in libavcodec 0.6 and earlier in FFmpeg, as used in MPlayer
  and other products, allows remote attackers to execute arbitrary code
  via a crafted flic file, related to an arbitrary offset dereference
  vulnerability. (CVE-2010-3429)

  libavcodec/vorbis_dec.c in the Vorbis decoder in FFmpeg 0.6.1
  and earlier allows remote attackers to cause a denial of service
  (application crash) via a crafted .ogg file, related to the
  vorbis_floor0_decode function. (CVE-2010-4704)

  And several additional vulnerabilities originally discovered b ...

  Description truncated, for more information please check the Reference URL");
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

if(release == "MNDK_2009.0")
{

  if ((res = isrpmvuln(pkg:"mencoder", rpm:"mencoder~1.0~1.rc2.18.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mplayer", rpm:"mplayer~1.0~1.rc2.18.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mplayer-doc", rpm:"mplayer-doc~1.0~1.rc2.18.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"mplayer-gui", rpm:"mplayer-gui~1.0~1.rc2.18.3mdv2009.0", rls:"MNDK_2009.0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}

###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1368.nasl 10965 2018-08-15 03:42:43Z ckuersteiner $
#
# Auto-generated from advisory DLA 1368-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.891368");
  script_version("$Revision: 10965 $");
  script_cve_id("CVE-2017-11333", "CVE-2017-14632", "CVE-2017-14633", "CVE-2018-5146");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1368-1] libvorbis security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-08-15 05:42:43 +0200 (Wed, 15 Aug 2018) $");
  script_tag(name:"creation_date", value:"2018-05-02 00:00:00 +0200 (Wed, 02 May 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/04/msg00033.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"libvorbis on Debian Linux");
  script_tag(name:"insight", value:"Ogg Vorbis is a fully open, non-proprietary, patent-and-royalty-free,
general-purpose compressed audio format for audio and music at fixed
and variable bitrates from 16 to 128 kbps/channel.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
1.3.2-1.3+deb7u1.

We recommend that you upgrade your libvorbis packages.");
  script_tag(name:"summary",  value:"Serious vulnerabilities were found in the libvorbis library, commonly
used to encode and decode audio in OGG containers.

2017-14633

In Xiph.Org libvorbis 1.3.5, an out-of-bounds array read
vulnerability exists in the function mapping0_forward() in
mapping0.c, which may lead to DoS when operating on a crafted
audio file with vorbis_analysis().

2017-14632

Xiph.Org libvorbis 1.3.5 allows Remote Code Execution upon
freeing uninitialized memory in the function
vorbis_analysis_headerout() in info.c when vi->channels<=0, a
similar issue to Mozilla bug 550184.

2017-11333

The vorbis_analysis_wrote function in lib/block.c in Xiph.Org
libvorbis 1.3.5 allows remote attackers to cause a denial of
service (OOM) via a crafted wav file.

2018-5146

out-of-bounds memory write in the codeboook parsing code of the
Libvorbis multimedia library could result in the execution of
arbitrary code.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libvorbis-dbg", ver:"1.3.2-1.3+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libvorbis-dev", ver:"1.3.2-1.3+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libvorbis0a", ver:"1.3.2-1.3+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libvorbisenc2", ver:"1.3.2-1.3+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libvorbisfile3", ver:"1.3.2-1.3+deb7u1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}

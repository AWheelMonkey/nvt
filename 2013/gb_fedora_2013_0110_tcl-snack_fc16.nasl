###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for tcl-snack FEDORA-2013-0110
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

tag_affected = "tcl-snack on Fedora 16";
tag_insight = "The Snack Sound Toolkit is designed to be used with a scripting language such
  as Tcl/Tk or Python. Using Snack you can create powerful multi-platform audio
  applications with just a few lines of code. Snack has commands for basic sound
  handling, such as playback, recording, file and socket I/O. Snack also provides
  primitives for sound visualization, e.g. waveforms and spectrograms. It was
  developed mainly to handle digital recordings of speech, but is just as useful
  for general audio. Snack has also successfully been applied to other
  one-dimensional signals. The combination of Snack and a scripting language
  makes it possible to create sound tools and applications with a minimum of
  effort. This is due to the rapid development nature of scripting languages. As
  a bonus you get an application that is cross-platform from start. It is also
  easy to integrate Snack based applications with existing sound analysis
  software.";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2013-January/096489.html");
  script_oid("1.3.6.1.4.1.25623.1.0.865000");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-01-15 18:06:18 +0530 (Tue, 15 Jan 2013)");
  script_cve_id("CVE-2012-6303");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2013-0110");
  script_name("Fedora Update for tcl-snack FEDORA-2013-0110");

  script_tag(name:"summary", value:"Check for the Version of tcl-snack");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC16")
{

  if ((res = isrpmvuln(pkg:"tcl-snack", rpm:"tcl-snack~2.2.10~17.fc16", rls:"FC16")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

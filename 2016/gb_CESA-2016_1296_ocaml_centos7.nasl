###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for ocaml CESA-2016:1296 centos7 
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
  script_oid("1.3.6.1.4.1.25623.1.0.882514");
  script_version("$Revision: 6658 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:51:48 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-06-24 05:27:04 +0200 (Fri, 24 Jun 2016)");
  script_cve_id("CVE-2015-8869");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for ocaml CESA-2016:1296 centos7 ");
  script_tag(name: "summary", value: "Check the version of ocaml");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "OCaml is a high-level, strongly-typed, 
functional, and object-oriented programming language from the ML family of 
languages. The ocaml packages contain two batch compilers 
(a fast bytecode compiler and an optimizing native-code compiler), an 
interactive top level system, parsing tools (Lex, Yacc, Camlp4), a replay 
debugger, a documentation generator, and a comprehensive library.

Security Fix(es):

* OCaml versions 4.02.3 and earlier have a runtime bug that, on 64-bit
platforms, causes size arguments to internal memmove calls to be
sign-extended from 32- to 64-bits before being passed to the memmove
function. This leads to arguments between 2GiB and 4GiB being interpreted
as larger than they are (specifically, a bit below 2^64), causing a
buffer overflow. Further, arguments between 4GiB and 6GiB are interpreted
as 4GiB smaller than they should be, causing a possible information
leak. (CVE-2015-8869)
");
  script_tag(name: "affected", value: "ocaml on CentOS 7");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2016:1296");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2016-June/021933.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS7")
{

  if ((res = isrpmvuln(pkg:"ocaml", rpm:"ocaml~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-camlp4", rpm:"ocaml-camlp4~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-camlp4-devel", rpm:"ocaml-camlp4-devel~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-compiler-libs", rpm:"ocaml-compiler-libs~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-docs", rpm:"ocaml-docs~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-emacs", rpm:"ocaml-emacs~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-labltk", rpm:"ocaml-labltk~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-labltk-devel", rpm:"ocaml-labltk-devel~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-ocamldoc", rpm:"ocaml-ocamldoc~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-runtime", rpm:"ocaml-runtime~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-source", rpm:"ocaml-source~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"ocaml-x11", rpm:"ocaml-x11~4.01.0~22.7.el7_2", rls:"CentOS7")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}

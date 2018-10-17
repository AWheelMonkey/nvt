##############################################################################
# OpenVAS Vulnerability Test
# $Id: remote-web-arachni.nasl 11886 2018-10-12 13:48:53Z cfischer $
#
# Assess web security with arachni
#
# Authors:
# Michelangelo Sidagni <msidagni@nopsec.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.110001");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 11886 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:48:53 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-02-02 13:26:27 +0100 (Wed, 02 Feb 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("arachni (NASL wrapper)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2011 Michelangelo Sidagni");
  script_family("Web application abuses");
  script_add_preference(name:"Modules", type:"radio", value:"All;Audit;Recon");
  script_add_preference(name:"Concurrent Request Limit", type:"entry", value:"60");
  script_add_preference(name:"User Agent", type:"entry", value:"arachni");
  script_add_preference(name:"Authorized by", type:"entry", value:"arachni");
  script_add_preference(name:"Exclude URLs", type:"entry", value:"");
  script_add_preference(name:"Include URLs", type:"entry", value:"");
  script_add_preference(name:"Follow Subdomains", type:"checkbox", value:"no");
  script_add_preference(name:"Obey robot.txt", type:"checkbox", value:"no");
  script_add_preference(name:"Audit Headers", type:"checkbox", value:"no");
  script_add_preference(name:"Autologin Login URL", type:"entry", value:"http://url/loginpage");
  script_add_preference(name:"Autologin Login Parameters", type:"entry", value:"parameter-username=user&parameter-password=pass");
  script_add_preference(name:"Seed URL", type:"entry", value:"");
  script_add_preference(name:'Report broken arachni installation', value:'no', type:'checkbox');
  script_dependencies("find_service.nasl", "httpver.nasl", "http_login.nasl", "no404.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This plugin uses arachni ruby command line to find
web security issues.

See the preferences section for arachni options.

Note that the scanner is using limited set of arachni options.
Therefore, for more complete web assessment, you should
use standalone arachni tool for deeper/customized checks.");
  exit(0);
}

include("http_func.inc");

# Install Notes
# Before running this wrapper with Openvas make sure that:
# 1. You installed ruby version 1.9.2 and all arachni dependencies (for the gem install they are already included)
# 2. If you installed arachni 0.2.2 via the gem available on the web site, the arachni file is already on your path. Just make sure it is executable.
# 3. If you installed arachni 0.2.2 from github experimental branch, make sure that ./bin/arachni is executable and it is on your PATH.
# 4. You entered arachni path in your environmental variables: export PATH=$PATH:/path/to/your/arachni/install/bin/

if (! defined_func("pread"))
{
  set_kb_item(name: "/tmp/UnableToRun/40001", value: TRUE);
  #display("Script #40001 (arachni_wrapper) cannot run\n");
  exit(0);
}

arachni = "";
report_broken = script_get_preference("Report broken arachni installation");

if (  find_in_path("arachni.rb")  )
{
	arachni = "arachni.rb";
}
else if (  find_in_path("arachni")  )
{
	arachni = "arachni";
}
else
{
    if( report_broken != 'yes' ) exit( 0 );
    text = 'Arachni could not be found in your system path.\n';
    text += 'The scanner was unable to execute Arachni and to perform the scan you
requested.\nPlease make sure that Arachni is installed and that arachni is
available in the PATH variable defined for your environment.';
    log_message(port: 0, data: text);
    exit(0);
}

#user = get_kb_item("http/login");
#pass = get_kb_item("http/login");

port = get_http_port( default:80 );

repfilename =  get_tmp_dir() + "openvas-arachni-" + rand() + "-" + get_host_ip() + "-" + port + "-report.txt";

i = 0;
argv[i++] = arachni;
argv[i++] = "--report=txt:outfile=" + repfilename;

p = script_get_preference("Modules");

if (p == "All") argv[i++] = "--mods=*";
else if (p == "Audit") argv[i++] = "--mods=audit*";
else if (p == "Recon") argv[i++] = "--mods=recon*";

p = script_get_preference("Concurrent Request Limit");
if (p =~ '^[0-9]+$') { argv[i++] = "--http-req-limit=" + p; }

p = script_get_preference("User Agent");
if (p =~ '^[0-9a-zA-Z]+$') { argv[i++] = "--user-agent=" + p; }

p = script_get_preference("Authorized by");
if (p =~ '^[0-9a-zA-Z]+$') { argv[i++] = "--authed-by=" + p; }

p = script_get_preference("Exclude URLs");
if (p =~ '^[0-9a-zA-Z]+$') { argv[i++] = "--exclude=" + p; }

p = script_get_preference("Include URLs");
if (p =~ '^[0-9a-zA-Z]+$') { argv[i++] = "--include=" + p; }

p = script_get_preference("Follow Subdomains");
if ("yes" >< p) argv[i++] = "--follow-subdomains";

p = script_get_preference("Obey robot.txt");
if ("yes" >< p) argv[i++] = "--obey-robots-txt";

p = script_get_preference("Audit Headers");
if ("yes" >< p) argv[i++] = "--audit-headers";

p = script_get_preference("Autologin - Login URL");
r = script_get_preference("Autologin - Login Parameters");
if ((p =~ '^[0-9a-zA-Z]+$') || (r =~ '^[0-9a-zA-Z]+$')) { argv[i++] =  "--plugin=autologin:url=" + p; argv[i++] =","; argv[i++] = "params=" + r; }

encaps = get_port_transport(port);
if (encaps > ENCAPS_IP) httprefix="https://";
else httprefix="http://";

httpver = get_kb_item("http/"+port);
if (httpver == "11") {
	httparg=get_host_name();
} else {
	httparg=get_host_ip();
}

httpurl=httprefix+httparg+":"+port;

seed = script_get_preference ("Seed URL");
if (seed)
{
  if (ereg(pattern: "^/", string: seed))
  {
    httpurl = httpurl + seed;
  }
  else
  {
    httpurl = httpurl + "/" + seed;
  }
}

argv[i++] = httpurl;

r = pread(cmd: arachni, argv: argv, cd: 1);
if (! r) exit(0);	# error

function on_exit()
{
	if (file_stat (repfilename)) unlink(repfilename);
}

if (file_stat(repfilename)) {
	rfile=fread(repfilename);
	report = 'Here is the arachni report:\n';
	report += rfile;
	# rhttp=fread(httpfilename);
	if ('[~] Severity: High' >< report) {
		security_message(port: port, data: report);
		exit(0);
	}
	if ('[~] Severity: Medium' >< report) {
		security_message(port: port, data: report);
	        exit(0);
	} else {
		security_message(port: port, data: report);
		exit(0);
	}
} else {
        if( report_broken != 'yes' ) exit( 0 );
	text  = 'arachni report filename is empty. that could mean that\n';
	text += 'wrong version of arachni is used or tmp dir is not accessible.\n';
	text += 'In short: check installation of arachni and the scanner';
	log_message(port: port, data: text);
}


